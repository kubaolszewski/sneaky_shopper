// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math';

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
              const SizedBox(height: 16),
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
            ],
          ),
        ),
      ),
    );
  }
}
