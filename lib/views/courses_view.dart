import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/data/app_data.dart';
import 'package:moodle/models/course.dart';
import 'package:moodle/widgets/moodle_scaffold.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({Key? key}) : super(key: key);

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final shownCourses = courses.where((course) {
      final search = query.toLowerCase();
      return course.title.toLowerCase().contains(search) ||
          course.code.toLowerCase().contains(search);
    }).toList();

    return MoodleScaffold(
      title: 'My courses',
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'My courses',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: moodlePurple,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search courses',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: moodleWhite,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) => setState(() => query = value),
          ),
          const SizedBox(height: 18),
          if (shownCourses.isEmpty)
            const Center(child: Text('No courses found'))
          else
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 750 ? 2 : 1;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: shownCourses.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: columns == 1 ? 2.15 : 2.4,
                  ),
                  itemBuilder: (context, index) =>
                      _CourseCard(course: shownCourses[index]),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: moodleBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/course-details'),
        child: Row(
          children: [
            Container(
              width: 10,
              color: Color(course.colourValue),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      course.code,
                      style: TextStyle(
                        color: Color(course.colourValue),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      course.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(value: course.progress),
                    const SizedBox(height: 4),
                    Text('${(course.progress * 100).round()}% complete'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
