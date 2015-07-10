#!/usr/bin/env bash

: '

This file is part of srcmod project - command-line tool for automated setup and
maintenance of source code modules. 

The MIT License (MIT)

Copyright (c) 2015 Kostya Zolotarov

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

'

increment_version() {
    declare -a part=( ${1//\./ } )
    declare -i carry=1
    declare new

    for (( i=${#part[@]}-1; i>=0; i-=1 ));
    do
        count=${#part[i]}
        new=$((part[i]+carry))
        [ ${#new} -gt $count ] && carry=1 || carry=0
        [ $i -gt 0 ] && part[i]=${new: -count} || part[i]=${new}
    done

    new="${part[*]}"
    echo -e "${new// /.}" > $version_file
}
