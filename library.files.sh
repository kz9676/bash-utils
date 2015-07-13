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

# TODO - Implement 'include()' function wrapper for Bash's 'source' command

. library.logging.sh

if_file_is_empty_initialize_with_text() {
    file=$1
    text=$2

    if [ ! -s $file ];
    then
        printf "$info Initializing file $file with text $text ...\n" >&2
        printf "$text" > "$file"
    fi 
}

#rename_files_that_match_pattern() {
    #search_path=$1
    #search_pattern=$2
    #search_query=$search_path/$search_pattern
    #search_files=()
    #matched_files=()

    #printf "$info Building a list of search files ...\n" >&2
    #for file in $search_query
    #do 
        #printf "$info Adding $file ...\n" >&2
        #search_files+=($file)
    #done

    #printf "$info Listing search files ...\n" >&2
    #for file in $search_files
    #do 
        #printf "$info File: $file \n" >&2
    #done
#}
