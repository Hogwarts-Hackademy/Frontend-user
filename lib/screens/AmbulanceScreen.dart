import 'package:flutter/material.dart';

class AmbulancePage extends StatefulWidget {
  @override
  _AmbulancePageState createState() => _AmbulancePageState();
}

class _AmbulancePageState extends State<AmbulancePage> {
  String selectedSituation = 'Accident - Severe';
  List<String> situations = [
    'Accident - Severe',
    'Accident - Moderate',
    'Heart Attack',
    'Burn',
    'Pregnancy',
    'Others',
  ];

  List<bool> isSelected = [true, false]; // To track selected hospitals

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambulance', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue.shade100,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Situation Dropdown
            DropdownButtonFormField<String>(
              value: selectedSituation,
              items: situations.map((String situation) {
                return DropdownMenuItem<String>(
                  value: situation,
                  child: Text(situation),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSituation = value!;
                });
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Nearby Hospitals Section
            Text(
              'Nearby Hospitals',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),

            // Hospital Cards
            Expanded(
              child: ListView.builder(
                itemCount: 2, // Number of hospitals
                itemBuilder: (context, index) {
                  return HospitalCard(
                    hospitalName: 'Indraprastha Apollo Hospitals',
                    location: 'New Delhi, Delhi',
                    phoneNumber: '011 7179 1090',
                    isSelected: isSelected[index],
                    onChanged: (value) {
                      setState(() {
                        isSelected[index] = value!;
                      });
                    },
                  );
                },
              ),
            ),

            // Call Ambulance Button
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Show dialog when button is pressed
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Call Ambulance'),
                        content:
                            Text('Are you sure you want to call an ambulance?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Implement your action here for calling ambulance
                              Navigator.of(context)
                                  .pop(); // Close the dialog after confirmation
                            },
                            child: Text('Confirm'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Call Ambulance'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final String hospitalName;
  final String location;
  final String phoneNumber;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const HospitalCard({
    required this.hospitalName,
    required this.location,
    required this.phoneNumber,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Checkbox(
              value: isSelected,
              onChanged: onChanged,
            ),
            CircleAvatar(
              backgroundImage:
                  AssetImage('lib/assets/images/hospital_icon.png'), // Add your icon
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hospitalName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(location),
                  Text(phoneNumber),
                ],
              ),
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
