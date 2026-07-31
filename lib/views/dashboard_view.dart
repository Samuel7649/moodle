import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/data/app_data.dart';
import 'package:moodle/widgets/moodle_scaffold.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoodleScaffold(
      title: 'Dashboard',
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Welcome back, Samuel',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: moodlePurple,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Here is what is happening with your learning.',
            style: TextStyle(color: moodleTextMuted),
          ),
          const SizedBox(height: 22),
          _SectionCard(
            title: 'Course overview',
            action: 'View courses',
            onPressed: () => Navigator.pushNamed(context, '/courses'),
            child: Column(
              children: courses.take(3).map((course) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: Color(course.colourValue),
                    child: Text(
                      course.code.substring(0, 1),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(course.title),
                  subtitle: LinearProgressIndicator(value: course.progress),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.pushNamed(context, '/course-details'),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 18),
          _SectionCard(
            title: 'Upcoming deadlines',
            action: 'Open calendar',
            onPressed: () => Navigator.pushNamed(context, '/calendar'),
            child: Column(
              children: deadlines.take(2).map((deadline) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.event, color: moodlePurple),
                  title: Text(deadline.title),
                  subtitle: Text(
                    '${deadline.course}  ${_date(deadline.date)}',
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 18),
          _SectionCard(
            title: 'Latest announcement',
            action: 'View all',
            onPressed: () => Navigator.pushNamed(context, '/notifications'),
            child: const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.campaign_outlined, color: moodlePurple),
              title: Text('Coursework submission reminder'),
              subtitle: Text(
                'Remember to submit your public repository link before the deadline.',
              ),
            ),
          ),
        ],
      ),
    );
  }

  static String _date(DateTime date) {
    return '${date.day}/${date.month}/${date.year} at ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.action,
    required this.onPressed,
    required this.child,
  });

  final String title;
  final String action;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: moodleBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(onPressed: onPressed, child: Text(action)),
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}
