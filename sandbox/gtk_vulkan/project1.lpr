program project1;

uses
 Classes,
// Passe diese Unit-Namen an deine Bindungen an:
//Gtk4, Adw, Vulkan, Wayland;
fp_vulkan,
  fp_glib2,
  fp_GTK4,
  fp_adwaita,

fp_wayland;


const
  X_POS = 100;
  Y_POS = 100;
  WIDTH = 400;
  HEIGHT = 400;

type
  PAppState = ^TAppState;
  TAppState = record
    Window, WlDisplay, WlSurfaceGtk, Compositor, Subcompositor, WlSurfaceVk, Region, Subsurface: Pointer;
    Instance: TVkInstance;
    Surface: TVkSurfaceKHR;
    PhysicalDevice: TVkPhysicalDevice;
    LogicalDevice: TVkDevice;
    GraphicQueue, PresentationQueue: TVkQueue;
    Swapchain: TVkSwapchainKHR;
    ImageCount: UInt32;
    SwapchainImages: ^TVkImage;
    ImageViews: ^TVkImageView;
    VertShaderModule, FragShaderModule: TVkShaderModule;
    RenderPass: TVkRenderPass;
    PipelineLayout: TVkPipelineLayout;
    Pipeline: TVkPipeline;
    Framebuffers: ^TVkFramebuffer;
    CommandPool: TVkCommandPool;
    CommandBuffers: ^TVkCommandBuffer;
    SemaphoreImageAvailable, SemaphoreRenderFinished: TVkSemaphore;
    LastTime: Int64;
    FPS: Integer;
  end;

  function ReadSPV(FileName: PChar; Size: Psize_t): Puint32_t;
  var
    buffer: Pgchar = nil;
    len: Tgsize = 0;
    err: PGError = nil;
  begin
    if g_file_get_contents(FileName, @buffer, @len, @err) then
    begin
      if Size <> nil then
        Size^ := len;
      Result := Puint32_t(buffer);
    end
    else
    begin
      if err <> nil then
      begin
        g_printerr('Konnte %s nicht öffnen: %s'#10, FileName, err^.message);
        g_clear_error(@err);
      end;
      if Size <> nil then
        Size^ := 0;
      Result := nil;
    end;
  end;
// Wayland Registry Callbacks
procedure registry_handler(data: Pointer; registry: Pwl_registry; id: UInt32; interface_: PChar; version: UInt32); cdecl;
var
  state: PAppState;
begin
  state := PAppState(data);

  if g_strcmp0(interface_, 'wl_compositor') = 0 then
  begin
    state^.compositor := wl_registry_bind(registry, id, @wl_compositor_interface, version);
  end
  else if g_strcmp0(interface_, 'wl_subcompositor') = 0 then
  begin
    state^.subcompositor := wl_registry_bind(registry, id, @wl_subcompositor_interface, version);
  end;
end;

procedure RegistryHandler(data: pointer; wl_registry: Pwl_registry; name: Tuint32_t; iface: pchar; version: Tuint32_t); cdecl;
var
  State: PAppState;
begin
  State := PAppState(data);
  if g_strcmp0(iface, 'wl_compositor') = 0 then
    State^.Compositor := wl_registry_bind(wl_registry, name, @wl_compositor_interface, version)
  else if g_strcmp0(iface, 'wl_subcompositor') = 0 then
    State^.Subcompositor := wl_registry_bind(wl_registry, name, @wl_subcompositor_interface, version);
end;

procedure RegistryRemover(data: pointer; wl_registry: Pwl_registry; name: Tuint32_t); cdecl;
begin
end;

const
  RegistryListener: Twl_registry_listener = (
    global: @RegistryHandler;
    global_remove: @RegistryRemover
  );

// Frame rendern
procedure DrawFrame(State: PAppState);
var
  ImageIndex, WaitStages: UInt32;
  Res: Integer;
  SubmitInfo: TVkSubmitInfo;
  PresentInfo: TVkPresentInfoKHR;
begin
  Res := vkAcquireNextImageKHR(State^.LogicalDevice, State^.Swapchain, High(QWord), State^.SemaphoreImageAvailable, 0, @ImageIndex);
  if (Res <> VK_SUCCESS) and (Res <> VK_NOT_READY) then Exit;

  WaitStages := VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;

  FillChar(SubmitInfo, SizeOf(SubmitInfo), 0);
  SubmitInfo.sType := VK_STRUCTURE_TYPE_SUBMIT_INFO;
  SubmitInfo.waitSemaphoreCount := 1;
  SubmitInfo.pWaitSemaphores := @State^.SemaphoreImageAvailable;
  SubmitInfo.pWaitDstStageMask := @WaitStages;
  SubmitInfo.commandBufferCount := 1;
  SubmitInfo.pCommandBuffers := @State^.CommandBuffers[ImageIndex];
  SubmitInfo.signalSemaphoreCount := 1;
  SubmitInfo.pSignalSemaphores := @State^.SemaphoreRenderFinished;

  vkQueueSubmit(State^.GraphicQueue, 1, @SubmitInfo, 0);

  FillChar(PresentInfo, SizeOf(PresentInfo), 0);
  PresentInfo.sType := VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
  PresentInfo.waitSemaphoreCount := 1;
  PresentInfo.pWaitSemaphores := @State^.SemaphoreRenderFinished;
  PresentInfo.swapchainCount := 1;
  PresentInfo.pSwapchains := @State^.Swapchain;
  PresentInfo.pImageIndices := @ImageIndex;

  vkQueuePresentKHR(State^.PresentationQueue, @PresentInfo);
end;

// Main-Loop Callback
function OnTick(widget: PGtkWidget; frame_clock: PGdkFrameClock;  user_data: Tgpointer): Tgboolean; cdecl;
var
  State: PAppState;
  CurrentTime: Int64;
begin
  State := PAppState(user_data);
  Inc(State^.FPS);

  CurrentTime := g_get_monotonic_time div 1000;
  if CurrentTime - State^.LastTime >= 1000 then
  begin
    State^.LastTime := CurrentTime;
    WriteLn('FPS: ', State^.FPS);
    State^.FPS := 0;
  end;

  DrawFrame(State);
  Result := True;
end;

// Ressourcen freigeben bei Beenden
function OnCloseRequest(window: Pointer; user_data: Pointer): LongBool; cdecl;
var
  State: PAppState;
  i: UInt32;
begin
  State := PAppState(user_data);

  vkDeviceWaitIdle(State^.LogicalDevice);

  vkDestroySemaphore(State^.LogicalDevice, State^.SemaphoreImageAvailable, nil);
  vkDestroySemaphore(State^.LogicalDevice, State^.SemaphoreRenderFinished, nil);
  vkDestroyCommandPool(State^.LogicalDevice, State^.CommandPool, nil);

  for i := 0 to State^.ImageCount - 1 do
  begin
    vkDestroyFramebuffer(State^.LogicalDevice, State^.Framebuffers[i], nil);
    vkDestroyImageView(State^.LogicalDevice, State^.ImageViews[i], nil);
  end;

  FreeMem(State^.Framebuffers);
  FreeMem(State^.ImageViews);
  FreeMem(State^.SwapchainImages);
  FreeMem(State^.CommandBuffers);

  vkDestroyPipeline(State^.LogicalDevice, State^.Pipeline, nil);
  vkDestroyPipelineLayout(State^.LogicalDevice, State^.PipelineLayout, nil);
  vkDestroyRenderPass(State^.LogicalDevice, State^.RenderPass, nil);
  vkDestroyShaderModule(State^.LogicalDevice, State^.FragShaderModule, nil);
  vkDestroyShaderModule(State^.LogicalDevice, State^.VertShaderModule, nil);
  vkDestroySwapchainKHR(State^.LogicalDevice, State^.Swapchain, nil);
  vkDestroyDevice(State^.LogicalDevice, nil);
  vkDestroySurfaceKHR(State^.Instance, State^.Surface, nil);
  vkDestroyInstance(State^.Instance, nil);

  if State^.Subsurface <> nil then wl_proxy_destroy(State^.Subsurface);
  if State^.WlSurfaceVk <> nil then wl_proxy_destroy(State^.WlSurfaceVk);
  if State^.Region <> nil then wl_proxy_destroy(State^.Region);

  Result := False;
end;

// Application Activation Callback
procedure OnActivate(app: Pointer; user_data: Pointer); cdecl;
var
  State: PAppState;
  GdkSurface, GdkDisplay, Registry: Pointer;
  AppInfo: TVkApplicationInfo;
  InstanceCreateInfo: TVkInstanceCreateInfo;
  ExtNames: array[0..2] of PChar = ('VK_KHR_surface', 'VK_KHR_wayland_surface', 'VK_EXT_debug_report');
  WaylandSurfaceCreateInfo: TVkWaylandSurfaceCreateInfoKHR;
  DeviceCount, QueueFamilyCount, GraphicsIdx, i: UInt32;
  PhysicalDevices: array of TVkPhysicalDevice;
  Props: TVkPhysicalDeviceProperties;
  QueueFamilies: array of TVkQueueFamilyProperties;
  SupportPresent: LongBool;
  QueuePriority: Single;
  QueueCreateInfo: TVkDeviceQueueCreateInfo;
  DeviceExtNames: array[0..0] of PChar = (VK_KHR_SWAPCHAIN_EXTENSION_NAME);
  DeviceCreateInfo: TVkDeviceCreateInfo;
  Capabilities: TVkSurfaceCapabilitiesKHR;
  Extent: TVkExtent2D;
  SwapchainCreateInfo: TVkSwapchainCreateInfoKHR;
  ViewCreateInfo: TVkImageViewCreateInfo;
  VertSize, FragSize: SizeInt;
  VertCode, FragCode: PUInt32;
  VertInfo, FragInfo: TVkShaderModuleCreateInfo;
  ColorAttachment: TVkAttachmentDescription;
  ColorRef: TVkAttachmentReference;
  Subpass: TVkSubpassDescription;
  Dependency: TVkSubpassDependency;
  RenderPassCreateInfo: TVkRenderPassCreateInfo;
  ShaderStages: array[0..1] of TVkPipelineShaderStageCreateInfo;
  VertexInput: TVkPipelineVertexInputStateCreateInfo;
  InputAssembly: TVkPipelineInputAssemblyStateCreateInfo;
  Viewport: TVkViewport;
  Scissor: TVkRect2D;
  ViewportState: TVkPipelineViewportStateCreateInfo;
  Rasterizer: TVkPipelineRasterizationStateCreateInfo;
  Multisampling: TVkPipelineMultisampleStateCreateInfo;
  ColorBlendAttachment: TVkPipelineColorBlendAttachmentState;
  ColorBlending: TVkPipelineColorBlendStateCreateInfo;
  PipelineLayoutCreateInfo: TVkPipelineLayoutCreateInfo;
  PipelineCreateInfo: TVkGraphicsPipelineCreateInfo;
  FramebufferCreateInfo: TVkFramebufferCreateInfo;
  CommandPoolCreateInfo: TVkCommandPoolCreateInfo;
  AllocInfo: TVkCommandBufferAllocateInfo;
  BeginInfo: TVkCommandBufferBeginInfo;
  ClearColor: TVkClearValue;
  RenderPassBeginInfo: TVkRenderPassBeginInfo;
  SemaphoreCreateInfo: TVkSemaphoreCreateInfo;
begin
  State := PAppState(user_data);

  // 1. Libadwaita Window Erstellung
  State^.Window := adw_application_window_new(app);
  gtk_window_set_default_size(State^.Window, 600, 600);
  gtk_window_set_title(State^.Window, 'Libadwaita + Vulkan (Lazarus)');
  gtk_widget_set_size_request(State^.Window, 600, 600);
  gtk_window_present(State^.Window);

  GdkSurface := gtk_native_get_surface(gtk_widget_get_native(State^.Window));
  GdkDisplay := gdk_surface_get_display(GdkSurface);

  State^.WlDisplay := gdk_wayland_display_get_wl_display(GdkDisplay);
  State^.WlSurfaceGtk := gdk_wayland_surface_get_wl_surface(GdkSurface);

  // 2. Wayland Subsurface Verknüpfung
  Registry := wl_display_get_registry(State^.WlDisplay);
  wl_proxy_add_listener(Registry, @RegistryListener, State);
  wl_display_dispatch(State^.WlDisplay);
  wl_display_roundtrip(State^.WlDisplay);

  state^.wlsurfacevk := wl_compositor_create_surface(state^.compositor);
  state^.region := wl_compositor_create_region(state^.compositor);  WriteLn(PtrUInt(state^.region));
  wl_region_add(state^.region, 0, 0, WIDTH, HEIGHT);
  wl_surface_set_opaque_region(state^.wlsurfacevk, state^.region);

  state^.subsurface := wl_subcompositor_get_subsurface(state^.subcompositor, state^.wlsurfacevk, state^.WlSurfaceGtk);
  wl_subsurface_set_position(state^.subsurface, X_POS, Y_POS);
  wl_subsurface_set_sync(state^.subsurface);

  // 3. Vulkan Instance & Surface Initialisierung
  FillChar(AppInfo, SizeOf(AppInfo), 0);
  AppInfo.sType := VK_STRUCTURE_TYPE_APPLICATION_INFO;
  AppInfo.pApplicationName := 'Hello Triangle';
  AppInfo.apiVersion := (1 shl 22);

  FillChar(InstanceCreateInfo, SizeOf(InstanceCreateInfo), 0);
  InstanceCreateInfo.sType := VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
  InstanceCreateInfo.pApplicationInfo := @AppInfo;
  InstanceCreateInfo.enabledExtensionCount := 3;
  InstanceCreateInfo.ppEnabledExtensionNames := PPChar(@ExtNames[0]);

  vkCreateInstance(@InstanceCreateInfo, nil, @State^.Instance);

  FillChar(WaylandSurfaceCreateInfo, SizeOf(WaylandSurfaceCreateInfo), 0);
  WaylandSurfaceCreateInfo.sType := VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR;
  WaylandSurfaceCreateInfo.display := State^.WlDisplay;
  WaylandSurfaceCreateInfo.surface := State^.WlSurfaceVk;

  vkCreateWaylandSurfaceKHR(State^.Instance, @WaylandSurfaceCreateInfo, nil, @State^.Surface);

  // Physical & Logical Device Auswahl
  DeviceCount := 0;
  vkEnumeratePhysicalDevices(State^.Instance, @DeviceCount, nil);
  SetLength(PhysicalDevices, DeviceCount);
  vkEnumeratePhysicalDevices(State^.Instance, @DeviceCount, @PhysicalDevices[0]);
  State^.PhysicalDevice := PhysicalDevices[0];

  vkGetPhysicalDeviceProperties(State^.PhysicalDevice, @Props);
  WriteLn('Selected device: ', Props.deviceName);

  QueueFamilyCount := 0;
  vkGetPhysicalDeviceQueueFamilyProperties(State^.PhysicalDevice, @QueueFamilyCount, nil);
  SetLength(QueueFamilies, QueueFamilyCount);
  vkGetPhysicalDeviceQueueFamilyProperties(State^.PhysicalDevice, @QueueFamilyCount, @QueueFamilies[0]);

  GraphicsIdx := 0;
  for i := 0 to QueueFamilyCount - 1 do
  begin
    SupportPresent := False;
    vkGetPhysicalDeviceSurfaceSupportKHR(State^.PhysicalDevice, i, State^.Surface, @SupportPresent);
    if (QueueFamilies[i].queueCount > 0) and ((QueueFamilies[i].queueFlags and VK_QUEUE_GRAPHICS_BIT) <> 0) then
    begin
      GraphicsIdx := i;
      Break;
    end;
  end;

  QueuePriority := 1.0;
  FillChar(QueueCreateInfo, SizeOf(QueueCreateInfo), 0);
  QueueCreateInfo.sType := VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
  QueueCreateInfo.queueFamilyIndex := GraphicsIdx;
  QueueCreateInfo.queueCount := 1;
  QueueCreateInfo.pQueuePriorities := @QueuePriority;

  FillChar(DeviceCreateInfo, SizeOf(DeviceCreateInfo), 0);
  DeviceCreateInfo.sType := VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
  DeviceCreateInfo.pQueueCreateInfos := @QueueCreateInfo;
  DeviceCreateInfo.queueCreateInfoCount := 1;
  DeviceCreateInfo.enabledExtensionCount := 1;
  DeviceCreateInfo.ppEnabledExtensionNames := PPChar(@DeviceExtNames[0]);

  vkCreateDevice(State^.PhysicalDevice, @DeviceCreateInfo, nil, @State^.LogicalDevice);
  vkGetDeviceQueue(State^.LogicalDevice, GraphicsIdx, 0, @State^.GraphicQueue);
  vkGetDeviceQueue(State^.LogicalDevice, GraphicsIdx, 0, @State^.PresentationQueue);

  // Swapchain
  vkGetPhysicalDeviceSurfaceCapabilitiesKHR(State^.PhysicalDevice, State^.Surface, @Capabilities);
  Extent.width := WIDTH;
  Extent.height := HEIGHT;
  State^.ImageCount := Capabilities.minImageCount + 1;

  FillChar(SwapchainCreateInfo, SizeOf(SwapchainCreateInfo), 0);
  SwapchainCreateInfo.sType := VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
  SwapchainCreateInfo.surface := State^.Surface;
  SwapchainCreateInfo.minImageCount := State^.ImageCount;
  SwapchainCreateInfo.imageFormat := VK_FORMAT_B8G8R8A8_UNORM;
  SwapchainCreateInfo.imageColorSpace := VK_COLOR_SPACE_SRGB_NONLINEAR_KHR;
  SwapchainCreateInfo.imageExtent := Extent;
  SwapchainCreateInfo.imageArrayLayers := 1;
  SwapchainCreateInfo.imageUsage := VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
  SwapchainCreateInfo.imageSharingMode := VK_SHARING_MODE_EXCLUSIVE;
  SwapchainCreateInfo.preTransform := Capabilities.currentTransform;
  SwapchainCreateInfo.compositeAlpha := 1;
  SwapchainCreateInfo.presentMode := VK_PRESENT_MODE_FIFO_KHR;
  SwapchainCreateInfo.clipped := True;

  vkCreateSwapchainKHR(State^.LogicalDevice, @SwapchainCreateInfo, nil, @State^.Swapchain);

  vkGetSwapchainImagesKHR(State^.LogicalDevice, State^.Swapchain, @State^.ImageCount, nil);
  GetMem(State^.SwapchainImages, SizeOf(TVkImage) * State^.ImageCount);
  GetMem(State^.ImageViews, SizeOf(TVkImageView) * State^.ImageCount);
  vkGetSwapchainImagesKHR(State^.LogicalDevice, State^.Swapchain, @State^.ImageCount, State^.SwapchainImages);

  for i := 0 to State^.ImageCount - 1 do  begin
    FillChar(ViewCreateInfo, SizeOf(ViewCreateInfo), 0);
    ViewCreateInfo.sType := VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
    ViewCreateInfo.image := State^.SwapchainImages[i];
    ViewCreateInfo.viewType := VK_IMAGE_VIEW_TYPE_2D;
    ViewCreateInfo.format := VK_FORMAT_B8G8R8A8_UNORM;
    ViewCreateInfo.subresourceRange.aspectMask := VK_IMAGE_ASPECT_COLOR_BIT;
    ViewCreateInfo.subresourceRange.levelCount := 1;
    ViewCreateInfo.subresourceRange.layerCount := 1;
    vkCreateImageView(State^.LogicalDevice, @ViewCreateInfo, nil, @State^.ImageViews[i]);
  end;

  // Shader
  VertCode := ReadSPV('vert.spv', @VertSize);
  FragCode := ReadSPV('frag.spv', @FragSize);

  FillChar(VertInfo, SizeOf(VertInfo), 0);
  VertInfo.sType := VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO;
  VertInfo.codeSize := VertSize;
  VertInfo.pCode := VertCode;

  FillChar(FragInfo, SizeOf(FragInfo), 0);
  FragInfo.sType := VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO;
  FragInfo.codeSize := FragSize;
  FragInfo.pCode := FragCode;
  vkCreateShaderModule(State^.LogicalDevice, @VertInfo, nil, @State^.VertShaderModule);
  vkCreateShaderModule(State^.LogicalDevice, @FragInfo, nil, @State^.FragShaderModule);
  g_free(VertCode);
  g_free(FragCode);

  // Render Pass
  FillChar(ColorAttachment, SizeOf(ColorAttachment), 0);
  ColorAttachment.format := VK_FORMAT_B8G8R8A8_UNORM;
  ColorAttachment.samples := VK_SAMPLE_COUNT_1_BIT;
  ColorAttachment.loadOp := VK_ATTACHMENT_LOAD_OP_CLEAR;
  ColorAttachment.storeOp := VK_ATTACHMENT_STORE_OP_STORE;
  ColorAttachment.initialLayout := VK_IMAGE_LAYOUT_UNDEFINED;
  ColorAttachment.finalLayout := VK_IMAGE_LAYOUT_PRESENT_SRC_KHR;

  ColorRef.attachment := 0;
  ColorRef.layout := VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;

  FillChar(Subpass, SizeOf(Subpass), 0);
  Subpass.pipelineBindPoint := VK_PIPELINE_BIND_POINT_GRAPHICS;
  Subpass.colorAttachmentCount := 1;
  Subpass.pColorAttachments := @ColorRef;

  FillChar(Dependency, SizeOf(Dependency), 0);
  Dependency.srcSubpass := $FFFFFFFF;
  Dependency.dstSubpass := 0;
  Dependency.srcStageMask := VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
  Dependency.dstStageMask := VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
  Dependency.dstAccessMask := VK_ACCESS_COLOR_ATTACHMENT_READ_BIT or VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;

  FillChar(RenderPassCreateInfo, SizeOf(RenderPassCreateInfo), 0);
  RenderPassCreateInfo.sType := VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO;
  RenderPassCreateInfo.attachmentCount := 1;
  RenderPassCreateInfo.pAttachments := @ColorAttachment;
  RenderPassCreateInfo.subpassCount := 1;
  RenderPassCreateInfo.pSubpasses := @Subpass;
  RenderPassCreateInfo.dependencyCount := 1;
  RenderPassCreateInfo.pDependencies := @Dependency;

  vkCreateRenderPass(State^.LogicalDevice, @RenderPassCreateInfo, nil, @State^.RenderPass);

  // Pipeline Layout & Pipeline
  FillChar(ShaderStages[0], SizeOf(TVkPipelineShaderStageCreateInfo) * 2, 0);
  ShaderStages[0].sType := VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;
  ShaderStages[0].stage := VK_SHADER_STAGE_VERTEX_BIT;
  ShaderStages[0].module := State^.VertShaderModule;
  ShaderStages[0].pName := 'main';

  ShaderStages[1].sType := VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;
  ShaderStages[1].stage := VK_SHADER_STAGE_FRAGMENT_BIT;
  ShaderStages[1].module := State^.FragShaderModule;
  ShaderStages[1].pName := 'main';

  FillChar(VertexInput, SizeOf(VertexInput), 0);
  VertexInput.sType := VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO;

  FillChar(InputAssembly, SizeOf(InputAssembly), 0);
  InputAssembly.sType := VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO;
  InputAssembly.topology := VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST;

  Viewport.x := 0.0; Viewport.y := 0.0;
  Viewport.width := WIDTH; Viewport.height := HEIGHT;
  Viewport.minDepth := 0.0; Viewport.maxDepth := 1.0;

  Scissor.offset.x := 0; Scissor.offset.y := 0;
  Scissor.extent := Extent;

  FillChar(ViewportState, SizeOf(ViewportState), 0);
  ViewportState.sType := VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO;
  ViewportState.viewportCount := 1; ViewportState.pViewports := @Viewport;
  ViewportState.scissorCount := 1; ViewportState.pScissors := @Scissor;

  FillChar(Rasterizer, SizeOf(Rasterizer), 0);
  Rasterizer.sType := VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO;
  Rasterizer.polygonMode := VK_POLYGON_MODE_FILL;
  Rasterizer.cullMode := VK_CULL_MODE_BACK_BIT;
  Rasterizer.frontFace := VK_FRONT_FACE_CLOCKWISE;
  Rasterizer.lineWidth := 1.0;

  FillChar(Multisampling, SizeOf(Multisampling), 0);
  Multisampling.sType := VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO;
  Multisampling.rasterizationSamples := VK_SAMPLE_COUNT_1_BIT;

  FillChar(ColorBlendAttachment, SizeOf(ColorBlendAttachment), 0);
  ColorBlendAttachment.colorWriteMask := VK_COLOR_COMPONENT_R_BIT or VK_COLOR_COMPONENT_G_BIT or VK_COLOR_COMPONENT_B_BIT or VK_COLOR_COMPONENT_A_BIT;

  FillChar(ColorBlending, SizeOf(ColorBlending), 0);
  ColorBlending.sType := VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO;
  ColorBlending.attachmentCount := 1; ColorBlending.pAttachments := @ColorBlendAttachment;

  FillChar(PipelineLayoutCreateInfo, SizeOf(PipelineLayoutCreateInfo), 0);
  PipelineLayoutCreateInfo.sType := VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO;
  vkCreatePipelineLayout(State^.LogicalDevice, @PipelineLayoutCreateInfo, nil, @State^.PipelineLayout);

  FillChar(PipelineCreateInfo, SizeOf(PipelineCreateInfo), 0);
  PipelineCreateInfo.sType := VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO;
  PipelineCreateInfo.stageCount := 2;
  PipelineCreateInfo.pStages := ShaderStages;
  PipelineCreateInfo.pVertexInputState := @VertexInput;
  PipelineCreateInfo.pInputAssemblyState := @InputAssembly;
  PipelineCreateInfo.pViewportState := @ViewportState;
  PipelineCreateInfo.pRasterizationState := @Rasterizer;
  PipelineCreateInfo.pMultisampleState := @Multisampling;
  PipelineCreateInfo.pColorBlendState := @ColorBlending;
  PipelineCreateInfo.layout := State^.PipelineLayout;
  PipelineCreateInfo.renderPass := State^.RenderPass;

  vkCreateGraphicsPipelines(State^.LogicalDevice, VK_NULL_HANDLE, 1, @PipelineCreateInfo, nil, @State^.Pipeline);

  // Framebuffers
  GetMem(State^.Framebuffers, SizeOf(TVkFramebuffer) * State^.ImageCount);
  for i := 0 to State^.ImageCount - 1 do
  begin
    FillChar(FramebufferCreateInfo, SizeOf(FramebufferCreateInfo), 0);
    FramebufferCreateInfo.sType := VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO;
    FramebufferCreateInfo.renderPass := State^.RenderPass;
    FramebufferCreateInfo.attachmentCount := 1;
    FramebufferCreateInfo.pAttachments := @State^.ImageViews[i];
    FramebufferCreateInfo.width := WIDTH; FramebufferCreateInfo.height := HEIGHT; FramebufferCreateInfo.layers := 1;
    vkCreateFramebuffer(State^.LogicalDevice, @FramebufferCreateInfo, nil, @State^.Framebuffers[i]);
  end;

  // Command Pool & Buffers
  FillChar(CommandPoolCreateInfo, SizeOf(CommandPoolCreateInfo), 0);
  CommandPoolCreateInfo.sType := VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO;
  CommandPoolCreateInfo.queueFamilyIndex := GraphicsIdx;
  vkCreateCommandPool(State^.LogicalDevice, @CommandPoolCreateInfo, nil, @State^.CommandPool);

  GetMem(State^.CommandBuffers, SizeOf(TVkCommandBuffer) * State^.ImageCount);
  FillChar(AllocInfo, SizeOf(AllocInfo), 0);
  AllocInfo.sType := VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO;
  AllocInfo.commandPool := State^.CommandPool;
  AllocInfo.level := VK_COMMAND_BUFFER_LEVEL_PRIMARY;
  AllocInfo.commandBufferCount := State^.ImageCount;
  vkAllocateCommandBuffers(State^.LogicalDevice, @AllocInfo, State^.CommandBuffers);

  for i := 0 to State^.ImageCount - 1 do  begin
    FillChar(BeginInfo, SizeOf(BeginInfo), 0);
    BeginInfo.sType := VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
    BeginInfo.flags := VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT;

    vkBeginCommandBuffer(State^.CommandBuffers[i], @BeginInfo);

    ClearColor.color.float32[0] := 0.0;
    ClearColor.color.float32[1] := 1.0; // Grüner Hintergrund
    ClearColor.color.float32[2] := 0.0;
    ClearColor.color.float32[3] := 1.0;

    FillChar(RenderPassBeginInfo, SizeOf(RenderPassBeginInfo), 0);
    RenderPassBeginInfo.sType := VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO;
    RenderPassBeginInfo.renderPass := State^.RenderPass;
    RenderPassBeginInfo.framebuffer := State^.Framebuffers[i];
    RenderPassBeginInfo.renderArea.extent := Extent;
    RenderPassBeginInfo.clearValueCount := 1;
    RenderPassBeginInfo.pClearValues := @ClearColor;

    vkCmdBeginRenderPass(State^.CommandBuffers[i], @RenderPassBeginInfo, VK_SUBPASS_CONTENTS_INLINE);
    vkCmdBindPipeline(State^.CommandBuffers[i], VK_PIPELINE_BIND_POINT_GRAPHICS, State^.Pipeline);
    vkCmdSetViewport(State^.CommandBuffers[i], 0, 1, @Viewport);
    vkCmdDraw(State^.CommandBuffers[i], 3, 1, 0, 0);
    vkCmdEndRenderPass(State^.CommandBuffers[i]);
    vkEndCommandBuffer(State^.CommandBuffers[i]);
  end;

  // Semaphores
  FillChar(SemaphoreCreateInfo, SizeOf(SemaphoreCreateInfo), 0);
  SemaphoreCreateInfo.sType := VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;
  vkCreateSemaphore(State^.LogicalDevice, @SemaphoreCreateInfo, nil, @State^.SemaphoreImageAvailable);
  vkCreateSemaphore(State^.LogicalDevice, @SemaphoreCreateInfo, nil, @State^.SemaphoreRenderFinished);

  // GTK Callbacks verbinden
  g_signal_connect_data(State^.Window, 'close-request',G_CALLBACK(@OnCloseRequest), State, nil, 0);
  gtk_widget_add_tick_callback(State^.Window, @OnTick, State, nil);

  State^.LastTime := g_get_monotonic_time div 1000;
end;

var
  State: TAppState;
  Status: Integer;
  app: PGtkApplication;
begin
  FillChar(State, SizeOf(TAppState), 0);
  app := gtk_application_new('com.github.omnp.Example4', G_APPLICATION_DEFAULT_FLAGS);
  g_signal_connect(App, 'activate',G_CALLBACK( @OnActivate), @State);

  Status := g_application_run(G_APPLICATION(app), argc, argv);
  g_object_unref(App);

  Halt(Status);
end.
