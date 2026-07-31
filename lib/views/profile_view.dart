import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/widgets/moodle_scaffold.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoodleScaffold(
      title: 'Profile',
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const SizedBox(height: 12),
          const CircleAvatar(
            radius: 48,
            backgroundColor: moodlePurple,
            child: Text(
              'SA',
              style: TextStyle(
                color: moodleWhite,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Center(
            child: Text(
              'Samuel Areoye',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Text(
              'Computer Science student',
              style: TextStyle(color: moodleTextMuted),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: moodleBorder),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              children: [
                _ProfileRow(
                  icon: Icons.badge_outlined,
                  label: 'Student number',
                  value: 'UP2246941',
                ),
                Divider(height: 1),
                _ProfileRow(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: 'up2246941@myport.ac.uk',
                ),
                Divider(height: 1),
                _ProfileRow(
                  icon: Icons.school_outlined,
                  label: 'Course',
                  value: 'BSc (Hons) Computer Science',
                ),
                Divider(height: 1),
                _ProfileRow(
                  icon: Icons.location_on_outlined,
                  label: 'Institution',
                  value: 'University of Portsmouth',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  const _ProfileRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: moodlePurple),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
