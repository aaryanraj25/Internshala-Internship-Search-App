import 'package:flutter/material.dart';
import 'package:internshala/models/internship_model.dart';

class InternshipCard extends StatelessWidget {
  final Internship internship;

  InternshipCard({required this.internship});

  Color getBackgroundLabelColor(String label) {
    if (label == 'Today' || label == 'Yesterday') {
      return Colors.green[50]!;
    } else if (label.contains('day')) {
      int days = int.parse(label.split(' ')[0]);
      if (days <= 2) {
        return Colors.green[50]!;
      } else if (days <= 7) {
        return Colors.blue[50]!;
      }
    }
    return Colors.grey[100]!;
  }

  Color getTextLabelColor(String label) {
    if (label == 'Today' || label == 'Yesterday') {
      return Colors.green[700]!;
    } else if (label.contains('day')) {
      int days = int.parse(label.split(' ')[0]);
      if (days <= 2) {
        return Colors.green[700]!;
      } else if (days <= 7) {
        return Colors.blue[700]!;
      }
    }
    return Colors.grey[700]!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              internship.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              internship.company,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.location_on, size: 18, color: Colors.grey[900]),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    internship.locations.join(", "),
                    style: TextStyle(color: Colors.grey[900], fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.play_circle_fill, size: 18, color: Colors.grey[900]),
                SizedBox(width: 6),
                Text(
                  internship.startDate,
                  style: TextStyle(color: Colors.grey[900], fontSize: 16),
                ),
                SizedBox(width: 18),
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[900]),
                SizedBox(width: 6), // Reduced space here
                Text(
                  '${internship.duration}',
                  style: TextStyle(color: Colors.grey[900], fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.money, size: 18, color: Colors.grey[900]),
                SizedBox(width: 6),
                Text(
                  internship.stipend,
                  style: TextStyle(color: Colors.grey[900], fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 15),
            if (internship.labelsAppInCard.isNotEmpty)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  internship.labelsAppInCard.join(", ") + (internship.ppoLabelValue != null ? ' ' + internship.ppoLabelValue! : ''),
                  style: TextStyle(color: Colors.grey[800], fontSize: 14),
                ),
              ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: getBackgroundLabelColor(internship.postedTimeAgo),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.access_time, size: 16, color: getTextLabelColor(internship.postedTimeAgo)),
                      SizedBox(width: 4),
                      Text(
                        internship.postedTimeAgo,
                        style: TextStyle(color: getTextLabelColor(internship.postedTimeAgo), fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Divider(color: const Color.fromARGB(255, 192, 192, 192)),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to details
                },
                child: Text('View details', style: TextStyle(color: Colors.blue, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
