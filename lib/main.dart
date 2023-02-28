import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sneaky_shopper/app/injection_container.dart';
import 'package:sneaky_shopper/app/welcome_page.dart';
import 'firebase_options.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.pink,
      ),
      home: const WelcomePage(),
    );
  }
}
