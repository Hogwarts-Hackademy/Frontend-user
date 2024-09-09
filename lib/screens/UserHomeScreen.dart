import 'package:flutter/material.dart';
import 'doctor_list_screen.dart';
import 'hospital_search_screen.dart';
import 'Setting.dart';
import 'SearchPage.dart';
import 'MedicalReportScreen.dart'; // Import the medical report screen

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Good Morning!\nJack',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingsPage(),
                                    ),
                                  );
                                },
                                child: const Icon(Icons.settings, size: 28),
                              ),
                              const SizedBox(width: 10),
                              const Icon(Icons.notifications, size: 28),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Search...',
                                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                              Icon(Icons.search, size: 28),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Service',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.5,
                  children: [
                    _buildServiceCard(context, 'Doctors'),
                    _buildServiceCard(context, 'Hospitals'),
                    _buildServiceCard(context, 'Medical Report'),
                    _buildServiceCard(context, 'Volunteer'),
                    _buildServiceCard(context, 'Abha Card'),
                    _buildServiceCard(context, 'Ambulance'),
                    _buildServiceCard(context, 'Insurance'),
                    _buildServiceCard(context, 'Schemes'),
                  ],
                ),
              ],
            ),
          ),
        ),
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

  Widget _buildServiceCard(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        if (title == 'Doctors') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoctorListScreen()),
          );
        } else if (title == 'Hospitals') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HospitalSearchScreen()),
          );
        } else if (title == 'Medical Report') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MedicalReportScreen()),
          );
        }
      },
      child: Card(
        elevation: 2,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
