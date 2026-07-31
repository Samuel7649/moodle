import 'package:moodle/models/course.dart';
import 'package:moodle/models/deadline.dart';

const courses = [
  Course(
    code: 'PAPL',
    title: 'Programming Applications and Programming Languages',
    lecturer: 'School of Computing',
    progress: 0.72,
    colourValue: 0xFF5D2D5F,
  ),
  Course(
    code: 'UXDI',
    title: 'User Experience Design and Implementation',
    lecturer: 'School of Computing',
    progress: 0.64,
    colourValue: 0xFF006B75,
  ),
  Course(
    code: 'DACS',
    title: 'Distributed and Cloud Systems',
    lecturer: 'School of Computing',
    progress: 0.81,
    colourValue: 0xFF315A9A,
  ),
  Course(
    code: 'TCS',
    title: 'Theoretical Computer Science',
    lecturer: 'School of Computing',
    progress: 0.58,
    colourValue: 0xFF9A572F,
  ),
];

final deadlines = [
  Deadline(
    title: 'Moodle mobile application',
    course: 'UXDI',
    date: DateTime(2026, 7, 31, 13),
    status: 'Due',
  ),
  Deadline(
    title: 'Programming exam',
    course: 'PAPL',
    date: DateTime(2026, 8, 4, 10),
    status: 'Upcoming',
  ),
  Deadline(
    title: 'Cloud systems report',
    course: 'DACS',
    date: DateTime(2026, 8, 8, 16),
    status: 'Upcoming',
  ),
];
