import 'package:arcgis_map_sdk/arcgis_map_sdk.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:osm_flutter_demo/app/config/app_config.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.config});

  final String title;
  final AppConfig config;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final supportsMap = kIsWeb ||
        defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
    final apiKey = widget.config.arcGisApiKey;

    final Widget body;
    if (apiKey == null) {
      body = const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Configura ARCGIS_API_KEY en el archivo .env para cargar el mapa.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else if (!supportsMap) {
      body = const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'El mapa no está disponible en esta plataforma.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      body = SizedBox.expand(
        child: ArcgisMap(
          apiKey: apiKey,
          initialCenter: const LatLng(4.65, -74.1),
          zoom: 14,
          mapStyle: MapStyle.twoD,
          basemap: BaseMap.arcgisNavigation,
        ),
      );
    }

    return Scaffold(body: body);
  }
}
