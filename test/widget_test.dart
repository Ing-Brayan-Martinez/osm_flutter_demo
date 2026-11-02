import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:osm_flutter_demo/app/config/app_config.dart';
import 'package:osm_flutter_demo/main.dart';

void main() {
  testWidgets('shows a configuration message when the API key is missing', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MyApp(config: AppConfig(arcGisApiKey: null)),
    );

    expect(
      find.text(
        'Configura ARCGIS_API_KEY en el archivo .env para cargar el mapa.',
      ),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('shows a message when the map platform is unsupported', (
    tester,
  ) async {
    final previousPlatform = debugDefaultTargetPlatformOverride;
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    try {
      await tester.pumpWidget(
        const MyApp(config: AppConfig(arcGisApiKey: 'test-key')),
      );

      expect(
        find.text('El mapa no está disponible en esta plataforma.'),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
    } finally {
      debugDefaultTargetPlatformOverride = previousPlatform;
    }
  });
}
