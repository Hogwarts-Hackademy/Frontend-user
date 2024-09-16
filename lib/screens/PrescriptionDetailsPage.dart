import 'package:flutter/material.dart';

class PrescriptionDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Prescription Details'),
        backgroundColor: Colors.blue.shade100,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Diagnosis Box
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: const Text(
                'Diagnosis',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),

            // Medications Section
            const Text(
              'Medications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Table(
              border: TableBorder.all(color: Colors.black),
              children: [
                _buildTableRow('Pseudoephedrine (Sudafed)'),
                _buildTableRow('Phenylephrine'),
                _buildTableRow('Dextromethorphan (Robitussin)'),
                _buildTableRow('Aspirin'),
              ],
            ),
            SizedBox(height: 16),

            // Tests Section
            Text(
              'Tests',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Table(
              border: TableBorder.all(color: Colors.black),
              children: [
                _buildTableRow('Complete Blood Count (CBC)'),
                _buildTableRow('Liver Function Test (LFT)'),
                _buildTableRow('Blood Glucose Test'),
                _buildTableRow('Thyroid Function Test (TFT)'),
                _buildTableRow('Liver Function Test (LFT)'),
              ],
            ),
            Spacer(),

            // Print Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle print action
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'Print',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a table row
  TableRow _buildTableRow(String text) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ],
    );
  }
}
