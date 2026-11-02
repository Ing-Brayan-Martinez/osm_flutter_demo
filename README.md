# ArcGIS Map Flutter Demo

Aplicación multiplataforma de Flutter para mostrar un mapa interactivo de
ArcGIS. La clave de acceso se configura mediante variables de entorno y la
pantalla informa cuando falta la configuración o la plataforma no es compatible.

## Características

- Mostrar un mapa ArcGIS 2D con el mapa base de navegación.
- Iniciar la vista centrada en Bogotá, Colombia, con zoom 14.
- Leer la clave de ArcGIS desde `ARCGIS_API_KEY` en el archivo `.env`.
- Mostrar un mensaje cuando no se ha configurado la clave.
- Mostrar un mensaje informativo en plataformas de escritorio, donde el mapa
  no está habilitado actualmente.

## Arquitectura

```text
lib/
├── app/
│   └── config/       # Lectura y validación de la configuración de la app
├── domain/
│   ├── config/       # Tipos y utilidades del dominio
│   └── controller/   # Controladores
├── presentation/
│   ├── screen/       # Pantalla principal y mapa ArcGIS
│   └── theme/        # Colores de la interfaz
└── main.dart         # Inicialización de dotenv y punto de entrada
```

`main.dart` carga el archivo `.env` y construye `AppConfig`. La pantalla
principal verifica la clave y la plataforma antes de crear el mapa. El mapa
está habilitado en web, Android e iOS; en otras plataformas se muestra un
mensaje informativo.

## Requisitos

- Flutter SDK compatible con la restricción de Dart `^3.5.3` declarada en
  `pubspec.yaml`.
- Una clave de API de ArcGIS.

## Desarrollo

Configura `ARCGIS_API_KEY` en el archivo `.env` de la raíz del proyecto:

```env
ARCGIS_API_KEY=tu_clave_de_arcgis
```

Instala dependencias, aplica formato, analiza el proyecto y ejecuta las pruebas:

```bash
flutter pub get
dart format lib/ test/
flutter analyze
flutter test
```

Para iniciar la aplicación:

```bash
flutter run
```

Para seleccionar un dispositivo o plataforma explícitamente:

```bash
flutter run -d chrome
flutter run -d android
flutter run -d ios
```
