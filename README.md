# osm_flutter_demo — ArcGIS Maps Flutter Demo

[![Flutter](https://img.shields.io/badge/Flutter-3.38.9+-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-%5E3.5.3-blue.svg)](https://dart.dev)
[![ArcGIS Maps SDK](https://img.shields.io/badge/ArcGIS_Maps_SDK-300.1.0-teal.svg)](https://developers.arcgis.com/flutter/)

Aplicación multiplataforma desarrollada en **Flutter** para visualización de mapas interactivos 2D y 3D utilizando el **ArcGIS Maps SDK for Flutter (v300.1.0)**. La clave de API de ArcGIS se configura de forma segura mediante un archivo `.env`.

---

## 🚀 Características Principales

- **Mapa Interactivo ArcGIS 2D:** Renderizado de mapas base de ArcGIS (Topográfico, Calles, Imágenes Satelitales, etc.).
- **Centrado Inicial:** Mapa centrado en Bogotá, Colombia (Lat: 4.60971, Long: -74.08175) con nivel de zoom 14.
- **Configuración Segura por Entorno:** Carga dinámica de la clave mediante `ARCGIS_API_KEY` con `flutter_dotenv`.
- **Manejo de Errores y Validaciones:** Notificación visual al usuario si falta la API Key o si la plataforma no está soportada.

---

## 📋 Requisitos del Sistema y del SDK (ArcGIS v300.1)

Para compilar y ejecutar esta aplicación con el **ArcGIS Maps SDK for Flutter**, debes asegurarte de cumplir con los requisitos oficiales descritos en la documentación de ArcGIS:

🔗 **Documentación Oficial:**
- [ArcGIS Maps SDK for Flutter — Get Started](https://developers.arcgis.com/flutter/get-started/)
- [ArcGIS Maps SDK for Flutter (v300.1) — System Requirements](https://developers.arcgis.com/flutter/system-requirements/system-requirements-for-300-1/)

### Requisitos por Plataforma

#### 🤖 Android
- **Min SDK (`minSdk`):** API Level 28 (Android 9.0) o superior. *(API Level 31+ recomendado para APIs de análisis de alto rendimiento).*
- **Compile SDK (`compileSdk`):** API Level 36 / 37.
- **Target SDK (`targetSdk`):** API Level 37.
- **NDK Version:** `28.2.13676358` (o `r27c` / `27.0.12077973`+).
- **Arquitecturas Soportadas:** Exclusivamente **64-bit** (`arm64-v8a`, `x86_64`). *No soporta 32-bit (`armeabi-v7a` ni `x86`).*
- **Gráficos:** OpenGL ES 3.0+ para mapas 2D (fallback a 2.0+), OpenGL ES 3.2 para escenas 3D, y Vulkan 1.1 para análisis avanzado (requiere dispositivo físico).
- **Java / JDK:** JDK 17 a JDK 21.

#### 🍏 iOS
- **Min iOS Version:** iOS 18 o superior.
- **Rango Soportado:** iOS 18 a iOS 26.
- **Xcode:** Xcode 16.2 / Xcode 26+.
- **Arquitectura:** 64-bit (Apple Silicon / dispositivos iOS de 64 bits).

#### 💻 Entorno de Desarrollo (Development Host)
- **SDKs Base:** Flutter SDK `3.38.9+` / Dart SDK `^3.5.3`.
- **IDE Recomendado:** VS Code o Android Studio con plugins de Flutter/Dart.
- **Sistemas Operativos:** macOS 15+ (Sequoia/Tahoe) o Windows 11 (build 22631+).

---

## 🛠️ Instalación y Configuración

### 1. Obtener el Proyecto y las Dependencias
```bash
flutter pub get
```

### 2. Instalar el SDK Nativo de ArcGIS Maps
Ejecuta el siguiente comando oficial para instalar las librerías nativas necesarias para ArcGIS Maps SDK:
```bash
dart run arcgis_maps install
```

### 3. Configurar la Clave de API (`.env`)
Crea o edita el archivo `.env` en la raíz del proyecto y agrega tu API Key de ArcGIS:

```env
ARCGIS_API_KEY=tu_clave_de_api_arcgis_aqui
```

> **Nota:** Puedes obtener una clave de API gratuita registrándote en [ArcGIS Location Platform](https://developers.arcgis.com/).

---

## 📂 Arquitectura del Proyecto

```text
osm_flutter_demo/
├── android/                  # Configuración de compilación Android (minSdk 28, compileSdk 37)
├── ios/                      # Configuración de proyecto iOS
├── lib/
│   ├── app/
│   │   └── config/           # Carga y validación de variables de entorno (.env)
│   ├── domain/
│   │   ├── config/           # Tipos y configuraciones del dominio
│   │   └── controller/       # Controladores de estado
│   ├── presentation/
│   │   ├── screen/           # Pantallas principales y widget ArcGISMapView
│   │   └── theme/            # Tema y colores de la interfaz
│   └── main.dart             # Punto de entrada de la aplicación
├── .env                      # Clave de API de ArcGIS (Asset)
├── pubspec.yaml              # Dependencias (`arcgis_maps: ^300.1.0`)
└── README.md                 # Documentación del proyecto
```

---

## ⚙️ Desarrollo y Ejecución

### Validar Calidad y Formato del Código
```bash
dart format lib/ test/
flutter analyze
flutter test
```

### Ejecutar la Aplicación
```bash
# Ejecutar en el dispositivo o emulador activo
flutter run

# Ejecutar explícitamente en Android o iOS
flutter run -d android
flutter run -d ios
```

---

## 📖 Referencias Útiles

- [ArcGIS Maps SDK for Flutter — Documentation](https://developers.arcgis.com/flutter/)
- [ArcGIS Maps SDK for Flutter — Get Started](https://developers.arcgis.com/flutter/get-started/)
- [ArcGIS Maps SDK for Flutter v300.1 — System Requirements](https://developers.arcgis.com/flutter/system-requirements/system-requirements-for-300-1/)
- [ArcGIS Location Platform Dashboard](https://developers.arcgis.com/dashboard/)
