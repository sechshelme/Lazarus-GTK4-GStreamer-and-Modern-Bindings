
# OpenCL Infos

Nur Devicen: `clinfo -l`



# Zusätliche Treiber intalllieren 

## Ubuntu
```sh
sudo apt install pocl-opencl-icd
sudo apt install intel-oneapi-runtime-opencl

sudo apt install mesa-opencl-icd    # Muss so gestertet werden RUSTICL_ENABLE=iris ./main  / RUSTICL_ENABLE=iris,radeonsi,nouveau,panfrost,llvmpipe,r600,freedreno ./main

```

## Externes

### Vulkan Treiber

Achtung, braucht über 65 GB !
Das bauen braucht ca. 30min auf einem 20 Kerner !

https://github.com/kpet/clvk
Readme wegen subarch beachten !


echo "/usr/local/libOpenCL.so" | sudo tee /etc/OpenCL/vendors/clvk.icd
sudo ldconfig





