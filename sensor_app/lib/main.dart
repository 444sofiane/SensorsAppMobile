import 'package:flutter/material.dart';
import 'screens/camera_screen.dart';
import 'screens/accelerometer_screen.dart';
import 'screens/barometer_screen.dart';
import 'screens/gyroscope_screen.dart';
import 'screens/magnetometer_screen.dart';
import 'widgets/custom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensor App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange,
        secondary: Colors.blueGrey),
        fontFamily: "Montserrat",
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildButton(BuildContext context, String label, IconData icon, Widget screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: CustomAppBar(
        title: 'Home',
        shape: RoundedRectangleBorder( 
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30), top: Radius.circular(30))),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        children: [
          _buildButton(context, 'Accelerometer', Icons.vibration, AccelerometerScreen()),
          _buildButton(context, 'Barometer', Icons.compress, BarometerScreen()),
          _buildButton(context, 'Camera', Icons.camera, CameraScreen()),
          _buildButton(context, 'Gyroscope', Icons.rotate_right, GyroscopeScreen()),
          _buildButton(context, 'Magnetometer', Icons.explore, MagnetometerScreen()),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: AutomaticNotchedShape( 
          RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(3000))
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          )
        ),
        notchMargin: 6.0,
        color: Theme.of(context).colorScheme.primary,
        child: Container(height: 50.0)
      ),
    );
  }
}
