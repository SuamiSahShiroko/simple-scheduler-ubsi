// welcome_screen.dart
import 'package:flutter/material.dart';
import 'widget/alarm_logo.dart';
import 'scheduler_app.dart'; // Import the SchedulerApp class

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlarmLogo(),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Aplikasi Penjadwalan Sederhana',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Center the text
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SchedulerApp()),
                );
              },
              child: Text('MULAI'),
            ),
          ],
        ),
      ),
    );
  }
}
