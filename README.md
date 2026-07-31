# Moodle Mobile

This project is a mobile focused Moodle application made with Flutter. It recreates the main areas that a student uses to check courses, assessments, deadlines and announcements.

## Student details

Name: Samuel Areoye

Student number: UP2246941

Course: BSc (Hons) Computer Science

## Features

The application includes a dashboard, navigation drawer, student profile, searchable courses, expandable course topics, assessments, an interactive calendar, notifications, a login screen and a local assignment submission form.

The layout is designed for mobile screens first. Course cards change to a two column layout when the available screen width is larger.

## Running the project

Make sure Flutter is installed and Chrome is available.

```text
flutter pub get
flutter run -d chrome
```

Open Chrome developer tools and select a mobile device to check the mobile layout.

## Testing

Run the widget tests with:

```text
flutter test
```

The tests check the dashboard, drawer navigation, profile details, course filtering and login navigation.

## Project structure

`lib/models` contains the course and deadline models.

`lib/data` contains the sample course and deadline information.

`lib/views` contains each application screen.

`lib/widgets` contains shared layout and navigation widgets.
