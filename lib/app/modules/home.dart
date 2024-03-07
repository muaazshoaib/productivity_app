import 'package:flutter/material.dart';
import 'package:productivity_app/app/modules/notes_taking/document_scanner/pages/document_scanner.dart';
import 'package:productivity_app/app/modules/settings/pages/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;

  final pages = const [
    // TodayAllTodosPage(),
    // TaskManagerPage(),
    // CalendarPage(),
    // ChatGPTPage(),
  ];

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: IndexedStack(
        index: tabIndex,
        // children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onDestinationSelected: (int index) => changeTabIndex(index),
        indicatorColor: Colors.black.withAlpha(50),
        selectedIndex: tabIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            selectedIcon: Icon(
              Icons.list,
              color: Colors.black,
            ),
            label: 'Tasks',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            selectedIcon: Icon(
              Icons.calendar_today,
              color: Colors.black,
            ),
            label: 'Calender',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat),
            selectedIcon: Icon(
              Icons.chat,
              color: Colors.black,
            ),
            label: 'Chat GPT',
          ),
        ],
      ),
      drawer: const _MainDrawer(),
    );
  }
}

class _MainDrawer extends StatelessWidget {
  const _MainDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.symmetric(vertical: 50),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.black,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.playlist_add_check,
                size: 48.0,
                color: Colors.white,
              ),
              title: Text(
                'Productivity App',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.remove_red_eye),
            title: Text('Focus Mode'),
            // onTap: () async {
            //   bool? isNotificationPolicyAccessGranted =
            //       await FlutterDnd.isNotificationPolicyAccessGranted;

            //   if (isNotificationPolicyAccessGranted!) {
            //     if (context.mounted) {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const AllFocusModesFeaturesScreen(),
            //         ),
            //       );
            //     }
            //   } else {
            //     if (context.mounted) {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const AllowFocusModeScreen(),
            //         ),
            //       );
            //     }
            //   }
            // },
          ),
          ListTile(
            leading: const Icon(Icons.build),
            title: const Text('Productivity Tools'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const IntegratingOthers(),
              //   ),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_add),
            title: const Text('Note-taking'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => const NotesTakingScreen(),
                  builder: (context) => const DocumentScannerPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Analytics'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const AnalyticsScreen(),
              //   ),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Pomodoro Timer'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const PomodoroScreen(),
              //   ),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Habit Tracker'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const HabitTrackerScreen(),
              //   ),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
