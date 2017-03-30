# xfce4-desktop

This image meant for running a light weight desktop.

![](https://www.diigo.com/file/image/ssdarodzdrsscdsbazcrbqepdr/xfce4-desktop.jpg)

## Deploy

```
# docker pull gitai/xfce4-desktop
```

```
# docker run -d \
    -e DISPLAY=:0 \
    --volumes-from xorg \
    --volumes-from dbus \
    --name desktop \
    gitai/xfce4-desktop
```