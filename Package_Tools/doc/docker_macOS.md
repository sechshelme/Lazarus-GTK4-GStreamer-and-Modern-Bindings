
```sh
docker run -it --rm --name macos \
-p 8006:8806 \
--device=/dev/kvm \
--device=/dev/net/tun \
--cap-add NET_ADMIN \
-v "${PWD:-.}/macos:/storage" \
--stop-timeout 120 \
dockurr/macos
```

