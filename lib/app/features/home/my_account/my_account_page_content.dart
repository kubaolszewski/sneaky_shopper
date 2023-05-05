import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax/iconsax.dart';
import 'package:sneaky_shopper/app/cubit/root_cubit.dart';

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
            'You\'re logged in as: $email',
            style: GoogleFonts.teko(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 10),
          ActionChip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            side: const BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
            elevation: 8.0,
            backgroundColor: const Color(0xffff40ac),
            label: Text(
              'Log out',
              style: GoogleFonts.teko(color: Colors.white, fontSize: 32),
            ),
            onPressed: () {
              context.read<RootCubit>().signOut();
            },
          ),
        ],
      ),
    );
  }
}
