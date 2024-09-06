import 'package:flutter/material.dart';
import 'signUp.dart';
import 'UserHomeScreen.dart';
import 'ForgotPasswordScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back button functionality
          },
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LOGIN',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            // Email input field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Password input field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {
                    // Add visibility toggle logic here
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Forgot Password logic here
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),);
                },
                child: const Text('Forgot Password?'),
              ),
            ),
            const SizedBox(height: 16),
            // Login button
            ElevatedButton(
              onPressed: () {
                // Add login logic here
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserHomeScreen()),
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[300], // Updated to backgroundColor
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set text color to black
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text('OR'),
            const SizedBox(height: 20),
            // Register Now link in a new line
            Column(
              children: [
                const Text("Don’t have an account?"),
                TextButton(
                  onPressed: () {
                    // Navigate to SignUp screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text(
                    'Register now',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
