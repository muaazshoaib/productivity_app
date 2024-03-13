import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/app/modules/home.dart';
import 'package:productivity_app/firebase_options.dart';
import 'package:productivity_app/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProductivityApp());
}

class ProductivityApp extends StatelessWidget {
  const ProductivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productivity App',
      theme: AppTheme.lightTheme,
      // home: const AuthenticationPage(),
      home: const HomePage(),
    );
  }
}
