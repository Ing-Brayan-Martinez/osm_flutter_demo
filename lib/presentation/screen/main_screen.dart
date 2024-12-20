import 'package:arcgis_map_sdk/arcgis_map_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String arcGisApiKey = "AAPTxy8BH1VEsoebNVZXo8HurE7u7XgRAL8MCueozQmmyIuj3UzSC9oWTis_uQ59Cy7XrNGTmw7OsZwvvXVgdYSx2EFIKOZqxixsHOBOhzah1fh99bNN4VFuK0NMQlgkydWwJTs0hObCZU_ms0E19JUIVclxj_mbT4S-aMEHtg8cOhG9aXrLEvM62noz2kptoeQpLSVgYB3zXgX4S1JkRET8cjv_5ugqFxF8O5SMTwsmoIzVY4c8MH0nTMrVxGwmxf6oAT1_OftgQNgZ";
  ArcgisMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ArcgisMap(
            apiKey: arcGisApiKey,
            initialCenter: const LatLng(4.65, -74.1),
            zoom: 14,
            mapStyle: MapStyle.twoD,
            basemap: BaseMap.arcgisNavigation,
            onMapCreated: (ArcgisMapController controller) async {
              _controller = controller;



              if (kDebugMode) {
                print('se ha creado el mapa...');
              }
            },
          ),
          // Positioned(
          //   top: 10,
          //   right: 15,
          //   child: Container(
          //     color: Colors.red,
          //     width: 300,
          //     height: 400,
          //     //zIndex: 1, // Este widget se mostrará encima del azul
          //   ),
          // ),
        ]
      ),
    );
  }
}
