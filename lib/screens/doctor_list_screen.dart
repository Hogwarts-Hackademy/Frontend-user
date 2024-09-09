// doctor_list_screen.dart
import 'package:flutter/material.dart';
import 'doctor_contact_screen.dart'; // Import the doctor profile screen

class Doctor {
  final String name;
  final String specialty;

  Doctor({required this.name, required this.specialty});
}

class DoctorListScreen extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(name: 'Dr. Alexa Sharma', specialty: 'Neurologist'),
    Doctor(name: 'Dr. Alexa Sharma', specialty: 'Cardiologist'),
    Doctor(name: 'Dr. Alexa Sharma', specialty: 'Physiotherapist'),
    Doctor(name: 'Dr. Alexa Sharma', specialty: 'Orthologist'),
  ];

  DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctors'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return DoctorTile(doctor: doctors[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Emergency',
          ),
        ],
      ),
    );
  }
}

class DoctorTile extends StatelessWidget {
  final Doctor doctor;

  const DoctorTile({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage:
            AssetImage('lib/assets/images/doctor.png'), // Doctor avatar image
      ),
      title: Text(doctor.name),
      subtitle: Text(doctor.specialty),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Navigate to the DoctorProfileScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorContactScreen(doctor: doctor),
          ),
        );
      },
    );
  }
}
