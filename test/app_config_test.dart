import 'package:flutter_test/flutter_test.dart';
import 'package:osm_flutter_demo/app/config/app_config.dart';

void main() {
  group('AppConfig.fromEnvironment', () {
    test('trims and reads the ArcGIS API key', () {
      final config = AppConfig.fromEnvironment({
        'ARCGIS_API_KEY': '  test-key  ',
      });

      expect(config.arcGisApiKey, 'test-key');
    });

    test('returns null when the ArcGIS API key is missing or empty', () {
      expect(AppConfig.fromEnvironment({}).arcGisApiKey, isNull);
      expect(
        AppConfig.fromEnvironment({'ARCGIS_API_KEY': '  '}).arcGisApiKey,
        isNull,
      );
    });
  });
}
