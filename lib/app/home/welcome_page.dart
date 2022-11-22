import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sneaky_shopper/app/home/my_account/my_account_page_content.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
              const SizedBox(height: 10),
              Builder(builder: (context) {
                return ElevatedButton(
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            MyAccountPageContent(email: widget.user.email)));
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
