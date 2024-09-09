import 'package:flutter/material.dart';
import 'doctor_list_screen.dart'; // Import the DoctorListScreen

class HospitalSearchScreen extends StatelessWidget {
  const HospitalSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospitals'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: hospitals.length,
                  itemBuilder: (context, index) {
                    final hospital = hospitals[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
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
                          // Navigate to the DoctorListScreen when a hospital is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorListScreen(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
