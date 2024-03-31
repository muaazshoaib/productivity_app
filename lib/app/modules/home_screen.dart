// import 'package:flutter/material.dart';
// import 'package:flutter_dnd/flutter_dnd.dart';

// import '../utils/colors.dart';
// import '../utils/utils.dart';
// import '../widgets/hello_user.dart';
// import '../widgets/home_screen_icon_background.dart';
// import '../widgets/my_heading.dart';
// import 'analytics/screens/analytics.dart';
// import 'focus_mode/screens/all_focus_modes_features_screen.dart';
// import 'focus_mode/screens/allow_focus_mode_screen.dart';
// import 'habit_tracker/screens/habit_tracker_screen.dart';
// import 'integrating_others/screens/others_screen.dart';
// import 'notes_taking/screens/notes_taking_screen.dart';
// import 'pomodoro_timer/screens/pomodoro_screen.dart';
// import 'settings/screens/settings_screen.dart';
// import 'task_manager/screens/task_manager_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   static const String routeName = '/home-screen';

//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = Utils().getScreenSize();
//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: screenSize.height * 0.08),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 18.0),
//             child: MyHeading(text: 'Productivity'),
//           ),
//           SizedBox(height: screenSize.height * 0.03),
//           const HelloUser(
//             name: "MUAAZ",
//             assetImagePath: "assets/images/muaaz.png",
//           ),
//           SizedBox(height: screenSize.height * 0.03),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               // 01. Focus Mode
//               MyHomeScreenIcon(
//                 onTap: () async {
//                   bool? isNotificationPolicyAccessGranted =
//                       await FlutterDnd.isNotificationPolicyAccessGranted;

//                   if (isNotificationPolicyAccessGranted!) {
//                     if (context.mounted) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 const AllFocusModesFeaturesScreen()),
//                       );
//                     }
//                   } else {
//                     if (context.mounted) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const AllowFocusModeScreen()),
//                       );
//                     }
//                   }
//                 },
//                 imagePath: "assets/icons/focus_icon.png",
//                 text: "Focus Mode",
//               ),

//               // 02. Task Manager
//               MyHomeScreenIcon(
//                 onTap: () {
//                   if (context.mounted) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const TaskManagerScreen()),
//                     );
//                   }
//                 },
//                 imagePath: "assets/icons/task_icon.png",
//                 text: "Tasks",
//               ),

//               // 03. Pomodoro Timer
//               MyHomeScreenIcon(
//                 onTap: () {
//                   if (context.mounted) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const PomodoroScreen(),
//                       ),
//                     );
//                   }
//                 },
//                 imagePath: "assets/icons/timer_icon.png",
//                 text: "Pomodoro",
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               // 04. Habit Tracker
//               MyHomeScreenIcon(
//                 onTap: () {
//                   if (context.mounted) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const HabitTrackerScreen()),
//                     );
//                   }
//                 },
//                 imagePath: "assets/icons/habit_icon.png",
//                 text: "Habit Tracker",
//               ),

//               // 05. Calender
//               MyHomeScreenIcon(
//                 onTap: () {
//                   // if (context.mounted) {
//                   //   Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => const CalendarTodos()),
//                   //   );
//                   // }
//                 },
//                 imagePath: "assets/icons/calendar_icon.png",
//                 text: "Calendar",
//               ),

//               // 06. Analytics
//               MyHomeScreenIcon(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const AnalyticsScreen()));
//                 },
//                 imagePath: "assets/icons/analytics_icon.png",
//                 text: "Analytics",
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               // 07. Note Taking
//               MyHomeScreenIcon(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const NotesTakingScreen()));
//                 },
//                 imagePath: "assets/icons/notes_icon.png",
//                 text: "Notes",
//               ),

//               // 08. Other Productivity Apps
//               MyHomeScreenIcon(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const IntegratingOthers()));
//                 },
//                 imagePath: "assets/icons/others_icon.png",
//                 text: "Others",
//               ),

//               // 09. Settings
//               MyHomeScreenIcon(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => const SettingsScreen(),
//                     ),
//                   );
//                 },
//                 imagePath: "assets/icons/settings_icon.png",
//                 text: "Settings",
//               ),
//             ],
//           ),
//           SizedBox(height: screenSize.height * 0.06),
//         ],
//       ),
//     );
//   }
// }

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
import 'integrating_others/screens/others_screen.dart';
import 'notes_taking/screens/notes_taking_screen.dart';
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
    // AllTasksScreen(),
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
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: const Text('Productivity App'),
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.menu,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (context) => const _MainDrawer(),
      //         ),
      //       );
      //     },
      //   ),
      // ),
      body: IndexedStack(
        index: tabIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) => changeTabIndex(index),
        selectedIndex: tabIndex,
        destinations: const [
          // NavigationDestination(
          //   icon: Icon(Icons.home),
          //   selectedIcon: Icon(
          //     Icons.home,
          //     color: Colors.black,
          //   ),
          //   label: 'Home',
          // ),
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

// class _BottomNavBar extends StatelessWidget {
//   const _BottomNavBar({
//     required this.index,
//   });

//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: index,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       selectedItemColor: Colors.black,
//       unselectedItemColor: Colors.black.withAlpha(100),
//       items: [
//         BottomNavigationBarItem(
//           icon: Container(
//             margin: const EdgeInsets.only(left: 30),
//             child: IconButton(
//               icon: const Icon(Icons.home),
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const TaskManagerScreen(),
//                   ),
//                 );
//               },
//             ),
//           ),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: IconButton(
//             icon: const Icon(Icons.list),
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => const CardTodoListWidget(
//                     getIndex: 0,
//                   ),
//                 ),
//               );
//             },
//           ),
//           label: 'Tasks',
//         ),
//         BottomNavigationBarItem(
//           icon: IconButton(
//             icon: const Icon(Icons.calendar_today),
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => const CalendarScreen(),
//                 ),
//               );
//             },
//           ),
//           label: 'Calendar',
//         ),
//         BottomNavigationBarItem(
//           icon: Container(
//             margin: const EdgeInsets.only(right: 30),
//             child: IconButton(
//               icon: const Icon(Icons.chat),
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const ChatGPTScreen(),
//                   ),
//                 );
//               },
//             ),
//           ),
//           label: 'ChatGPT',
//         ),
//       ],
//     );
//   }
// }

class _MainDrawer extends StatelessWidget {
  const _MainDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // child: Text('Drawer Header'),
            child: ListTile(
              leading: Icon(Icons.playlist_add_check, size: 48.0),
              // leading: Icon(Icons.access_time, size: 48.0),
              title: Text('Productivity App'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.remove_red_eye),
            title: const Text('Focus Mode'),
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
            leading: const Icon(Icons.build),
            title: const Text('Productivity Tools'),
            onTap: () {
              // Navigate to the productivity tools screen or perform related action.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IntegratingOthers(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_add),
            title: const Text('Note-taking'),
            onTap: () {
              // Navigate to the note-taking screen or perform related action.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotesTakingScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Analytics'),
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
            leading: const Icon(Icons.timer),
            title: const Text('Pomodoro Timer'),
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
            leading: const Icon(Icons.star),
            title: const Text('Habit Tracker'),
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
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
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
