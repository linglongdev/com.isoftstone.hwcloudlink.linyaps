#!/bin/bash
# generated by ll-helper

PREFIX=/opt/apps/*/files
LD_PATH=$(find $PREFIX -name "*.so*" | xargs -I{} -r dirname "{}"| grep -v "/lib/jvm" | sort -u | paste -sd :)
find $PREFIX -type f -executable -o -name "*.so" -o -name "*.so.*" | xargs -r -I{} env LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LD_PATH" ldd "{}" 2>/dev/null | grep -P "not found" | grep -oP "^\s+\K\S+" | sort -u
