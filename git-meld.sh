#!/usr/bin/env sh

/usr/bin/meld "$2" "$5" | cat 2&> /dev/null
