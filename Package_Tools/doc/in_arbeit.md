https://registry.khronos.org/OpenGL-Refpages/gl4/html/radians.xhtml

glCopyBufferSubData(

https://www.opengl-tutorial.org/beginners-tutorials/
https://www.opengl-tutorial.org/intermediate-tutorials/

https://gist.github.com/roxlu/5090067
https://github.com/progschj/OpenGL-Examples/blob/master/06instancing2_buffer_texture.cpp

https://stackoverflow.com/questions/16463078/glclearbufferdata-usage-example
https://docs.google.com/viewer?url=http://education.siggraph.org/media/conference/S2012_Materials/ComputeShader_1pp.pdf

https://learnopengl.com/Advanced-OpenGL/Stencil-testing
https://en.wikibooks.org/wiki/OpenGL_Programming/Stencil_buffer
https://gist.github.com/sealfin/d22f4ba4d1022e1b89dd
https://lazyfoo.net/tutorials/OpenGL/26_the_stencil_buffer/index.php

https://www.khronos.org/opengl/wiki/Programming_OpenGL_in_Linux:_GLX_and_Xlib

https://gamedev.stackexchange.com/questions/119823/trouble-applying-a-texture-to-a-cube

https://docs.gl/gl4/glScissor

https://www.cs.cornell.edu/~kb/projects/epigpu/PixelClass.cg.html

https://www.ozone3d.net/tutorials/glsl_texturing_p08.php

https://registry.khronos.org/OpenGL-Refpages/gl4/

  {$ifndef GLES32}
  glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
  {$endif GLES32}




# Vulkan
https://community.khronos.org/t/5-new-vulkan-samples/110160
https://vulkan-tutorial.com/Drawing_a_triangle/Setup/Instance

# Matrizen
https://studyflix.de/mathematik/drehmatrix-3814
https://www.youtube.com/watch?app=desktop&v=lDaQ3a43x8A

https://www.onlinemathe.de/aktivieren/Mathias1000

xtuzW&rgzc2@2i6


https://wiki.ubuntuusers.de/SimpleScreenRecorder/

https://www.omgubuntu.co.uk/install-notepad-editor-ubuntu
https://snapcraft.io/docs/installing-snap-on-linux-mint
sudo snap install notepad-plus-plus

# Jonits
https://research.ncl.ac.uk/game/mastersdegree/graphicsforgames/skeletalanimation/Tutorial%209%20-%20Skeletal%20Animation.pdf
https://research.ncl.ac.uk/game/mastersdegree/graphicsforgames/skeletalanimation/

https://moddb.fandom.com/wiki/OpenGL:Tutorials:Basic_Bones_System

https://www.youtube.com/watch?v=3CWsy4kP6wU

# Scherung
https://www.rhetos.de/html/lex/lineare_abbildung.htm



https://schneide.blog/2016/07/15/generating-an-icosphere-in-c/


$ sudo apt-get install openscad


# JavaScript
https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/load_event
https://www.w3schools.com/js/js_ajax_http.asp
https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest_API/Sending_and_Receiving_Binary_Data
https://stackoverflow.com/questions/50255282/webgl2-has-anti-alias-automatically-built-in
https://developer.mozilla.org/en-US/docs/Web/API/WebGLRenderingContext/getContextAttributes
https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_onmouseenter
https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_onmousemove
https://www.w3schools.com/cssref/tryit.php?filename=trycss_border-color

https://www.w3schools.com/jsref/met_node_removechild.asp
https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_node_insertbefore
https://www.w3schools.com/cssref/tryit.php?filename=trycss_anim_border-color
https://stackoverflow.com/questions/59573722/how-can-i-set-a-css-keyframes-in-javascript


https://wiki.freepascal.org/Pas2JS_Version_Changes

# SDL
https://gist.github.com/gcatlin/b89e0efed78dd91364609ca4095da346

https://github.com/libsdl-org/SDL/commit/2fe1a6a27960126041590d7bbf8080fb5228b1fb



# mingw

sudo apt-get install gcc-mingw-w64
sudo apt-get install mingw-w64-x86-64-dev 
https://medium.com/@bhargav.chippada/how-to-setup-opengl-on-mingw-w64-in-windows-10-64-bits-b77f350cea7e



https://discourse.libsdl.org/t/sdl-remove-sdl-setwindowinputfocus/52467


## 3D Alpha
https://github.com/icculus/SDL/blob/gpu-api/include/SDL3/SDL_gpu.h
https://github.com/thatcosmonaut/SDL/tree/gpu/include/SDL3

# meson cross
https://mesonbuild.com/Cross-compilation.html
https://stackoverflow.com/questions/57436089/meson-can-not-find-windows-resource-compiler-on-linux

## Meson konfigurieren
- `meson configure ../gtk/ `

### Beispiel
- `meson ../gtk/ -Dbuild-tests=false -Dbuild-testsuite=false -Dbuild-examples=false -Dbuild-demos=false --reconfigure`
 



# GTK4
sudo apt-get install libclutter-gtk-1.0-dev 
sudo apt-get install libgee-0.8-dev
sudo apt-get install libgnome-games-support-1-dev
sudo apt-get install libgirepository1.0-dev
sudo apt install libadwaita-1-dev 

libxmlb-dev      // io.



https://repo.msys2.org/mingw/mingw64/



https://www.docs4dev.com/docs/gtk/4.0.0/gtkwindowcontrols.html#google_vignette


# VGA
https://int10h.org/oldschool-pc-fonts/fontlist/font?ibm_vga_8x16

https://man7.org/linux/man-pages/man3/getopt.3.html
## mingw windows
https://github.com/niXman/mingw-builds-binaries?tab=readme-ov-file


# wine PATH
~/.bashrc
export WINEPATH="$WINEPATH;C:\users\tux\mingw64\bin;C:\gstreamer\1.0\msvc_x86_64\bin"


# glib 
https://github.com/wadester/wh_test_glib/blob/master/glib_test1.c
https://www.perplexity.ai/search/gib-mir-ein-besipie-mit-g-sign-o.RYtsJDRY6LPTdT6u4ViQ

# gstreamer
meson ../gstreamer-1.24.8 -Dtests=disabled
ninja -j20
ninja install



gst-inspect-1.0 --plugin
gst-inspect-1.0 --plugin alsa


https://stackoverflow.com/questions/71470892/how-to-play-audio-with-gstreamer-in-c
https://gstreamer.freedesktop.org/documentation/gstreamer/gstelementfactory.html?gi-language=c


https://github.com/GStreamer/gst-docs/blob/master/examples/tutorials/basic-tutorial-6.c

https://discourse.gstreamer.org/t/interpipe-caps-not-accepted/2454
https://github.com/GStreamer/gst-plugins-good/blob/master/tests/check/elements/id3demux.c

# gtk opengl
https://docs.gtk.org/gtk4/class.GLArea.html

# Animationen
https://easings.net/de

# Zum ausprobieren

/usr/include/graphite2



https://docs.gtk.org/gtk4/migrating-4to5.html

https://wiki.gnome.org/Projects/Libgee
https://github.com/GNOME/libgee



Graphite2 

# webkit

https://www.perplexity.ai/search/ich-wolllte-webkit-6-bauen-und-cFoanQHyTVeyY3ASw28N7Q

sudo apt-get install libgcrypt20 libgcrypt20-dev
sudo apt-get install libtasn1-6 libtasn1-6-dev
sudo apt-get install libmanette-0.2-dev 
sudo apt-get install libxslt1-dev
sudo apt-get install libsecret-1-0 libsecret-1-dev


# FPC 

{$modeswitch functionreferences}
{$modeswitch anonymousfunctions}
{$ENDIF}
{$modeswitch advancedrecords}
/home/tux/fpcupdeluxe_trunk/fpcsrc/packages/fcl-passrc/src/pscanner.pp




# Fontutils

git clone https://git.zap.org.au/git/console-fonts-utils.git


https://discourse.gnome.org/t/gtk-box-new-returning-pointer-to-an-already-existing-gtkbox-in-gtk4/26423

# ==== Linux Libary

https://www.linuxfromscratch.org/blfs/view/git/general/graphlib.html


=============

Ogre3D oder IrrLicht:  // Games Engines
libraylib-dev          // Games Engines

libcurl                            // io.
libraw                             // io.
libsoup2.2                          // glib
libsoup3                           // io
libpng-dev 
libshaderc-dev                     // io.
libbluetooth-dev
libopenal-dev
libalut-dev
libusb-1.0-0-dev                   // io.
libxkb
libhpdf-dev
libhdf5-dev
libhdf-dev
libgsl-dev                         // io.
libmgl                             // io.
libpciaccess
libunistring-dev

libopenblas             // io.
liblapacke              // io.
liblapack               // io.

libmpfr-dev             // io.
libmpfi-dev             // io.
libportmidi0            // io.

libev4 
libev-dev
libtasn1-bin
libtasn1-6-dev 

libfftw3-dev
libao-dev

libsystemd-dev                      // io.
libnss-systemd und libpam-systemd   // io.
libdbus                             // io. 
libcap-dev                          // io.

libdconf-dev
libdbusmenu-glib-dev
libdbusmenu-gtk3-dev

libevdev-dev 

libwinpr3-dev

libpoppler                          // io.
libxcb                              // io.

zlib
 libbrotli-dev   
 libselinux1  



 libfluidsynth3  
libhandy-1-0              // gtk3
libgedit-tepl             // gtk3

libavif16    
libxkbcommon
libhidapi                            // io.

libquadmath0                      /usr/lib/gcc/x86_64-linux-gnu/13/include/quadmath.h
libpipewire-0.3-dev     

ibsoundtouch-ocaml-dev


libgomp1                         // Nur in GCC verwendbar
libhwasan0                       // Nur in GCC verwendbar     
libitm1                          // Nur in GCC verwendbar         

libcrypt1                        // io.
libgcrypt1

libcupsfilters


/usr/include/libmount

libnotify-dev

liblapack-dev  // fortan  algebra            gcc main.c -o main -lblas -llapack


libgcr-4-4  &   libgck-2-2      // glib cyrypto

libgtkdatabox-dev   
libgtksheet-4.0-dev

libpeas-2-dev                  // io.
libpeasd-3-dev 
 glib-networking   
libglibmm-2.4-dev

# === RDF 
libserd              // io. 
libsord              // io.
liblilv              // io.
librdf               // io.
libsratom            // io.
# ====
libraptor2           // io.
libzix-dev 
librasqal3-dev  

libsqlite3-dev         // io.
librasterlite2-dev  

libdatrie1   

libupower-glib-dev 
libzstd-dev

libnspr4   // mozilla

libpackagekit-glib2-dev 

libgdal-dev

libbabl
liblcms2


skia


   

apt install blueprint-compiler


libfftw3 


/usr/include/x86_64-linux-gnu/cblas.h
/usr/include/unicode/char16ptr.h

sudo apt install libnss3 libnss3-dev

libreadline-dev                    // io.
libportal-gtk4-dev                 // io.

libnl-genl-3-dev 

liblodepng-dev
libltdl                            // io.  

libcogl                            // veraltet

 libswresample-dev  

 libboost-locale1.88.0 
liblangtag-common    
 libbinutils     
 libmount-dev  
libgusb2  
liborcus-0      // Excel Tabellen einlesen

libcolord-dev     
libcolord-gtk4-1t64  

libgoa-1.0-common  

 libgupnp-1.6-0  

  libblockdev       ( mit glib )

 libchromaprint-dev     ( audioerkennug ))
  libbytesize-common    ( bist byte berechnen )    
     libebur128-1  ( Lautheitsmessung )    
  libfluidsynth3      ( midi )

