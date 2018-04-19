#!/usr/bin/env bash

set -e

cd

PYPY_VERSION={{ pypy_version }}
PYPY_ARCH={{ pypy_arch }}

if [[ -e $HOME/pypy$PYPY_VERSION-$PYPY_ARCH.tar.bz2 ]]; then
  tar -xjf $HOME/pypy$PYPY_VERSION-$PYPY_ARCH.tar.bz2
  rm -rf $HOME/pypy$PYPY_VERSION-$PYPY_ARCH.tar.bz2
else
  wget --no-check-certificate -O - {{pypy_mirror}}/pypy$PYPY_VERSION-$PYPY_ARCH.tar.bz2 | tar -xjf -
fi

mv -n pypy$PYPY_VERSION-$PYPY_ARCH {{ pypy_home }}
test -d {{ pypy_bin_path }} || mkdir -p {{ pypy_bin_path }}

cat > {{pypy_bin_path}}/python <<EOF
#!/usr/bin/env bash
LD_LIBRARY_PATH=$HOME/pypy/lib:/usr/lib64:/lib64:/usr/lib:/lib:$LD_LIBRARY_PATH exec {{pypy_home}}/bin/pypy "\$@"
EOF

chmod +x {{pypy_bin_path}}
{{pypy_bin_path}}/python --version

