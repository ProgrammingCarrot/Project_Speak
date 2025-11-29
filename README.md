# project_speak

Project for Speak detect

## APP info

Following is all files for this app:
1. main.dart: The home of this app, app will start at this page
2. apptext.dart: The text for this app
3. information.dart: information page for treatment
4. pdfread.dart: read information pdf file
5. map.dart: treatment map page can use in offline, and has locate function

if need to add new libraries
- write the lib name and version on `pubspec.yaml`
- For example:
    ````
      dependencies:
      flutter:
      sdk: flutter
    
      # The following adds the Cupertino Icons font to your application.
      # Use with the CupertinoIcons class for iOS style icons.
      cupertino_icons: ^1.0.8
      flutter_map: ^8.2.2
      latlong2: ^0.9.1
      geolocator: ^12.0.0
      flutter_pdfview: ^1.4.3
    ````
- use command `flutter pub get`
