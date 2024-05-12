import 'package:flutter/material.dart';
import 'package:flutter_dnd/flutter_dnd.dart';

import '../../../widgets/inside_shadow_container.dart';
import '../../../widgets/my_body_text.dart';
import '../../../widgets/my_button.dart';
import '../widgets/text_container.dart';
import 'all_focus_modes_features_screen.dart';

class AllowFocusModeScreen extends StatefulWidget {
  const AllowFocusModeScreen({super.key});

  @override
  State<AllowFocusModeScreen> createState() => _AllowFocusScreenState();
}

class _AllowFocusScreenState extends State<AllowFocusModeScreen>
    with WidgetsBindingObserver {
  bool? _isNotificationPolicyAccessGranted = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      updateUI();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateUI();
  }

  void updateUI() async {
    int? filter = await FlutterDnd.getCurrentInterruptionFilter();
    if (filter != null) {
      bool? isNotificationPolicyAccessGranted =
          await FlutterDnd.isNotificationPolicyAccessGranted;

      setState(() {
        _isNotificationPolicyAccessGranted = isNotificationPolicyAccessGranted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          "Allow Focus Mode",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BackButtonWidget(onTap: () {
            //   Navigator.pop(context);
            // }),
            const SizedBox(height: 10),
            const InsideShadowContainer(
              child: TextContainer(
                boldText: "Focus Mode",
                text2: "Unlock Productivity!",
              ),
            ),
            MyBodyText(
                text:
                    'AccessGranted: ${_isNotificationPolicyAccessGranted! ? 'YES' : 'NO'}'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: const Image(
                  height: 250,
                  image: AssetImage("assets/images/focus2.png"),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              buttonText: "Allow Access",
              buttonColor: Colors.black,
              onTap: () async {
                bool? isNotificationPolicyAccessGranted =
                    await FlutterDnd.isNotificationPolicyAccessGranted;
                if (isNotificationPolicyAccessGranted!) {
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AllFocusModesFeaturesScreen()),
                    );
                  }
                } else {
                  FlutterDnd.gotoPolicySettings();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
