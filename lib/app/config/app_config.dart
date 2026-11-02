class AppConfig {
  const AppConfig({required this.arcGisApiKey});

  final String? arcGisApiKey;

  factory AppConfig.fromEnvironment(Map<String, String> environment) {
    final apiKey = environment['ARCGIS_API_KEY']?.trim();

    return AppConfig(
      arcGisApiKey: apiKey == null || apiKey.isEmpty ? null : apiKey,
    );
  }
}
