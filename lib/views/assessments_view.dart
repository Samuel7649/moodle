import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/data/app_data.dart';
import 'package:moodle/widgets/moodle_scaffold.dart';

class AssessmentsView extends StatelessWidget {
  const AssessmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoodleScaffold(
      title: 'Assessments',
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Assessments',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: moodlePurple,
            ),
          ),
          const SizedBox(height: 16),
          ...deadlines.map(
            (deadline) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: moodleBorder),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(14),
                leading: const CircleAvatar(
                  backgroundColor: moodleGrayBg,
                  child: Icon(Icons.assignment_outlined, color: moodlePurple),
                ),
                title: Text(
                  deadline.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${deadline.course}\nDue ${deadline.date.day}/${deadline.date.month}/${deadline.date.year} at ${deadline.date.hour}:00',
                ),
                isThreeLine: true,
                trailing: Chip(label: Text(deadline.status)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
