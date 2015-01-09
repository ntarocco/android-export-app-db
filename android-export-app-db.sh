#!/usr/bin/env bash

DB_NAME=app.db
OUTPUT_FOLDER=~/Desktop/android_dbs

if [[ ! $# -eq 1 ]]; then
    echo "1 argument required, app package name, for example:"
    echo "com.mycompany.myapp"
else
    echo
    echo "Exporting app..."
    rm -rf /tmp/app.tar
    rm -rf /tmp/apps
    rm -rf /tmp/data.ab
    adb backup -f /tmp/data.ab -noapk $1

    if [[ -f /tmp/data.ab && -s /tmp/data.ab ]]; then
        echo
        echo "Extracting app..."
        dd if=/tmp/data.ab bs=1 skip=24 | openssl zlib -d > app.tar
        tar -xvf app.tar -C /tmp
        if [ -d "/tmp/apps" ]; then
            mkdir -p $OUTPUT_FOLDER
            mv -f /tmp/apps/$1/db/$DB_NAME $OUTPUT_FOLDER/$1.sqlite
            echo
            echo "DB saved: $OUTPUT_FOLDER/$1.sqlite"
        else
            echo
            echo "ERROR! tar not extracted. Did u specify correctly the package name of your app?"
        fi
    else
        echo
        echo "ERROR! exporting app $1"
    fi
fi
