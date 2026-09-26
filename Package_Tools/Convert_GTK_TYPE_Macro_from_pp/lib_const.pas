unit lib_const;

interface

type
  TSource = record
    libs,
    units: string;
  end;
  TSources = array of TSource;

const
  Sources: TSources = (
    (libs: 'libgdk_pixbuf2'; units: 'glib280, gdk_pixbuf_core'),
    (libs: 'libgdk_pixbuf_xlib2'; units: 'glib280'),

    (libs: 'libpixman'; units: 'ctypes'),
    (libs: 'libgraphene'; units: 'ctypes, graphene'),
    (libs: 'libpango'; units: 'fp_cairo, fp_glib2'),

    (libs: 'libharfbuzzgobject'; units: 'fp_glib2, hb_common'),
    (libs: 'libharfbuzzset'; units: 'fp_glib2, hb_common'),
    (libs: 'libharfbuzzcairo'; units: 'fp_glib2, hb_common'),
    (libs: 'libharfbuzzicu'; units: 'fp_glib2, hb_common'),
    (libs: 'libharfbuzz'; units: 'fp_glib2, hb_common'),

    (libs: 'libwebkit'; units: 'fp_glib2, fp_GTK4, WebKit'),
    (libs: 'libjavascriptcoregtk'; units: 'fp_glib2'),

    (libs: 'libadwaita'; units: 'fp_glib2, fp_GTK4'),
    (libs: 'libvte_2_91_gtk4 '; units: 'fp_glib2, fp_GTK4'),
    (libs: 'libgtksourceview5'; units: 'fp_glib2, fp_GTK4'),

    (libs: 'libxml2'; units: 'ctypes, xml2_common'),
    (libs: 'libmicrohttpd'; units: 'ctypes'),
    (libs: 'libchafa'; units: 'fp_glib2'),

    (libs: 'libtk8_6'; units: 'ctypes'),
    (libs: 'libtkstub8_6'; units: 'ctypes'),
    (libs: 'libtcl8_6'; units: 'ctypes'),
    (libs: 'libtclstub8_6'; units: 'ctypes'),

    (libs: 'libttommath'; units: 'ctypes'),
    (libs: 'libgmp'; units: 'ctypes'),


    (libs: 'libnewt'; units: 'ctypes'),
    (libs: 'libtickit'; units: 'ctypes'),
    (libs: 'libcdk'; units: 'ctypes, ncurses, cdk'),

    (libs: 'libsixel'; units: 'ctypes'),

    (libs: 'librtlsdr'; units: 'ctypes'),


    (libs: 'libevas'; units: 'ctypes, efl'),
    (libs: 'libeina'; units: 'ctypes, efl'),
    (libs: 'libeo'; units: 'ctypes, efl'),
    (libs: 'libefl'; units: 'efl, fp_eo, fp_eina'),
    (libs: 'libemile'; units: 'efl, fp_eo, fp_eina'),
    (libs: 'libecore'; units: 'efl, fp_eo, fp_eina, fp_efl'),
    (libs: 'libecore_file'; units: 'efl, fp_eo, fp_eina, fp_efl'),
    (libs: 'libecore_eva'; units: 'efl, fp_eo, fp_eina, fp_efl'),
    (libs: 'libedje'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_evas'),
    (libs: 'libeet'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_edje'),
    (libs: 'libethumb'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_edje'),
    (libs: 'libelementary'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary'),
    (libs: 'libecore_con'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libeldbus'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libefreet'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libemotion'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libeio'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libeeze'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libeolian'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_audio'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_x'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libefl_canvas_wl'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_drm2'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_fb'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),

    (libs: 'libecore_imf'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_imf_evas'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_input'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_input_evas'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_ipc'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_wl2'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libelput'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libembryo'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libethumb_client'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),

    (libs: 'libshaderc'; units: 'ctypes'),
    (libs: 'libglfw'; units: 'ctypes'),
    (libs: 'libglut'; units: 'ctypes'),
    (libs: 'libGLEW'; units: 'ctypes'),
    (libs: 'libGLX'; units: 'ctypes'),
    (libs: 'libGLXEW'; units: 'ctypes'),

    (libs: 'libmgl'; units: 'ctypes'),

    (libs: 'libpciaccess'; units: 'ctypes'),
    (libs: 'libpci'; units: 'ctypes'),

    (libs: 'libgnutls'; units: 'ctypes'),
    (libs: 'libcurl'; units: 'ctypes'),

    (libs: 'libpam'; units: 'ctypes'),
    (libs: 'libpamc'; units: 'ctypes'),
    (libs: 'libpam_misc'; units: 'ctypes'),
    (libs: 'libsystemd'; units: 'ctypes'),



    (libs: 'libibus'; units: 'fp_glib2, ibus'),

    (libs: 'libgraphite2'; units: 'ctypes'),
    (libs: 'libfontconfig'; units: 'ctypes'),
    (libs: 'libdbus_1 '; units: 'ctypes'),
    (libs: 'libraw '; units: 'ctypes'),
    (libs: 'libudev '; units: 'ctypes'),

    (libs: 'libpoppler_glib'; units: 'fp_glib2, fp_cairo'),

    (libs: 'libtesseract'; units: 'ctypes'),
    (libs: 'libleptb'; units: 'fp_lept'),

    (libs: 'libgslcblas'; units: 'fp_gsl'),
    (libs: 'libgsl'; units: 'fp_gsl'),

    (libs: 'libhidapi_hidraw'; units: 'ctypes'),
    (libs: 'libhidapi_libusb'; units: 'ctypes'),

    (libs: 'libevent'; units: 'fp_event'),
    (libs: 'libreadline'; units: 'fp_readline'),
    (libs: 'libportal'; units: 'fp_glib2, fp_portal'),

    (libs: 'libproxy'; units: 'fp_glib2'),
    (libs: 'libpcap'; units: 'ctypes'),
    (libs: 'libfuse3'; units: 'fp_fuse'),

    (libs: 'libpeas2'; units: 'fp_glib2, fp_peas2'),


    (libs: 'libltdl'; units: 'fp_ltdl'),
    (libs: 'libelf'; units: 'fp_elf'),
    (libs: 'libtcod'; units: 'fp_tcod'),
    (libs: 'libinput'; units: 'fp_libudev'),

    (libs: 'libc'; units: 'ctypes'),

    (libs: 'libsndfile'; units: 'ctypes'),

    (libs: 'libjsonglib'; units: 'fp_json_glib'),
    (libs: 'libgsound'; units: 'fp_glib2'),
    (libs: 'libgmime3'; units: 'fp_glib2, fp_gmime3'),

    (libs: 'libsfml_audio'; units: 'fp_sfml'),
    (libs: 'libsfml_graphics'; units: 'fp_sfml'),
    (libs: 'libsfml_network'; units: 'fp_sfml'),
    (libs: 'libsfml_system'; units: 'fp_sfml'),
    (libs: 'libsfml_window'; units: 'fp_sfml'),

    (libs: 'libcanberra'; units: 'fp_canberra'),
    (libs: 'libgbm'; units: 'ctypes'),
    (libs: 'libsoup'; units: 'fp_glib2, fp_soup'),
    (libs: 'libxmlb'; units: 'fp_glib2, fp_xmlb'),

    (libs: 'libvlc'; units: 'fp_vlc'),
    (libs: 'libxcbxxx'; units: 'fp_xcb'),

    (libs: 'libgirepository2'; units: 'fp_glib2, fp_girepository, gitypes, gibaseinfo'),

    (libs: 'libffi'; units: 'ctypes'),

    (libs: 'libgtop2'; units: 'fp_glib2, fp_libgtop2'),

    (libs: 'libcolord_gtk'; units: 'fp_glib2, fp_GTK4, fp_colord'),
    (libs: 'libcolord'; units: 'fp_glib2, fp_colord'),

    (libs: 'libexpat'; units: 'fp_libexpat'),
    (libs: 'libmxml'; units: 'ctypes'),

    (libs: 'libamd'; units: 'fp_suitesparse'),
    (libs: 'libbtf'; units: 'fp_suitesparse'),
    (libs: 'libcamd'; units: 'fp_suitesparse'),
    (libs: 'libccolamd'; units: 'fp_suitesparse'),
    (libs: 'libcholmod'; units: 'fp_suitesparse'),
    (libs: 'libcolamd'; units: 'fp_suitesparse'),
    (libs: 'libklu'; units: 'fp_suitesparse'),
    (libs: 'libklu_cholmod'; units: 'fp_suitesparse'),
    (libs: 'libldl'; units: 'fp_suitesparse'),
    (libs: 'libumfpack'; units: 'fp_suitesparse'),

    (libs: 'libespeak_ng'; units: 'ctypes'),
    (libs: 'liblapacke'; units: 'ctypes'),

    (libs: 'libopenblas'; units: 'ctypes'),
    (libs: 'libusb'; units: 'ctypes'),

    (libs: 'libportmidi'; units: 'ctypes'),

    (libs: 'libmpfr'; units: 'ctypes'),
    (libs: 'libmpfi'; units: 'ctypes'),
    (libs: 'libmpc'; units: 'ctypes'),

    (libs: 'libgeocode_glib'; units: 'fp_glib2'),
    (libs: 'libsane'; units: 'ctypes'),

    (libs: 'libgphoto2'; units: 'fp_glib2, fp_libgphoto2'),

    (libs: 'libsoundio'; units: 'ctypes'),
    (libs: 'libcrypt'; units: 'ctypes'),

    (libs: 'libasound'; units: 'fp_asound'),
    (libs: 'libserd0'; units: 'ctypes'),
    (libs: 'libsord0'; units: 'ctypes'),
    (libs: 'liblilv0'; units: 'ctypes'),
    (libs: 'librdf'; units: 'ctypes'),
    (libs: 'libraptor2'; units: 'ctypes'),
    (libs: 'libsratom0'; units: 'ctypes'),
    (libs: 'liblv2'; units: 'fp_lv2'),
    (libs: 'libsqlite'; units: 'ctypes'),
    (libs: 'libadapta'; units: 'fp_adapta'),
    (libs: 'libyaml'; units: 'cytypes'),
    (libs: 'libx'; units: 'cytypes'),
    (libs: 'libldap'; units: 'cytypes'),
    (libs: 'liblber'; units: 'cytypes'),
    (libs: 'libgs'; units: 'cytypes'),
    (libs: 'libavahi_common'; units: 'fp_avahi_common'),
    (libs: 'libavahi_client'; units: 'fp_avahi_common'),
    (libs: 'libavahi_glib'; units: 'fp_avahi_common'),
    (libs: 'libavahi_gobject'; units: 'fp_avahi_common'),
    (libs: 'libavahi_core'; units: 'fp_avahi_common'),
    (libs: 'libgomp'; units: 'ctypes'),
    (libs: 'libgraphblas'; units: 'ctypes'),
    (libs: 'libmagic'; units: 'ctypes'),
    (libs: 'libtre'; units: 'ctypes'),
    (libs: 'libraqm'; units: 'ctypes'),
    (libs: 'libfribidi'; units: 'fp_fribidi'),
    (libs: 'libpcre2'; units: 'ctypes'),
    (libs: 'libmagicwand'; units: 'fp_magiccore, fp_magicwand'),
    (libs: 'libmagiccore'; units: 'fp_magiccore'),
    (libs: 'libaa'; units: 'ctypes'),
    (libs: 'libnotify'; units: 'ctypes'),
    (libs: 'libcaca'; units: 'ctypes'),
    (libs: 'libzmq'; units: 'ctypes'),
    (libs: 'libheif'; units: 'fp_heif'),
    (libs: 'libgeos_c'; units: 'ctypes'),
    (libs: 'libmpv'; units: 'ctypes'),
    (libs: 'libraylib'; units: 'ctypes'),
    (libs: 'libhpdf'; units: 'fp_hpdf'),
    (libs: 'libqrencode'; units: 'ctypes'),
    (libs: 'libdmtx'; units: 'ctypes'),
    (libs: 'libzint'; units: 'ctypes'),
    (libs: 'libobjc'; units: 'ctypes'),
    (libs: 'libzstd'; units: 'ctypes'),
    (libs: 'libbrotlienc'; units: 'ctypes'),
    (libs: 'libbrotlicommon'; units: 'ctypes'),
    (libs: 'libpolylib'; units: 'fp_polylib64, types, arithmetique'),
    (libs: 'libmanifoldc'; units: 'ctypes'),
    (libs: 'libcglm'; units: 'fp_cglm'),
    (libs: 'libqhull_r'; units: 'fp_qhull_r'),
    (libs: 'libaspell'; units: 'ctypes'),
    (libs: 'liblas_c'; units: 'ctypes'),
    (libs: 'liblaszip'; units: 'ctypes'),
    (libs: 'liblasem'; units: 'fp_glib2, fp_lasem'),
    (libs: 'libbox2d'; units: 'fp_box2d'),
    (libs: 'libthorvg'; units: 'ctypes'),
    (libs: 'libtalloc'; units: 'ctypes'),
    (libs: 'libsokol'; units: 'fp_sokol'),
    (libs: 'joltc'; units: 'cytpes'),

    (libs: 'libplplot'; units: 'fp_plplot'),
    (libs: 'libgr'; units: 'ctypes'),
    (libs: 'libgtkchart'; units: 'fp_gtk4'),
    (libs: 'libcbor'; units: 'fp_gtk4'),


    (libs: 'libnm'; units: 'fp_glib2, fp_nm'),
    (libs: 'libfwupd'; units: 'fp_glib2, fp_fwupd'),

    (libs: 'libvips'; units: 'fp_glib2'),
    (libs: 'libodes'; units: 'fp_ode'),
    (libs: 'libphysfs'; units: 'ctypes'),

    (libs: 'libepoxy'; units: 'fp_epoxy'),
    (libs: 'libshumate'; units: 'fp_shumate'),
    (libs: 'libmongoc'; units: 'fp_mongoc'),
    (libs: 'libbson'; units: 'fp_bson'),
    (libs: 'liblua'; units: 'fp_lua'),
    (libs: 'libnfd'; units: 'fp_lua'),
    (libs: 'libvulkan'; units: 'fp_vulkan'),

    (libs: 'libwayland_client'; units: 'fp_wayland_client'),
    (libs: 'libdecor '; units: 'fp_wayland'),

    (libs: 'libxkbcommon'; units: 'fp_xkbcommon'),
    (libs: 'libxkbregistry'; units: 'fp_xkbcommon'),
    (libs: 'libgweather'; units: 'fp_gweather'),
    (libs: 'libhistedit'; units: 'fp_glib'),

    (libs: 'libglib2'; units: 'fp_glib, gtypes'),
    (libs: 'libgobject2_0'; units: 'fp_glib2'),
    (libs: 'libgio2'; units: 'fp_glib2'),
    (libs: 'libgtk4'; units: 'fp_glib2, fp_gtk4'),


    (libs: 'libgstreamer'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstbase'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstgl'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstvideo'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstaudio'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstvulkan'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstsdp'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstrtsp'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstrtp'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstcodecparsers'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgsthip'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstanalytics'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstwebrtcnice'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstwebrtc'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstwayland'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstpbutils'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstmpegts'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstnet'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstcuda'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstva'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstplayer'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstcontroller'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstallocators'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstcheck'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstplay'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstmse'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstfft'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgsttag'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstapp'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstinsertbin'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgsttranscoder'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstopencv'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstisoff'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstbasecamerabinsrc'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstriff'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstsctp'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgsturidownloader'; units: 'fp_glib2, fp_gst'),
    (libs: 'libgstphotography'; units: 'fp_glib2, fp_gst'),
    (libs: 'libges'; units: 'fp_glib2, fp_gst, ges_enums'),

    (libs: 'libspelling'; units: 'fp_glib2, fp_spelling'),
    (libs: 'libnm'; units: 'fp_glib2, fp_nm'),
    (libs: 'libnma'; units: 'fp_glib2, fp_nma'),
    (libs: 'libgegl'; units: 'fp_glib2, fp_gegl'),
    (libs: 'libgeg-npd'; units: 'fp_glib2, fp_gegl'),
    (libs: 'libgeg-sc'; units: 'fp_glib2, fp_gegl'),

    (libs: 'libjxl_threads'; units: 'fp_jxl'),
    (libs: 'libjxl'; units: 'fp_jxl'),
    (libs: 'librist'; units: 'fp_rist'),
    (libs: 'libmatio'; units: 'fp_rist'),
    (libs: 'libhdf5'; units: 'fp_hdf5'),
    (libs: 'libgusb'; units: 'fp_gusb'),
    (libs: 'libflint'; units: 'fp_flint'),
    (libs: 'libsodium'; units: 'fp_sodium'),
    (libs: 'libfftw3'; units: 'fp_fftw3'),
    (libs: 'liblerc'; units: 'fp_fftw3'),
    (libs: 'libzfp'; units: 'fp_fftw3'),
    (libs: 'librabbitmq'; units: 'fp_rabbitmq'),
    (libs: 'libpackagekit'; units: 'fp_glib2, fp_packagekit'),
    (libs: 'libxrl'; units: 'fp_xrl'),
    (libs: 'libgtk4hex'; units: 'fp_xrl'),
    (libs: 'libapr'; units: 'fp_apr'),
    (libs: 'libapriltag'; units: 'fp_apriltag'),
    (libs: 'libopencl'; units: 'fp_apriltag'),
    (libs: 'libllvm'; units: 'fp_llvm'),
    (libs: 'libatspi'; units: 'fp_glib2, fp_atspi'),





    (libs: ''; units: ''));

implementation

end.
