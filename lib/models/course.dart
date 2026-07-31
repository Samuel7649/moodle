class Course {
  const Course({
    required this.code,
    required this.title,
    required this.lecturer,
    required this.progress,
    required this.colourValue,
  });

  final String code;
  final String title;
  final String lecturer;
  final double progress;
  final int colourValue;
}
