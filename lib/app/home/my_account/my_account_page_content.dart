import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 48,
            backgroundImage: AssetImage('images/gng.png'),
          ),
          const SizedBox(height: 10),
          Text(
            'Jesteś zalogowany jako $email',
            style: GoogleFonts.teko(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                backgroundColor: const Color(0xff11DDC4)),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text(
              'Wyloguj się',
              style: GoogleFonts.teko(
                color: Colors.black,
                fontSize: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
