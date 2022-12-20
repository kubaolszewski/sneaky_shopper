import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/features/home/list_page/cubit/list_page_cubit.dart';

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
                  background: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffff40ac),
                      ),
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 32),
                          child: Icon(Icons.delete),
                        ),
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    return direction == DismissDirection.endToStart;
                  },
                  onDismissed: (_) {
                    context
                        .read<ListPageCubit>()
                        .removeProduct(id: document.id);
                  },
                  child: _ProductWidget(document: document),
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

class _ProductWidget extends StatelessWidget {
  const _ProductWidget({Key? key, required this.document}) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> document;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff85c8c9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Image(
                    image: AssetImage('images/przyklad.jpg'),
                    width: 90,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    document['name'],
                    style: GoogleFonts.teko(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Cena: ${document['price'].toString()} -,',
                    style: GoogleFonts.teko(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Rozmiar: ${document['size'].toString()}',
                    style: GoogleFonts.teko(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
