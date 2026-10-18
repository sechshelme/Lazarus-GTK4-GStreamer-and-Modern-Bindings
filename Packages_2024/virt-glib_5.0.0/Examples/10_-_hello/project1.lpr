program project1;

uses
  libvirt_gobject_enums,
  libvirt_gobject_stream,
  libvirt_gobject_domain_snapshot,
  libvirt_gobject_domain,
  libvirt_gobject_domain_device,
  libvirt_gobject_domain_disk,
  libvirt_gobject_domain_interface,
  libvirt_gobject_interface,

  libvirt_gobject_connection,

  libvirt_gobject_main,
  libvirt_gobject_manager,
  libvirt_gobject_network,
  libvirt_gobject_network_dhcp_lease,
  libvirt_gobject_network_filter,
  libvirt_gobject_node_device,
  libvirt_gobject_secret,
  libvirt_gobject_storage_pool,
  libvirt_gobject_storage_vol,


  fp_virt,
  fp_virt_glib,
  fp_glib2;

  procedure main;
  begin
    gvir_warning('Warnung');
  end;

begin
  VIR_DOMAIN_UNDEFINE_MANAGED_SAVE:=5:
  main;
end.
