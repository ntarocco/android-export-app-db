# Android: export and extract app SQLite db

Super simple bash script to automatize the task to export and untar the db of an Android app.

## Usage

android-export-app-db.sh app.package.name


1. Plug your Android phone to your PC.
2. Enable Developer Tools.
3. Run the script with your app package name as first parameter.
4. A confirmation dialogue will be prompt on your device, accept it.
5. You will find the SQLite db exported in your output folder (check the source code).
