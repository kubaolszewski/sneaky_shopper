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
          // const SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Column(
          //       children: [
          //         IconButton(
          //           onPressed: () {},
          //           icon: const Icon(Icons.settings, color: Colors.white),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         IconButton(
          //           onPressed: () {},
          //           icon: const Icon(Icons.privacy_tip, color: Colors.white),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         IconButton(
          //           onPressed: () {},
          //           icon: const Icon(Iconsax.medal5, color: Colors.white),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              backgroundColor: const Color(0xffff40ac),
              side: const BorderSide(
                color: Colors.black,
                width: 0.5,
              ),
            ),
            onPressed: () {
              context.read<RootCubit>().signOut();
            },
            child: Text(
              'Logout',
              style: GoogleFonts.teko(color: Colors.white, fontSize: 32),
            ),
          ),
        ],
      ),
    );
  }
}
