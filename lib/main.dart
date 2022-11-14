// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math';

void main() async {
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/startowy.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              const Image(
                image: AssetImage('images/logo.png'),
              ),
              Text(
                'Sneaky Shopper',
                style: GoogleFonts.teko(
                  color: const Color(0xffBBFFF7),
                  fontSize: 48,
                ),
              ),
              const SizedBox(height: 440),
              Text(
                'Wszystkie buty w jednym miejscu',
                style: GoogleFonts.teko(
                  color: const Color(0xffBBFFF7),
                  fontSize: 24,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  fixedSize: const Size(224, 48),
                  backgroundColor: const Color(0xff11DDC4),
                ),
                child: Text(
                  "Zaczynamy",
                  style: GoogleFonts.teko(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sneaky Shopper',
          style: GoogleFonts.teko(fontSize: 36),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff03675B),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        shadowColor: Colors.black,
        elevation: 16,
      ),
      backgroundColor: const Color(0xff2D9A8D),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('images/logo.png'),
                width: 144,
              ),
              Text(
                'Sneaky Shopper',
                style: GoogleFonts.teko(
                  color: const Color(0xffBBFFF7),
                  fontSize: 48,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    hintText: 'Email',
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.black,
                    ),
                    hintText: 'Hasło',
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const RegisterPage(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                child: Text(
                  "Nie masz konta? Zarejestuj się",
                  style: GoogleFonts.teko(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  fixedSize: const Size(144, 48),
                  backgroundColor: const Color(0xff11DDC4),
                ),
                onPressed: () {},
                child: Text(
                  "Login",
                  style: GoogleFonts.teko(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                child: Text(
                  "Napotkałeś problem? Napisz do nas",
                  style: GoogleFonts.teko(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sneaky Shopper',
          style: GoogleFonts.teko(fontSize: 36),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff03675B),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        shadowColor: Colors.black,
        elevation: 16,
      ),
      backgroundColor: const Color(0xff2D9A8D),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('images/logo.png'),
                width: 144,
              ),
              Text(
                'Sneaky Shopper',
                style: GoogleFonts.teko(
                  color: const Color(0xffBBFFF7),
                  fontSize: 48,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    hintText: 'Email',
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.black,
                    ),
                    hintText: 'Hasło',
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    prefixIcon: Icon(
                      Icons.check_circle,
                      color: Colors.black,
                    ),
                    hintText: 'Powtórz hasło',
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  fixedSize: const Size(208, 48),
                  backgroundColor: const Color(0xff11DDC4),
                ),
                onPressed: () {},
                child: Text(
                  "Zarejestruj się",
                  style: GoogleFonts.teko(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
