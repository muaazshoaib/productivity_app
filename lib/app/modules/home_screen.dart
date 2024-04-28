import 'package:flutter/material.dart';
import 'package:flutter_dnd/flutter_dnd.dart';
import 'package:productivity_app/app/modules/task_manager/screens/task_manager_screen.dart';

import '../utils/colors.dart';
import 'analytics/screens/analytics_screen.dart';
import 'event_calendar/screens/event_calendar_screen.dart';
import 'ai_chatbot/screens/ai_chatbot_screen.dart';
import 'focus_mode/screens/all_focus_modes_features_screen.dart';
import 'focus_mode/screens/allow_focus_mode_screen.dart';
import 'habit_tracker/screens/habit_tracker_screen.dart';

import 'notes_taking/pages/notes_page.dart';
import 'pomodoro_timer/screens/pomodoro_screen.dart';
import 'settings/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabIndex = 0;

  final pages = const [
    TaskManagerScreen(),
    EventCalendarScreen(),
    GeminiChatBotScreen(),
  ];

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: IndexedStack(
        index: tabIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: kBackgroundColor,
        onDestinationSelected: (int index) => changeTabIndex(index),
        selectedIndex: tabIndex,
        destinations: const [
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
            label: 'AI ChatBot',
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: ListTile(
              leading: Icon(
                Icons.playlist_add_check,
                size: 48.0,
                color: Colors.white,
              ),
              title: Text(
                'Productivity App',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.remove_red_eye,
              color: Colors.white,
            ),
            title: const Text(
              'Focus Mode',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () async {
              // Navigate to the focus mode screen or perform related action.
              bool? isNotificationPolicyAccessGranted =
                  await FlutterDnd.isNotificationPolicyAccessGranted;

              if (isNotificationPolicyAccessGranted!) {
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllFocusModesFeaturesScreen(),
                    ),
                  );
                }
              } else {
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllowFocusModeScreen(),
                    ),
                  );
                }
              }
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.note_add,
              color: Colors.white,
            ),
            title: const Text(
              'Note-taking',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to the note-taking screen or perform related action.
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => const NotesTakingScreen(),
                  builder: (context) => const NotesPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.analytics,
              color: Colors.white,
            ),
            title: const Text(
              'Analytics',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to the analytics screen or perform related action.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnalyticsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.timer,
              color: Colors.white,
            ),
            title: const Text(
              'Pomodoro Timer',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to the Pomodoro timer screen or perform related action.  if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PomodoroScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.star,
              color: Colors.white,
            ),
            title: const Text(
              'Habit Tracker',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to the habit tracker screen or perform related action.
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HabitTrackerScreen()),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to the settings screen or perform related action.
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
