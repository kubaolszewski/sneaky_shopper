import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/home/add_product_page/add_product_page_content.dart';
import 'package:sneaky_shopper/app/home/list_page/list_page_content.dart';
import 'package:sneaky_shopper/app/home/my_account/my_account_page_content.dart';

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
          style: GoogleFonts.teko(
            color: const Color(0xffBBFFF7),
            fontSize: 36,
          ),
        ),
        centerTitle: true,
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const ListPageContent();
        }

        if (currentIndex == 1) {
          return const AddProductPageContent();
        }

        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff03675B),
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'Dodaj',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.person),
            label: 'Moje konto',
          ),
        ],
      ),
    );
  }
}
