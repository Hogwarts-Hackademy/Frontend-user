import 'package:flutter/material.dart';

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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Good Morning!\nJack',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('lib/assets/images/user.png'),
                                radius: 20,
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.notifications, size: 28),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(25),
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
                            Icon(Icons.search, size: 28),
                          ],
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
            MaterialPageRoute(builder: (context) => const DoctorsListScreen()),
          );
        } else if (title == 'Hospitals') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HospitalSearchScreen()),
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

class DoctorsListScreen extends StatelessWidget {
  const DoctorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctors'),
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
                          hintText: 'Search....',
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
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage(
                              'lib/assets/images/doctor.png'), // Replace with your doctor image
                        ),
                        title: const Text('Dr. Alexa Sharma'),
                        subtitle: Text([
                          'Neurologist',
                          'Cardiologist',
                          'Physiotherapist',
                          'Orthologist'
                        ][index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
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
}

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
                          backgroundImage: AssetImage(
                              'lib/assets/images/hospital_icon.png'), // Replace with your hospital icon
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
                      ),
                    );
                  },
                ),
              ),
            ],
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
}
