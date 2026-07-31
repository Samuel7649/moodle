import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    return Drawer(
      backgroundColor: moodlePurple,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            InkWell(
              onTap: () => _open(context, '/profile', currentRoute),
              child: const DrawerHeader(
                decoration: BoxDecoration(color: moodleDarkPurple),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: moodleWhite,
                      child: Text(
                        'SA',
                        style: TextStyle(
                          color: moodlePurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Samuel Areoye',
                      style: TextStyle(
                        color: moodleWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'up2246941@myport.ac.uk',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            _item(context, currentRoute, '/', Icons.speed_outlined, 'Dashboard'),
            _item(context, currentRoute, '/courses', Icons.school_outlined, 'My courses'),
            _item(context, currentRoute, '/assessments', Icons.assignment_outlined, 'Assessments'),
            _item(context, currentRoute, '/calendar', Icons.calendar_month_outlined, 'Calendar'),
            _item(context, currentRoute, '/notifications', Icons.notifications_outlined, 'Notifications'),
            _item(context, currentRoute, '/profile', Icons.person_outline, 'Profile'),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.logout, color: moodleWhite),
              title: const Text('Log out', style: TextStyle(color: moodleWhite)),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context,
    String currentRoute,
    String route,
    IconData icon,
    String label,
  ) {
    return ListTile(
      leading: Icon(icon, color: moodleWhite),
      title: Text(label, style: const TextStyle(color: moodleWhite)),
      selected: currentRoute == route,
      selectedTileColor: Colors.white24,
      onTap: () => _open(context, route, currentRoute),
    );
  }

  void _open(BuildContext context, String route, String currentRoute) {
    Navigator.pop(context);
    if (currentRoute != route) {
      Navigator.pushReplacementNamed(context, route);
    }
  }
}
