# project_speak

Project for Speak detect

## Getting Started

Following is all files for this app:
1. main.dart: The home of this app, app will start at this page
2. apptext.dart: The text for this app
3. information.dart: information page for treatment
4. map.dart: treatment map page can use in offline, and has locate function

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

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
