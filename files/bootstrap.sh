#!/usr/bin/env bash

set -e

cd

PYPY_VERSION=$1
PYPY_ARCH=$2
PYPY_BIN_PATH=$3
PYPY_HOME=$4
PYPY_MIRROR=$5
PYPY_WGET_EXTRA=$6

if [[ -e $HOME/pypy$PYPY_VERSION-$PYPY_ARCH.tar.bz2 ]]; then
  tar -xjf $HOME/pypy$PYPY_VERSION-$PYPY_ARCH.tar.bz2
  rm -rf $HOME/pypy$PYPY_VERSION-$PYPY_ARCH.tar.bz2
else
  wget $6 -O - $PYPY_MIRROR/pypy$PYPY_VERSION-$PYPY_ARCH.tar.bz2 | tar -xjf -
fi

mv -n pypy$PYPY_VERSION-$PYPY_ARCH $PYPY_HOME

test -d $PYPY_BIN_PATH || mkdir -p $PYPY_BIN_PATH

cat > $PYPY_BIN_PATH/python <<EOF
#!/usr/bin/env bash
LD_LIBRARY_PATH=$PYPY_HOME/lib:/usr/lib64:/lib64:/usr/lib:/lib:$LD_LIBRARY_PATH exec $PYPY_HOME/bin/pypy "\$@"
EOF

chmod +x $PYPY_BIN_PATH/python
$PYPY_BIN_PATH/python --version