libexpat1-dev   ( xml lesen )   

libgphoto2              // io.

  libsuitesparseconfig7 ( matrix mathe )  libsuitesparse-dev

 librsvg2-2  
 libmm-glib0    

libmkl-full-dev  



libdfp-dev

libminiaudio-dev       
 libgupnp-dlna-2.0-4 

libxmlsec1-nss1  
libxmlsec1-1 

libgsm1   
libtevent0t64 
liburcu8t64

libgeocoding               // io.    
libasound2                 // io.
libsoundio                 // io.
libsane                    // io.

libmagickcore-dev          // io.
libogg0

 libatk1.0-dev       // Barrierenfreiheit

libgegl-dev
libvala-0.56-dev 
 libvalacodegen-0.56-0 
libyaml-dev              // io.
libappstream-dev

  liba52-0.7.4-dev      
librdkafka-dev


libmanette-0.2-dev       // io.
libavahi-core-dev        // io. 
libavahi-gobject-dev     // io. 
libavahi-glib-dev        // io.

libgdbm-dev
libdaemon-dev

libavif
gdk-pixbuf-csource 
/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders

libmagickwand-dev                // io.    
libmagic-dev                     // io.
libtre-dev                       // io.
libgraphblas                     // io.
libheif-dev                      // io.
libfribidi-dev                   // io.
libraqm-dev                      // io.
libstb-dev                       // inline müll 
libcaca-dev                      // io.
libaa1-dev                       // io.
libnotify4                       // io.
libheif-dev                      // io.
libzmq5                          // io.
libgraphviz-dev                  // io.
libpathplan4                     // io.   gehört zu libgraphviz-dev
libxdot4                         // io.   gehört zu libgraphviz-dev
libgvpr2                         // io.   gehört zu libgraphviz-dev
libqrencode4                     // io.    QR Code
libdmtx                          // io.
libzint                          // io.
libshumate                       // io.
libobjc4                         // io.   
libzstd                          // io.
libpolylib64-dev                 // io.
libqhull-dev                     // io.






