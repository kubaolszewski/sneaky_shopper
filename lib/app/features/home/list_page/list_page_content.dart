import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/app/features/home/list_page/cubit/list_page_cubit.dart';
import 'package:sneaky_shopper/app/features/item_details/item_details_page.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_dio_data_source.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart';
import 'package:sneaky_shopper/models/item_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

class ListPageContent extends StatelessWidget {
  const ListPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListPageCubit(ItemsRepository(
          ItemsRemoteFirestoreDataSource(), ItemsRemoteDioDataSource()))
        ..start(),
      child: BlocBuilder<ListPageCubit, ListPageState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return Center(
                child: Text(
                  'Initial state',
                  style: GoogleFonts.teko(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              );
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.success:
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
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
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
                        padding: const EdgeInsets.only(
                            top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
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
                      child: _ItemWidget(itemModel: itemModel),
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
            case Status.error:
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
        },
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
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
            builder: (context) => ItemDetailsPage(
              id: itemModel.id,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xff85c8c9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/przyklad.jpg'),
                  radius: 40,
                ),
              ),
              Column(
                children: [
                  Text(
                    itemModel.name,
                    style: GoogleFonts.teko(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    itemModel.itemType,
                    style: GoogleFonts.teko(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_right_outlined,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
