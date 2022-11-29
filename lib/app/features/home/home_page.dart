import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/features/home/add_product_page/add_product_page_content.dart';
import 'package:sneaky_shopper/app/features/home/list_page/list_page_content.dart';
import 'package:sneaky_shopper/app/features/home/my_account/my_account_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2D9A8D),
      appBar: AppBar(
        backgroundColor: const Color(0xff03675B),
        title: Text(
          'Sneaky Shopper',
          style: GoogleFonts.teko(color: Colors.white, fontSize: 36),
        ),
        leading: null,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const ListPageContent();
        }

        if (currentIndex == 1) {
          return AddProductPageContent(onSave: () {
            setState(() {
              currentIndex = 0;
            });
          });
        }

        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xff03675B),
          textTheme: Theme.of(context).textTheme.copyWith(),
        ),
        child: BottomNavigationBar(
          selectedLabelStyle: GoogleFonts.teko(fontSize: 16),
          unselectedLabelStyle: GoogleFonts.teko(fontSize: 16),
          selectedItemColor: const Color(0xffff40ac),
          unselectedItemColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.list, size: 28),
              label: 'Lista',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.shopping_cart_sharp, size: 28),
              label: 'Dodaj produkt',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.person, size: 28),
              label: 'Moje konto',
            ),
          ],
        ),
      ),
    );
  }
}