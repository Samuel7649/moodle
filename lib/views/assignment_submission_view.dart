import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/widgets/moodle_scaffold.dart';

class AssignmentSubmissionView extends StatefulWidget {
  const AssignmentSubmissionView({Key? key}) : super(key: key);

  @override
  State<AssignmentSubmissionView> createState() =>
      _AssignmentSubmissionViewState();
}

class _AssignmentSubmissionViewState extends State<AssignmentSubmissionView> {
  String? fileName;
  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    return MoodleScaffold(
      title: 'Submit assignment',
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Moodle mobile application',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: moodlePurple,
            ),
          ),
          const SizedBox(height: 6),
          const Text('Due 31 July 2026 at 1:00 pm'),
          const SizedBox(height: 18),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    submitted ? 'Submission status: Submitted' : 'Submission status: Not submitted',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: submitted ? Colors.green : Colors.orange.shade800,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const TextField(
                    minLines: 3,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Repository link or submission note',
                      hintText: 'https://github.com/username/moodle',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 14),
                  OutlinedButton.icon(
                    onPressed: () => setState(
                      () => fileName = 'moodle_coursework.zip',
                    ),
                    icon: const Icon(Icons.attach_file),
                    label: const Text('Choose file'),
                  ),
                  if (fileName != null)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.folder_zip_outlined),
                      title: Text(fileName!),
                      trailing: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => setState(() => fileName = null),
                      ),
                    ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        setState(() => submitted = true);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Submission saved locally')),
                        );
                      },
                      child: const Text('Save submission'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
