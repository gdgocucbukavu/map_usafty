import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final MapController _mapController = MapController();
  // LatLng? _currentPosition;

  // @override
  // void initState() {
  //   super.initState();
  //   _determinePosition();
  // }

  // Future<void> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Vérifier si le GPS est activé
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return;
  //   }

  //   // Vérifier les permissions
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return;
  //     }
  //   }

  //   // Si la permission est refusée définitivement
  //   if (permission == LocationPermission.deniedForever) {
  //     return;
  //   }

  //   // Obtenir la position
  //   Position position = await Geolocator.getCurrentPosition();
  //   setState(() {
  //     _currentPosition = LatLng(position.latitude, position.longitude);
  //   });

  //   // Centrer la carte sur la position
  //   _mapController.move(_currentPosition!, 15.0);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FlutterMap(
        // mapController: _mapController,
        options: MapOptions(
          initialCenter: LatLng(-2.5008288718049236, 28.84941540384956),
          initialZoom: 15.2,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoiYWtvbjE3MDMiLCJhIjoiY2x5N2ZwcHlsMDVqajJqc2RubWJ2cDdwcSJ9.l8AAOq2CdOgSRtNG8DdIgA',
              'id':
                  'mapbox/streets-v11', // Styles : streets-v11, dark-v10, satellite-v9, etc.
            },
            userAgentPackageName:
                'com.example.app', // Remplacez par votre ID d'application
          ),

          // Afficher la position actuelle avec un marqueur
          // if (_currentPosition != null)
          //   MarkerLayer(
          //     markers: [
          //       Marker(
          //         point: _currentPosition!,
          //         width: 50,
          //         height: 50,
          //         child: Icon(Icons.location_pin, color: Colors.red, size: 40),
          //       ),
          //     ],
          //   ),

          // // Utiliser le package flutter_map_location_marker pour suivre en temps réel
          // CurrentLocationLayer(),
          // Ajouter un marqueur sur la position définie
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-2.5008288718049236, 28.84941540384956),
                width: 50,
                height: 50,
                child: Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
            ],
          ),

          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-2.495926795395828, 28.85577488579814),
                width: 50,
                height: 50,
                child: Icon(
                  Icons.location_pin,
                  color: const Color.fromARGB(255, 54, 67, 244),
                  size: 40,
                ),
              ),
            ],
          ),

          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-2.5002795957666857, 28.851833609544173),
                width: 50,
                height: 50,
                child: Icon(
                  Icons.location_pin,
                  color: const Color.fromARGB(255, 30, 194, 112),
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
