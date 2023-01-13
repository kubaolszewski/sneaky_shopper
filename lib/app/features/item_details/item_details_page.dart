import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/features/item_details/cubit/item_details_cubit.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_dio_data_source.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart';
import 'package:sneaky_shopper/models/item_details_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({
    required this.id,
    // required this.itemType,
    Key? key,
  }) : super(key: key);

  final String id;
  // final String itemType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03675B),
        centerTitle: true,
        title: Text(
          'Sneaky Shopper',
          style: GoogleFonts.teko(
            color: Colors.white,
            fontSize: 36,
          ),
        ),
      ),
      backgroundColor: const Color(0xff2D9A8D),
      body: BlocProvider(
        create: (context) =>
            ItemDetailsCubit(ItemsRepository(ItemsRemoteFirestoreDataSource(),ItemsRemoteDioDataSource()))
              ..getItemWithID(id: id),
        child: BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
          builder: (context, state) {
            final itemDetailsModel = state.itemDetailsModel;

            if (itemDetailsModel == null) {
              return const Center(child: CircularProgressIndicator());
            }
            // switch (state.status) {
            //   case value:

            //     break;
            //   case value:

            //     break;
            //   case value:

            //     break;
            //   case value:

            //     break;
            //   default:
            // }
            return _ProductWidgetDetails(itemDetailsModel: itemDetailsModel);
          },
        ),
      ),
    );
  }
}

class _ProductWidgetDetails extends StatelessWidget {
  const _ProductWidgetDetails({
    Key? key,
    required this.itemDetailsModel,
  }) : super(key: key);

  final ItemDetailsModel itemDetailsModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image(
                      image: NetworkImage(itemDetailsModel.image),
                      width: 320,
                      height: 320,
                    ),
                  ),
                ),
                Text(
                  itemDetailsModel.name,
                  style: GoogleFonts.teko(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Cena: ${itemDetailsModel.price} -,',
                  style: GoogleFonts.teko(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Rozmiar: ${itemDetailsModel.size}',
                  style: GoogleFonts.teko(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff85c8c9),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                        style: GoogleFonts.teko(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
