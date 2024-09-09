import 'package:flutter/material.dart';

class MedicalReportScreen extends StatelessWidget {
  final List<Map<String, String>> reports = [
    {
      'doctor': 'Dr. Alexa Sharma',
      'hospital': 'Indraprastha Apollo Hospitals',
      'specialization': 'Neurologist',
      'date': '06/12/2024',
    },
    {
      'doctor': 'Dr. Alexa Sharma',
      'hospital': 'Indraprastha Apollo Hospitals',
      'specialization': 'Neurologist',
      'date': '05/12/2024',
    },
    {
      'doctor': 'Dr. Alexa Sharma',
      'hospital': 'Indraprastha Apollo Hospitals',
      'specialization': 'Neurologist',
      'date': '04/12/2024',
    },
    {
      'doctor': 'Dr. Alexa Sharma',
      'hospital': 'Indraprastha Apollo Hospitals',
      'specialization': 'Neurologist',
      'date': '03/12/2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Report'),
        backgroundColor: Colors.purple[300],
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blue[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                title: Text(reports[index]['doctor']!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(reports[index]['hospital']!),
                    Text(reports[index]['specialization']!),
                  ],
                ),
                trailing: Text(reports[index]['date']!),
              ),
            ),
          );
        },
      ),
    );
  }
}
