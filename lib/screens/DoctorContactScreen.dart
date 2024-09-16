// doctor_profile_screen.dart
import 'package:flutter/material.dart';
import 'DoctorListScreen.dart'; // Import the Doctor class
import 'DoctorDetailsScreen.dart'; // Import the DoctorDetailsPage class

class DoctorContactScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorContactScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: const Text("DOCTOR PROFILE"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Profile Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            color: Colors.lightBlue[100],
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'lib/assets/images/doctor.png'), // Doctor image
                ),
                const SizedBox(height: 10),
                Text(
                  doctor.name, // Doctor's name
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  doctor.specialty, // Doctor's specialty
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 5),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 20),
                    SizedBox(width: 5),
                    Text(
                      "4.8 (2.3 reviews)", // You can pass reviews or rating if you want
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Contact Details Section
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contact Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("91+8546652338"), // Add dynamic phone if needed
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text(
                      "alexasharma@gmail.com"), // Add dynamic email if needed
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title:
                      Text("k-74, Saraswati Vihar, Ph-1\nRohini, Delhi-110085"),
                ),
              ],
            ),
          ),

          const Spacer(), // Spacer to push the button to the bottom

          // Book Appointment Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorDetailsPage1(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "BOOK APPOINTMENT",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
