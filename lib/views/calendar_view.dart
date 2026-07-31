import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/data/app_data.dart';
import 'package:moodle/widgets/moodle_scaffold.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  bool showAll = true;
  DateTime selectedDate = DateTime(2026, 7, 31);

  @override
  Widget build(BuildContext context) {
    final shown = deadlines.where((deadline) {
      return showAll ||
          (deadline.date.year == selectedDate.year &&
              deadline.date.month == selectedDate.month &&
              deadline.date.day == selectedDate.day);
    }).toList();

    return MoodleScaffold(
      title: 'Calendar',
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Calendar',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: moodlePurple,
            ),
          ),
          const SizedBox(height: 12),
          CalendarDatePicker(
            initialDate: selectedDate,
            firstDate: DateTime(2026, 1),
            lastDate: DateTime(2027, 12),
            onDateChanged: (date) {
              setState(() {
                selectedDate = date;
                showAll = false;
              });
            },
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Deadlines',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              FilterChip(
                label: const Text('Show all'),
                selected: showAll,
                onSelected: (value) => setState(() => showAll = value),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (shown.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: Text('No deadlines on this date')),
            )
          else
            ...shown.map(
              (deadline) => Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: const Icon(Icons.event, color: moodlePurple),
                  title: Text(deadline.title),
                  subtitle: Text(
                    '${deadline.course}  ${deadline.date.day}/${deadline.date.month}/${deadline.date.year} at ${deadline.date.hour}:00',
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