libsodium                         // krypto
libgcrypt20-dev 
libopenimageio2.5                 // bild konverter
libzita-resampler1                // C++
libmad0-dev                       // mp3
libqpdf30      
libpolkit-gobject-1-0             // Rechte / Berechtigungen
liblua5.1-0-dev                   // ähnlich tk/tcl  
libaccountsservice0               // acount

libzinnia                         // Handschrifterkennung  veraltet

libbz2-dev                        // ähnlich zip

 libappstream-dev 


 librubberband-dev   
  libopus0      
 libmad0-dev    


  libsensors5

 libbsd0    
libaspell
libdeflate-dev     
  libidn2-dev  
     libjack-jackd2-dev   
  libmikmod-dev   
  libmypaint-1.5-1   
    libonig5
   librttopo1         
   libsecret-1-0    

  libsuperlu7
  libspatialite8t64

libplacebo-dev
ibid3-3.8.3-dev 

libatk1.0-dev   

  libgusb2a

libassimp-dev

gvfs, gvfs-daemons, gvfs-libs

libbgfx

 libxslt   

  libfl-dev  libfl2









libwacom-dev  // grafiktablett


libcamel-1.2-dev, libebook-1.2-dev, libecal-2.0-dev //  sudo apt install evolution-data-server-dev

