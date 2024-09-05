import 'package:flutter/material.dart';
import 'signUp.dart'; // Import the SignUpScreen

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'HEALTH SYNC',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'IMPROVE YOUR LIFESTYLE',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Striving to improve community health care and practices',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Image.asset(
                  'lib/assets/images/introscreen.png', // Update this path to your PNG file
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                  );
                },
                backgroundColor: Colors.lightBlue,
                child: const Icon(Icons.arrow_forward),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
