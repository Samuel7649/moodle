import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/widgets/moodle_scaffold.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoodleScaffold(
      title: 'UXDI',
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: moodlePurple,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UXDI',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 5),
                Text(
                  'User Experience Design and Implementation',
                  style: TextStyle(
                    color: moodleWhite,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const _Topic(
            title: 'General',
            items: [
              _MaterialItem(Icons.campaign_outlined, 'Announcements'),
              _MaterialItem(Icons.description_outlined, 'Module handbook'),
            ],
          ),
          _Topic(
            title: 'Coursework',
            initiallyExpanded: true,
            items: [
              const _MaterialItem(Icons.picture_as_pdf_outlined, 'Coursework brief'),
              const _MaterialItem(Icons.link, 'Fork the starter repository'),
              _MaterialItem(
                Icons.assignment_outlined,
                'Moodle application submission',
                onTap: () => Navigator.pushNamed(context, '/assignment'),
              ),
            ],
          ),
          const _Topic(
            title: 'Week 1  Getting started',
            items: [
              _MaterialItem(Icons.slideshow_outlined, 'Introduction slides'),
              _MaterialItem(Icons.code, 'Flutter setup worksheet'),
            ],
          ),
          const _Topic(
            title: 'Week 2  Mobile layouts',
            items: [
              _MaterialItem(Icons.slideshow_outlined, 'Responsive design slides'),
              _MaterialItem(Icons.code, 'Layout worksheet'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Topic extends StatelessWidget {
  const _Topic({
    required this.title,
    required this.items,
    this.initiallyExpanded = false,
  });

  final String title;
  final List<_MaterialItem> items;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: moodleBorder),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: items,
      ),
    );
  }
}

class _MaterialItem extends StatelessWidget {
  const _MaterialItem(this.icon, this.title, {this.onTap});

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: moodlePurple),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap ?? () {
        showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(_description(title)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  String _description(String itemTitle) {
    const descriptions = {
      'Announcements':
          'Welcome to UXDI. Check this area regularly for module updates and coursework reminders.',
      'Module handbook':
          'The handbook contains the module aims, learning outcomes, teaching schedule and assessment information.',
      'Coursework brief':
          'Create a mobile optimised Moodle application in Flutter and submit the link to your public GitHub repository.',
      'Fork the starter repository':
          'The starter project was forked from the coursework repository before development began.',
      'Introduction slides':
          'An introduction to the module, the coursework and the development process.',
      'Flutter setup worksheet':
          'Instructions for installing Flutter, cloning the repository and running the starter application.',
      'Responsive design slides':
          'An overview of mobile first design and layouts that adapt to different screen sizes.',
      'Layout worksheet':
          'Practical exercises using Flutter layout widgets and responsive design.',
    };
    return descriptions[itemTitle] ?? 'This resource is available for this module.';
  }
}
