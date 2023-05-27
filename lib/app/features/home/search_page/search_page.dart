import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/app/features/home/search_page/cubit/search_page_cubit.dart';

class SearchPage extends SearchDelegate<String> {
  final SearchPageCubit searchPageCubit;

  SearchPage({required this.searchPageCubit});

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      hintColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Color(0xff03675B),
      ),
    );
  }

  @override
  TextStyle get searchFieldStyle => TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontFamily: GoogleFonts.teko().fontFamily,
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // searchPageCubit.searchComicByTitle(title: query);

    return Container(
      color: const Color(0xff2D9A8D),
      child: BlocBuilder<SearchPageCubit, SearchPageState>(
        bloc: searchPageCubit,
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.status == Status.success) {
            // final List<SingleComicModel> comics = state.comics;

            // if (comics.isEmpty) {
            //   return const Center(
            //     child: Text('No results were found.'),
            //   );
            // }

            // return ListView.builder(
            //   itemCount: comics.length,
            //   itemBuilder: (context, index) {
            //     final comic = comics[index];
            //     return ComicWidget(comic: comic);
            //   },
            // );
          }

          if (state.status == Status.error) {
            return const Center(
              child: Text(''),
            );
          }

          return Container();
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: const Color(0xff2D9A8D),
    );
  }
}
