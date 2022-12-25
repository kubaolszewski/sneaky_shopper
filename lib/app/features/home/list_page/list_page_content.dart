import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/features/home/list_page/cubit/list_page_cubit.dart';
import 'package:sneaky_shopper/app/features/item_details/item_details_page.dart';
import 'package:sneaky_shopper/models/item_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

class ListPageContent extends StatelessWidget {
  const ListPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListPageCubit(ItemsRepository())..start(),
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

          if (state.items.isEmpty) {
            return Center(
              child: Text(
                'Coś tutaj pusto :/',
                style: GoogleFonts.teko(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            );
          }

          final itemModels = state.items;

          return ListView(
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Twoja lista:',
                    style: GoogleFonts.teko(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              for (final itemModel in itemModels) ...[
                Dismissible(
                  key: ValueKey(itemModel.id),
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
                        .removeProduct(id: itemModel.id);
                  },
                  child: _ProductWidget(itemModel: itemModel),
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
  const _ProductWidget({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => ItemDetailsPage(id: itemModel.id)),
        );
      },
      child: Padding(
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
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: const Image(
                        image: AssetImage('images/przyklad.jpg'),
                        width: 90,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      itemModel.name,
                      style: GoogleFonts.teko(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Cena: ${itemModel.price} -,',
                      style: GoogleFonts.teko(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Rozmiar: ${itemModel.size}',
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
      ),
    );
  }
}
