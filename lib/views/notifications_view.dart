import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/widgets/moodle_scaffold.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const alerts = [
      {
        'title': 'Coursework submission reminder',
        'message': 'Your UXDI Moodle application is due on 31 July at 1:00 pm.',
        'date': 'Today',
      },
      {
        'title': 'New announcement in PAPL',
        'message': 'Revision materials have been added to the module page.',
        'date': 'Yesterday',
      },
      {
        'title': 'Calendar updated',
        'message': 'A new Distributed and Cloud Systems deadline was added.',
        'date': '28 July',
      },
    ];

    return MoodleScaffold(
      title: 'Notifications',
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: moodlePurple,
            ),
          ),
          const SizedBox(height: 16),
          ...alerts.map(
            (alert) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: moodleBorder),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(14),
                leading: const CircleAvatar(
                  backgroundColor: moodleGrayBg,
                  child: Icon(Icons.notifications_outlined, color: moodlePurple),
                ),
                title: Text(
                  alert['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${alert['message']}\n${alert['date']}'),
                isThreeLine: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
