// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math';
import 'package:sneaky_shopper/app/register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
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
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
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
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);
                  } catch (error) {
                    print(error);
                  }

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
            ],
          ),
        ),
      ),
    );
  }
}
