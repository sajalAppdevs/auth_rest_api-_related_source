# Auth REST API Flutter App

A Flutter application demonstrating REST API integration with authentication functionality using the reqres.in API service.

## Features

- User Authentication
- REST API Integration
- Clean and Modern UI
- Error Handling

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Android Studio / VS Code
- Basic knowledge of Flutter and Dart

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/auth_rest_api.git
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## API Integration

This project uses the [reqres.in](https://reqres.in) API for authentication.

### Authentication Endpoint

- **URL**: https://reqres.in/api/register
- **Method**: POST
- **Content-Type**: application/json

### Sample Request

```json
{
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
}
```

## Project Structure

- `lib/` - Contains the main source code
  - `screens/` - UI screens
  - `services/` - API services and network calls
  - `models/` - Data models
  - `widgets/` - Reusable UI components

## Flutter Resources

For help getting started with Flutter development:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Online documentation](https://docs.flutter.dev/)

## License

This project is licensed under the MIT License - see the LICENSE file for details.