libcimgui //    ImGui 
 libblkid-dev     

libpdal, liblas // was ist das ???? 
liblasem
 libgeotiff-dev
libwmf-0.2-7

libtalloc2   

thorvg und passagemath 

libarchive
libjxl
libcbor0.10    

libswresample / libswscale
libvips

https://github.com/lundmar/gtkchart

libcfitsio-dev

libspirv-cross-c-shared.so


mingw-w64-plutovg
mingw-w64-mupdf
mingw-w64-json-c
mingw-w64-grpc
mingw-w64-intel-xed   // Unbrauchbarer Müll

mingw-w64-mongo-c-driver  // Datenbank
libbson-dev

mingw-w64-arrow (Apache Arrow):Ein Framework für In-Memory-Datenanalysen. Es ist zwar in C++ geschrieben, bietet aber eine sehr ausgereifte C-Schnittstelle (GObject-basiert), um hocheffiziente Datentabellen zwischen Sprachen auszutauschen.


  libedit2                 io.

// #include <stdckdint.h>



Compressor name	Ratio	Compression	Decompress.
zstd 1.5.7 -1	2.896	510 MB/s	1550 MB/s
brotli 1.1.0 -1	2.883	290 MB/s	425 MB/s
zlib 1.3.1 -1	2.743	105 MB/s	390 MB/s
zstd 1.5.7 --fast=1	2.439	545 MB/s	1850 MB/s
quicklz 1.5.0 -1	2.238	520 MB/s	750 MB/s
zstd 1.5.7 --fast=4	2.146	665 MB/s	2050 MB/s
lzo1x 2.10 -1	2.106	650 MB/s	780 MB/s
lz4 1.10.0	2.101	675 MB/s	3850 MB/s
snappy 1.2.1	2.089	520 MB/s	1500 MB/s
lzf 3.6 -1	2.077	410 MB/s	820 MB/s



