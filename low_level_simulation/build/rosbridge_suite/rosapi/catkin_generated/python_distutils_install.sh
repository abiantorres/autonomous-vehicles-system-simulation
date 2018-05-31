#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/rosbridge_suite/rosapi"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/install/lib/python2.7/dist-packages:/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/build" \
    "/usr/bin/python" \
    "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/rosbridge_suite/rosapi/setup.py" \
    build --build-base "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/build/rosbridge_suite/rosapi" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/install" --install-scripts="/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/install/bin"
