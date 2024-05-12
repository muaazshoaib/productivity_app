import 'package:flutter/material.dart';
import 'package:fyp/app/modules/notes_taking/pages/image_page.dart';
import 'package:fyp/app/modules/notes_taking/pages/notes_page.dart';

class NoteTakingNavBarPage extends StatefulWidget {
  const NoteTakingNavBarPage({super.key});

  @override
  State<NoteTakingNavBarPage> createState() => _NoteTakingNavBarPageState();
}

class _NoteTakingNavBarPageState extends State<NoteTakingNavBarPage> {
  int tabIndex = 0;

  final pages = [
    const ImagePage(),
    const NotesPage(),
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
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.camera_alt_outlined),
            selectedIcon: Icon(Icons.camera_alt_rounded),
            label: 'Images Notes',
          ),
          NavigationDestination(
            icon: Icon(Icons.note_add_outlined),
            selectedIcon: Icon(Icons.note_add_rounded),
            label: 'Text Notes',
          ),
        ],
      ),
      // floatingActionButton: tabIndex == 1
      //     ? FloatingActionButton(
      //         onPressed: _getImage,
      //         tooltip: 'Take Picture',
      //         child: const Icon(Icons.camera_alt),
      //       )
      //     : null,
    );
  }
}
