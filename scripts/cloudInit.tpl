#cloud-config
solace:
  configuration_keys:
    system_scaling_maxconnectioncount: 100
    username_admin_globalaccesslevel: ${admin_user}
    username_admin_password: ${admin_password}
  storage:
    adb:
      device: ${device_name}
    internalSpool:
      device: ${device_name}
