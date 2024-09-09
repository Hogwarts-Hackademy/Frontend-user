import 'package:flutter/material.dart';

class HospitalListScreen extends StatelessWidget {
  final List<Map<String, String>> hospitals = [
    {
      'name': 'Indraprastha Apollo Hospitals',
      'location': 'New Delhi, Delhi',
      'phone': '011 7179 1090'
    },
    {
      'name': 'AIG Hospitals',
      'location': 'Hyderabad, Telangana',
      'phone': '040 4244 4222'
    },
    {
      'name': 'Parul Sevashram Hospital',
      'location': 'Vadodara, Gujarat',
      'phone': '1800 889 9774'
    },
    {
      'name': 'Geetanjali Hospital',
      'location': 'Eklingpura, Rajasthan',
      'phone': '0294 250 0006'
    },
  ];

  HospitalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospitals'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        elevation: 0,
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
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hospitals.length,
              itemBuilder: (context, index) {
                final hospital = hospitals[index];
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage('lib/assets/images/hospital_icon.png'),
                  ),
                  title: Text(hospital['name']!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hospital['location']!),
                      Text(hospital['phone']!),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to Doctor List when user taps on a hospital
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DoctorListScreen(hospitalName: hospital['name']!),
                      ),
                    );
                  },
                );
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
            icon: Icon(Icons.phone),
            label: 'Emergency',
          ),
        ],
      ),
    );
  }
}

// Doctor List Screen (DoctorListScreen) after hospital selection
class DoctorListScreen extends StatelessWidget {
  final String hospitalName;

  DoctorListScreen({super.key, required this.hospitalName});

  final List<Doctor> doctors = [
    Doctor(name: 'Dr. Alexa Sharma', specialty: 'Neurologist'),
    Doctor(name: 'Dr. Alexa Sharma', specialty: 'Cardiologist'),
    Doctor(name: 'Dr. Alexa Sharma', specialty: 'Physiotherapist'),
    Doctor(name: 'Dr. Alexa Sharma', specialty: 'Orthologist'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors at $hospitalName'),
        backgroundColor: Colors.blueAccent,
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
        backgroundImage: AssetImage(
            'lib/assets/images/doctor.png'), // Add doctor avatar image path
      ),
      title: Text(doctor.name),
      subtitle: Text(doctor.specialty),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        // Handle tile tap
      },
    );
  }
}

class Doctor {
  final String name;
  final String specialty;

  Doctor({required this.name, required this.specialty});
}
