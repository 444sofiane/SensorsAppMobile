import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';
import '../widgets/custom_app_bar.dart';

class AccelerometerScreen extends StatefulWidget {
  @override
  _AccelerometerScreenState createState() => _AccelerometerScreenState();
}

class _AccelerometerScreenState extends State<AccelerometerScreen> {
  double x = 0.0, y = 0.0, z = 0.0;
  String errorMessage = "success";
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription = accelerometerEventStream().listen((AccelerometerEvent event) {
        setState(() {
          x = event.x;
          y = event.y;
          z = event.z;
        });
      },
    onError: (error) {
      setState(() {
        errorMessage = error.toString();
      });
    },
    cancelOnError: true,);
  }

  @override
  void dispose() {
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Accelerometer'),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Acceleration (m/s²)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 20),
            Text('X: ${x.toStringAsFixed(2)}', style: TextStyle(fontSize: 24, color: Colors.white)),
            Text('Y: ${y.toStringAsFixed(2)}', style: TextStyle(fontSize: 24, color: Colors.white)),
            Text('Z: ${z.toStringAsFixed(2)}', style: TextStyle(fontSize: 24, color: Colors.white)),
            SizedBox(height: 20),
            Text('Status: $errorMessage', style: TextStyle(fontSize: 16, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}