sudo apt install gtk-4-examples

https://github.com/Immediate-Mode-UI/Nuklear/tree/master
https://github.com/memononen/fontstash

# =====

Goocanvas: Ein Canvas-Widget für GTK3


# ===========

https://github.com/amerkoleci/joltc

Jolt Physics: Hat eine sehr gute C-API (JoltC). Da Jolt extrem modular ist, lässt es sich fast so sauber wie Box2D in Pascal einbinden. Es gibt sogar schon erste Header-Übersetzungen dafür.

git submodule update --init --recursive



# ===========   Brandneu, gibt es in LTS noch nicht

## GTK4
libglycin-gtk4
libevince_gtk4
libgnome-qr-gtk-4-0
libppsdocument-4.0-6,  libppsview-4.0-5  // Nicht frei gegeben 
gstreamer1.0-gtk4    // https://github.com/GStreamer/gst-plugins-rs


## Sonstiges
libdialog                                                     // https://invisible-island.net/archives/dialog/
../dialog-1.3-20260107/configure --with-shared
gr-framework  gr-framework-plugin-cairo  libgr-framework-dev  // Ähnlich mathGL / https://github.com/sciapp/gr
libvectorscan-dev                                             // alt libhyperscan-dev 

# ==== Linux Libary nicht bei Ubuntu dabei

https://github.com/raysan5/raylib

/home/tux/Schreibtisch/von_Git/gcc/gcc/libgomp/libgomp_g.h



--------------


libtinysparql

