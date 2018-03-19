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

echo_and_run cd "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/genjava"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/install/lib/python2.7/dist-packages:/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/build" \
    "/usr/bin/python" \
    "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/genjava/setup.py" \
    build --build-base "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/build/genjava" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/install" --install-scripts="/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/install/bin"
