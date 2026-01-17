# SensorsAppMobile

A Flutter mobile application that demonstrates the use of various device sensors to collect and display real-time sensor data. This app showcases how to integrate and utilize sensors commonly found in modern smartphones and tablets.

## Features

The app provides dedicated screens for the following sensors:

### Accelerometer
- **Function**: Measures the acceleration force applied to the device in three dimensions (X, Y, Z axes).
- **Units**: Meters per second squared (m/s²)
- **Use Cases**: Detecting device movement, orientation changes, and gestures like shaking or tilting.
- **Implementation**: Uses `accelerometerEventStream()` from the `sensors_plus` package to listen for `AccelerometerEvent` objects containing x, y, z acceleration values.

### Gyroscope
- **Function**: Measures the device's angular velocity or rate of rotation around three axes.
- **Units**: Radians per second (rad/s)
- **Use Cases**: Tracking device rotation, implementing motion controls in games, and stabilizing camera footage.
- **Implementation**: Uses `gyroscopeEventStream()` to listen for `GyroscopeEvent` with x, y, z angular velocity values.

### Magnetometer
- **Function**: Measures the strength and direction of the magnetic field around the device.
- **Units**: Microtesla (µT)
- **Use Cases**: Digital compass functionality, metal detection, and augmented reality applications.
- **Implementation**: Uses `magnetometerEventStream()` to capture `MagnetometerEvent` with x, y, z magnetic field components.

### Barometer
- **Function**: Measures atmospheric pressure.
- **Units**: Hectopascals (hPa) or millibars (mbar)
- **Use Cases**: Weather forecasting, altitude estimation, and indoor navigation.
- **Implementation**: Uses `barometerEventStream()` to listen for `BarometerEvent` containing pressure readings.

### Camera
- **Function**: Provides access to the device's camera for capturing images or video.
- **Use Cases**: Photo capture, video recording, and augmented reality overlays.
- **Implementation**: Uses the `camera` package to initialize and control camera functionality, separate from sensor_plus.

## Dependencies

- **Flutter SDK**: ^3.10.7
- **sensors_plus**: ^7.0.0 - For accessing accelerometer, gyroscope, magnetometer, and barometer sensors
- **camera**: ^0.10.5+9 - For camera functionality

## How sensor_plus is Used

The `sensors_plus` package provides a unified API for accessing device sensors across different platforms (Android, iOS, web). In this app:

1. **Event Streams**: Each sensor screen subscribes to its respective event stream using methods like `accelerometerEventStream()`, `gyroscopeEventStream()`, etc.

2. **State Management**: Sensor data is managed in stateful widgets using `StreamSubscription` to listen for sensor events and update the UI in real-time.

3. **Error Handling**: Each subscription includes error handling to display any issues with sensor access.

4. **Lifecycle Management**: Subscriptions are properly cancelled in the `dispose()` method to prevent memory leaks.

Example usage pattern:
```dart
late StreamSubscription<SensorEvent> _subscription;

@override
void initState() {
  super.initState();
  _subscription = sensorEventStream().listen((event) {
    setState(() {
      // Update sensor values
    });
  }, onError: (error) {
    // Handle errors
  });
}

@override
void dispose() {
  _subscription.cancel();
  super.dispose();
}
```

## Getting Started

1. **Prerequisites**:
   - Flutter SDK installed
   - Android Studio or Xcode for platform-specific development
   - A physical device or emulator with sensor support

2. **Installation**:
   ```bash
   cd sensor_app
   flutter pub get
   ```

3. **Running the App**:
   ```bash
   flutter run
   ```

4. **Permissions**:
   - The app requires camera and sensor permissions on Android/iOS
   - Ensure permissions are granted in device settings if needed

## Project Structure

```
lib/
├── main.dart              # App entry point and home screen
├── screens/               # Individual sensor screens
│   ├── accelerometer_screen.dart
│   ├── barometer_screen.dart
│   ├── camera_screen.dart
│   ├── gyroscope_screen.dart
│   └── magnetometer_screen.dart
└── widgets/
    └── custom_app_bar.dart # Reusable app bar widget
```

## Platform Support

- **Android**: Full support for all sensors
- **iOS**: Full support for all sensors
- **Web**: Limited support (primarily accelerometer via device orientation)
- **Desktop**: Limited or no sensor support depending on platform

## Contributing

This is a demonstration app. For educational purposes, feel free to modify and experiment with different sensor integrations.

## License

This project is for educational use.
