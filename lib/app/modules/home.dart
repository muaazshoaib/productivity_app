import 'package:fyp/app/modules/tasks/view/all_tasks.dart';
// import 'package:fyp/app/modules/settings/view/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fyp/app/modules/tasks/widgets/tasks_action.dart';
import 'package:fyp/app/modules/todos/view/calendar_todos.dart';
import 'package:fyp/app/modules/todos/view/all_todos.dart';
import 'package:fyp/app/modules/todos/widgets/todos_action.dart';
import 'package:fyp/theme/theme_controller.dart';

import 'ai_chatbot/screens/ai_chatbot_screen.dart';
import 'main_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final themeController = Get.put(ThemeController());
  int tabIndex = 0;

  final pages = const [
    AllTasks(),
    AllTodos(),
    CalendarTodos(),
    // SettingsPage(),
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
      backgroundColor: Colors.grey[300],
      body: IndexedStack(
        index: tabIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        onDestinationSelected: (int index) => changeTabIndex(index),
        selectedIndex: tabIndex,
        destinations: [
          NavigationDestination(
            icon: const Icon(Iconsax.folder_2),
            selectedIcon: const Icon(Iconsax.folder_25),
            label: 'categories'.tr,
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.task_square),
            selectedIcon: const Icon(Iconsax.task_square5),
            label: 'allTodos'.tr,
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.calendar_1),
            selectedIcon: const Icon(Iconsax.calendar5),
            label: 'calendar'.tr,
          ),
          // NavigationDestination(
          //   icon: const Icon(Iconsax.category),
          //   selectedIcon: const Icon(Iconsax.category5),
          //   label: 'settings'.tr,
          // ),
          const NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            selectedIcon: Icon(
              Icons.chat,
              // color: Colors.black,
            ),
            label: 'AI ChatBot',
          ),
        ],
      ),
      floatingActionButton: tabIndex == 3
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              onPressed: () {
                showModalBottomSheet(
                  enableDrag: false,
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return tabIndex == 0
                        ? TasksAction(
                            text: 'create'.tr,
                            edit: false,
                          )
                        : TodosAction(
                            text: 'create'.tr,
                            edit: false,
                            category: true,
                          );
                  },
                );
              },
              child: const Icon(Iconsax.add),
            ),
      drawer: const MainDrawer(),
    );
  }
}
