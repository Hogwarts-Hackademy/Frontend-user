import 'package:flutter/material.dart';

class DoctorDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {}, // Implement navigation back
        ),
        title: Text('Doctor\'s Details', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://your-image-url.com'), // Doctor's image
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Alexa Sharma',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Heart Specialist',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              'DATE',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateCard(day: '19', weekday: 'Sat'),
                DateCard(day: '20', weekday: 'Sun'),
                DateCard(day: '21', weekday: 'Mon'),
                DateCard(day: '22', weekday: 'Tue'),
                DateCard(day: '23', weekday: 'Wed'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'TIME',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 2.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                TimeSlotCard(time: '10:00 AM'),
                TimeSlotCard(time: '11:00 AM'),
                TimeSlotCard(time: '12:00 PM'),
                TimeSlotCard(time: '10:00 AM'),
                TimeSlotCard(time: '11:00 AM'),
                TimeSlotCard(time: '12:00 PM'),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('DONE'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateCard extends StatelessWidget {
  final String day;
  final String weekday;

  const DateCard({required this.day, required this.weekday});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            weekday,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class TimeSlotCard extends StatelessWidget {
  final String time;

  const TimeSlotCard({required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        time,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
