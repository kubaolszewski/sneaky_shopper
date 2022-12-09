import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/features/home/list_page/cubit/list_page_cubit.dart';
import 'package:sneaky_shopper/app/features/home/list_page/productWidget.dart';

class ListPageContent extends StatelessWidget {
  const ListPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListPageCubit()..start(),
      child: BlocBuilder<ListPageCubit, ListPageState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Something went wrong: ${state.errorMessage}',
                style: GoogleFonts.teko(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            );
          }
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = state.documents;

          return ListView(
            children: [
              for (final document in documents) ...[
                Dismissible(
                  key: ValueKey(document.id),
                  onDismissed: (_) {
                    context.read<ListPageCubit>().removeProduct(document.id);
                  },
                  child: productWidget(document),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  height: null,
                  indent: 60,
                  endIndent: 60,
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
