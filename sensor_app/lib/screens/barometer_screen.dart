import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';
import '../widgets/custom_app_bar.dart';

class BarometerScreen extends StatefulWidget {
  @override
  _BarometerScreenState createState() => _BarometerScreenState();
}

class _BarometerScreenState extends State<BarometerScreen> {
  double pressure = 0.0;
  String errorMessage = "success";
  late StreamSubscription<BarometerEvent> _barometerSubscription;

  @override
  void initState() {
    super.initState();
    _barometerSubscription = barometerEventStream().listen((BarometerEvent event) {
      setState(() {
        pressure = event.pressure;
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
    _barometerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Barometer'),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Atmospheric Pressure (hPa)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 20),
            Text('${pressure.toStringAsFixed(2)}', style: TextStyle(fontSize: 24, color: Colors.white)),
            SizedBox(height: 20),
            Text('Status: $errorMessage', style: TextStyle(fontSize: 16, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}