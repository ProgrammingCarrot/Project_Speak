import 'package:flutter/material.dart';
import 'apptext.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class Map_Page extends StatefulWidget{
  const Map_Page({super.key});

  @override
  State<Map_Page> createState() => _Map_PageState();
}

class _Map_PageState extends State<Map_Page> {
  final List<Marker> _markers = [];
  final MapController _mapController = MapController();

  @override
  void initState(){
    super.initState();
    _loadJsonMarkers();
  }

  Future<void> _loadJsonMarkers() async{
    final String data = await rootBundle.loadString('assets/locations.geojson');
    final Map<String, dynamic> geoJson = jsonDecode(data);
    final List features = geoJson['features'] ?? [];
    final List<Marker> markers = [];
    for (final feature in features) {
      final geometry = feature['geometry'];
      if (geometry == null || geometry['type'] == null) continue;
      final List coordinates = geometry['coordinates'];
      // GeoJSON 是 [lon, lat]
      final double lon = coordinates[0].toDouble();
      final double lat = coordinates[1].toDouble();

      final properties = feature['properties'] ?? {};
      final String name = properties['Name']?.toString() ?? '未知';
      markers.add(
        Marker(
          point: LatLng(lat, lon),
          width: 40,
          height: 40,
          child: Tooltip( // 外層還是保留 Tooltip
            message: name,
            child: GestureDetector( // **將 GestureDetector 放在 Icon 外面**
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
              child: const Icon( // Icon 成為 GestureDetector 的 child
                Icons.location_on,
                size: 36,
                color: Colors.red,
              ),
            ),
          ),
        ),
      );
    }
    setState(() {
      _markers.clear();
      _markers.addAll(markers);
    });
  }

  Future<void> _getMyLocation() async{
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      if(!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(Text_List.noPermission,
                style: Theme.of(context).textTheme.bodyMedium,
              )
        )
      );
      return;
    }
    // if permission is denied we will ask one more time
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        if(!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(Text_List.deniedPermission,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
            )
        );
        return;
      }
    }
    // if permission is denied forever
    if(permission == LocationPermission.deniedForever){
      if(!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(Text_List.deniedPermissionForever,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          )
      );
    }
    // get User's position
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final userLatLng = LatLng(position.latitude, position.longitude);
    _mapController.move(userLatLng, 16);
    setState(() {
      _markers.removeWhere(
            (m) => m.key == const ValueKey('my_location'),
      );

      _markers.add(
        Marker(
          key: const ValueKey('my_location'),
          point: userLatLng,
          width: 40,
          height: 40,
          child: const Icon(
            Icons.accessibility,
            size: 50,
            color: Colors.blue,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Text_List.jumpToMap,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:FlutterMap(
          mapController: _mapController,
          options: const MapOptions(
            initialCenter: LatLng(25.0478, 121.5170),
            initialZoom: 14
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: "com.project.speak.project_speak",
            ),
            MarkerLayer(markers: _markers)
          ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getMyLocation,
        child: const Icon(Icons.my_location),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}