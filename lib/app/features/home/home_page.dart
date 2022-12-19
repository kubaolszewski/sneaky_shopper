import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/cubit/root_cubit.dart';
import 'package:sneaky_shopper/app/features/home/add_product_page/add_product_page_content.dart';
import 'package:sneaky_shopper/app/features/home/list_page/list_page_content.dart';
import 'package:sneaky_shopper/app/features/home/my_account/my_account_page_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
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
              if (state.pageIndex == 0) {
                return const ListPageContent();
              }

              if (state.pageIndex == 1) {
                return AddProductPageContent(
                  onSave: () {
                    context.read<RootCubit>().changeOnSave(0);
                  },
                );
              }

              return MyAccountPageContent(email: user.email);
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
                currentIndex: state.pageIndex,
                onTap: (newPageIndex) {
                  context.read<RootCubit>().changeIndex(newPageIndex);
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
        },
      ),
    );
  }
}
