import 'package:flutter/material.dart';

// Define a model to hold doctor and hospital information
class Doctor {
  final String name;
  final String specialty;
  final String hospital;

  Doctor({required this.name, required this.specialty, required this.hospital});
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Doctor> doctors = [
    Doctor(
        name: 'Dr. Alexa Sharma',
        specialty: 'Neurologist',
        hospital: 'Indraprastha Apollo Hospitals'),
    Doctor(
        name: 'Dr. Alexa Sharma',
        specialty: 'Physiotherapist',
        hospital: 'Indraprastha Apollo Hospitals'),
    Doctor(
        name: 'Dr. Alexa Sharma',
        specialty: 'Cardiologist',
        hospital: 'Indraprastha Apollo Hospitals'),
    Doctor(
        name: 'Dr. Alexa Sharma',
        specialty: 'Orthopedist',
        hospital: 'Indraprastha Apollo Hospitals'),
  ];

  List<Doctor> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    filteredDoctors = [];
    _searchController.addListener(() {
      filterSearchResults(_searchController.text);
    });
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      // If search is empty, clear results
      setState(() {
        filteredDoctors.clear();
      });
      return;
    } else {
      // Filter the doctor list based on the query
      List<Doctor> tempList = [];
      for (var doctor in doctors) {
        if (doctor.name.toLowerCase().contains(query.toLowerCase()) ||
            doctor.specialty.toLowerCase().contains(query.toLowerCase()) ||
            doctor.hospital.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(doctor);
        }
      }

      // Update the filtered list
      setState(() {
        filteredDoctors = tempList;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Doctors"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Enter doctor name, specialty, or hospital',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: _searchController.text.isEmpty
                ? const Center(child: Text("No results found"))
                : ListView.builder(
                    itemCount: filteredDoctors.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            "${filteredDoctors[index].name} - ${filteredDoctors[index].specialty}"),
                        subtitle: Text(filteredDoctors[index].hospital),
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        trailing: const Icon(Icons.arrow_forward),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
