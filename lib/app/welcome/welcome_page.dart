// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:sneaky_shopper/app/login/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math';

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
