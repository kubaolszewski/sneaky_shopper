import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/cubit/root_cubit.dart';
import 'package:sneaky_shopper/app/features/home/add_product_page/add_product_page_content.dart';
import 'package:sneaky_shopper/app/features/home/list_page/list_page_content.dart';
import 'package:sneaky_shopper/app/features/home/my_account/my_account_page_content.dart';
import 'package:sneaky_shopper/app/features/home/search_page/cubit/search_page_cubit.dart';
import 'package:sneaky_shopper/app/features/home/search_page/search_page.dart';
import 'package:sneaky_shopper/app/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootCubit>(
      create: (context) => getIt(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xff2D9A8D),
            appBar: AppBar(
              actions: [
                BlocProvider(
                  create: (context) => SearchPageCubit(),
                  child: IconButton(
                    onPressed: () async {
                      await showSearch(
                          context: context,
                          delegate:
                              SearchPage(searchPageCubit: SearchPageCubit()));
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
              elevation: 8.0,
              backgroundColor: const Color(0xff03675B),
              title: Text(
                'Sneaky Shopper',
                style: GoogleFonts.teko(color: Colors.white, fontSize: 36),
              ),
              leading: null,
              automaticallyImplyLeading: false,
              centerTitle: true,
            ),
            body: Builder(
              builder: (context) {
                if (state.pageIndex == 0) {
                  return const ListPageContent();
                }

                if (state.pageIndex == 1) {
                  return AddProductPageContent(
                    onSave: () {
                      //change app page when an item is added to the list
                      context.read<RootCubit>().changeIndexOnSave(0);
                    },
                  );
                }

                return MyAccountPageContent(email: user.email);
              },
            ),
            bottomNavigationBar: _CustomNavBar(pageIndex: state.pageIndex),
          );
        },
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xff03675B),
      selectedLabelStyle: GoogleFonts.teko(fontSize: 16),
      unselectedLabelStyle: GoogleFonts.teko(fontSize: 16),
      selectedItemColor: const Color(0xffff40ac),
      unselectedItemColor: Colors.white,
      iconSize: 28,
      currentIndex: pageIndex,
      onTap: (newPageIndex) {
        // function that controls indexes for BottomNavigationBar
        context.read<RootCubit>().changeIndexOnSave(newPageIndex);
      },
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Color(0xff03675B),
          icon: Icon(Icons.list),
          label: 'List',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0xff03675B),
          icon: Icon(Icons.shopping_cart_sharp),
          label: 'Add item',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0xff03675B),
          icon: Icon(Icons.person),
          label: 'My account',
        ),
      ],
    );
  }
}