stb_image (( ?????

/usr/include/x86_64-linux-gnu/openmpi

gusb
libgd-dev
libsodium
libcfitsio10t64
libarchive
libmongoose            // einfacher webserver
libpackagekit-glib2-dev
aptkit // ????
libapt-inst
xraylib

libapriltag
libmlt

sudo apt-get install libdispatch-dev






https://blends.debian.org/med/
https://blends.debian.org/science/tasks/
https://blends.debian.org/blends/


--------------





https://github.com/lcallarec/live-chart




# ==== Alternative Paketmanager

## Konsole
aptitude

## GUI
synaptic



# winboat

sudo apt install freerdp3-x11
sudo apt install docker-compose-v2
http://127.0.0.1:47270/

# =========================


COLUMNS=200 apt search '^lib.*-dev$' > test.txt



#include <getopt.h>
/usr/include/tjutils/tjcomplex.h




libgnuplot-iostream-dev      // Nur C++
https://github.com/longradix/gnuplot_i


/usr/include/nspr



sudo apt install libgif-dev 


# Ubuntu no LTS Upgraden

Um von Ubuntu 25.04 (kein LTS) auf Ubuntu 25.10 zu aktualisieren, kannst du wie folgt vorgehen:

1. Updates installieren und System vorbereiten

Öffne ein Terminal (Strg + Alt + T)

Führe folgende Befehle aus:

text
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get install update-manager-core
sudo do-release-upgrade

2. Upgrade starten

Sobald Ubuntu 25.10 offiziell verfügbar ist, kannst du das Upgrade mit folgendem Befehl starten:

text
sudo do-release-upgrade
Falls das Upgrade noch nicht offiziell freigeschaltet ist, kannst du es mit dem Parameter -d erzwingen (auf eigenes Risiko):

text
sudo do-release-upgrade -d
Folge den Anweisungen im Terminal und bestätige nötige Rückfragen.


# Programm Zeilen auswerten.

sudo apt install cloc

# Paket Hitory

apt changelog libwebkitgtk-6.0-dev
dpkg -s libwebkitgtk-6.0-dev | grep Version
apt list --installed libwebkitgtk-6.0-dev

# Optimiert mit cmake bauen

cmake -S . -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_FLAGS="-march=native" \
  -DCMAKE_CXX_FLAGS="-march=native"


# cache aufräumen

ldconfig
hash -r

# Alle -dev Pakete Listen 

apt search '\-dev' | grep '^[a-zA-Z0-9].*-dev/' | cut -d'/' -f1 | while read pkg; do
  echo "=== $pkg ==="
  apt show "$pkg"
done

# Pakete mit Abhängigkeit

apt-cache rdepends libgtk-4-1 | grep lib
apt-cache rdepends libgmp10 | grep lib
apt-cache rdepends libgmp-dev | grep lib

pkcon required-by libgmp-dev




# MSYS2 Alternative

```sh
git clone https://github.com/holyblackcat/quasi-msys2
cd quasi-msys2
make install _gcc _gdb
make install mingw-w64-ucrt-x86_64-gcc
make install mingw-w64-ucrt-x86_64-gtk4
```


pacmake install mingw-w64-ucrt-x86_64-gtk4
oder
make install mingw-w64-ucrt-x86_64-gtk4

/home/tux/.local/bin


# GITHUB release automatisch
gh release create v1.0.0 --title "Mein erstes Release" --notes "Hier sind die Änderungen..."

# Interessante befehle

Extensionen für die Bash einschalten
`shopt --help`


# Fenstertoools

weston
sway



# snapshot bug log

commit a4fb6ddae300ebd147412d734cb7d97aafff3dca
Author: Matthias Clasen <mclasen@redhat.com>
Date:   Fri Apr 17 10:15:17 2026 -0400

    transform: Better float comparisons
    
    G_APPROX_EQUAL (...FLT_EPSILON) really doesn't make much sense,
    since floats are not equally spaced, and the ones below 1 are
    closer together than FLT_EPSILON. What we really need here is
    an equivalence relation, and anything based on a uniform measure
    of distance is not going to be transitive.
    
    So instead, and against the common advice on the street, just
    compare for equality. This leads to false negatives, but we already
    err on the side of considering transforms not equal even though
    they might have the same effect.
    
    In the few places where we use graphene for comparisons, use
    graphene_...near (... FLT_MIN), which is effectively an ==
    comparison as well, since FLT_MIN is the smallest difference
    between any non-zero floats.
    
    Fixes: #8146
    Fixes: 40beb69487624113a92cef8d1ed9ad3aaebc859b
    Part-of: <https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/9821>



# ====== Distrobox Tipps

## {TAB} für Packetauswahl
sudo apt install bash-completion
sudo rm /etc/apt/apt.conf.d/docker-clean
sudo apt update

## NAS verbinden
sudo ln var/run/host/n4800/ n4800 -s


## OS abfragen
cat /etc/os-release


# openCL-Treiber

# 1. Treiber für den Prozessor (CPU-Laufzeitumgebung)
sudo apt install pocl-opencl-icd

# 2. Treiber für die Grafikchips (Intel HD 4000 / AMD Radeon)
sudo apt install mesa-opencl-icd



# ===== Issues auflisten

Achtung, die mir Curl geben nur die neusten Issues aus

## Github
```sh
gh search issues "author:sechshelme" -L 100
curl -s -H "User-Agent: Mozilla" "https://api.github.com/search/issues?q=author:sechshelme+type:issue" | jq -r '.items[] | "[\(.state)]\t#\(.number)\t\(.title)"'
```

## Gnome
```sh
curl -s "https://gitlab.gnome.org/api/v4/issues?author_username=sechshelme&scope=all" | jq -r '.[] | "[\(.state)]\t#\(.iid)\t\(.title)"'
```

## Freedeskop
```sh
curl -s "https://gitlab.freedesktop.org/api/v4/issues?author_username=sechshelme&scope=all" | jq -r '.[] | "[\(.state)]\t#\(.iid)\t\(.title)"'
```

## Lazarus
```sh
curl -s "https://gitlab.com/api/v4/issues?author_username=sechshelme&scope=all" | jq -r '.[] | "[\(.state)]\t#\(.iid)\t\(.title)"'
```



