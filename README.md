# Financial Portfolio

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Financial Portfolio App - Una aplicación para visualizar y gestionar portafolios de inversión.

---

## Requisitos Previos 📋

Antes de ejecutar la aplicación, asegúrate de tener instalado:

| Herramienta | Versión Mínima | Verificar Instalación |
|-------------|----------------|----------------------|
| Flutter | 3.35.0+ | `flutter --version` |
| Dart | 3.9.0+ | `dart --version` |
| CocoaPods (macOS/iOS) | Última | `pod --version` |
| Xcode (macOS/iOS) | 15.0+ | `xcodebuild -version` |
| Android Studio (Android) | Flamingo+ | - |

---

## Instalación 🔧

### 1. Clonar el repositorio

```sh
git clone <repository-url>
cd financial_portfolio
```

### 2. Instalar dependencias de Flutter

```sh
flutter pub get
```

### 3. Generar código (freezed, l10n, etc.)

```sh
dart run build_runner build --delete-conflicting-outputs
```

### 4. Configuración específica por plataforma

#### iOS

```sh
cd ios
pod install
cd ..
```

#### macOS

```sh
cd macos
pod install
cd ..
```

---

## Ejecutar la Aplicación 🚀

Este proyecto contiene 3 flavors:

- **development** - Entorno de desarrollo
- **staging** - Entorno de pruebas
- **production** - Entorno de producción

### Comandos de ejecución

```sh
# Development
flutter run --flavor development --target lib/main/main_development.dart

# Staging
flutter run --flavor staging --target lib/main/main_staging.dart

# Production
flutter run --flavor production --target lib/main/main_production.dart
```

### Ejecutar en dispositivo específico

```sh
# Listar dispositivos disponibles
flutter devices

# Ejecutar en un dispositivo específico
flutter run -d <device_id> --flavor development --target lib/main/main_development.dart
```

### Usando VSCode/Android Studio

También puedes usar las configuraciones de lanzamiento preconfiguradas en `.idea/runConfigurations/` o `.vscode/launch.json`.

---

## Plataformas Soportadas 📱

| Plataforma | Soportada |
|------------|-----------|
| iOS | ✅ |
| Android | ✅ |
| Web | ✅ |
| macOS | ✅ |
| Windows | ✅ |

---

## Arquitectura del Proyecto 🏗️

El proyecto sigue **Clean Architecture** con enfoque **feature-first**:

```
lib/
├── app/                    # Configuración de la app
├── l10n/                   # Internacionalización
├── main/                   # Entry points por flavor
├── portfolio/              # Feature: Portfolio
│   ├── bloc/               # State management
│   ├── view/               # Páginas
│   └── widgets/            # Widgets específicos
└── theme_selector/         # Feature: Selector de tema

packages/
├── app_ui/                 # Design system y componentes UI
├── portfolio_api/          # Capa de datos (API)
└── portfolio_repository/   # Capa de repositorio
```

---

## Running Tests 🧪

### Ejecutar todos los tests

```sh
flutter test
```

### Con cobertura

```sh
flutter test --coverage
```

### Ver reporte de cobertura

```sh
# Generar reporte HTML
genhtml coverage/lcov.info -o coverage/

# Abrir reporte
open coverage/index.html
```

---

## Solución de Problemas 🔧

### Error: "CocoaPods not installed"

```sh
# Instalar CocoaPods
sudo gem install cocoapods
```

### Error: "Pods not found" o problemas con dependencias iOS/macOS

```sh
# Limpiar y reinstalar pods
cd ios && pod deintegrate && pod install && cd ..
cd macos && pod deintegrate && pod install && cd ..
```

### Error: "build_runner" o archivos generados faltantes

```sh
dart run build_runner build --delete-conflicting-outputs
```

### Limpiar el proyecto completamente

```sh
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
cd ios && pod install && cd ..
cd macos && pod install && cd ..
```

---

## Working with Translations 🌐

Este proyecto usa [flutter_localizations][flutter_localizations_link] para internacionalización.

### Agregar nuevos strings

1. Abrir `lib/l10n/arb/app_en.arb`
2. Agregar el nuevo key/value:

```arb
{
    "@@locale": "en",
    "portfolioTitle": "My Portfolio",
    "@portfolioTitle": {
        "description": "Title of the portfolio page"
    }
}
```

3. Agregar traducción en `lib/l10n/arb/app_es.arb`

4. Generar localizaciones:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

---

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
