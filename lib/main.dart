import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/views/assessments_view.dart';
import 'package:moodle/views/assignment_submission_view.dart';
import 'package:moodle/views/calendar_view.dart';
import 'package:moodle/views/course_details_view.dart';
import 'package:moodle/views/courses_view.dart';
import 'package:moodle/views/dashboard_view.dart';
import 'package:moodle/views/login_view.dart';
import 'package:moodle/views/notifications_view.dart';
import 'package:moodle/views/profile_view.dart';

void main() {
  runApp(const MoodleApp());
}

class MoodleApp extends StatelessWidget {
  const MoodleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moodle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: moodlePurple,
          primary: moodlePurple,
          secondary: moodleSecondary,
          surface: moodleSurface,
        ),
        scaffoldBackgroundColor: moodleBg,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardView(),
        '/login': (context) => const LoginView(),
        '/courses': (context) => const CoursesView(),
        '/course-details': (context) => const CourseDetailsView(),
        '/assessments': (context) => const AssessmentsView(),
        '/assignment': (context) => const AssignmentSubmissionView(),
        '/calendar': (context) => const CalendarView(),
        '/notifications': (context) => const NotificationsView(),
        '/profile': (context) => const ProfileView(),
      },
    );
  }
}
