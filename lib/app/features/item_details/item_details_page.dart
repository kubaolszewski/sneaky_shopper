import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/features/item_details/cubit/item_details_cubit.dart';
import 'package:sneaky_shopper/models/item_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  final String id;

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
            ItemDetailsCubit(ItemsRepository())..getItemWithID(id: id),
        child: BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
          builder: (context, state) {
            final itemModel = state.itemModel;

            if (itemModel == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return _ProductWidgetDetails(itemModel: itemModel);
          },
        ),
      ),
    );
  }
}

class _ProductWidgetDetails extends StatelessWidget {
  const _ProductWidgetDetails({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

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
                    borderRadius: BorderRadius.circular(12),
                    child: const Image(
                      image: AssetImage('images/przyklad.jpg'),
                      width: 250,
                    ),
                  ),
                ),
                Text(
                  itemModel.name,
                  style: GoogleFonts.teko(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Cena: ${itemModel.price} -,',
                  style: GoogleFonts.teko(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Rozmiar: ${itemModel.size}',
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
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    backgroundColor: const Color(0xffff40ac),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Wróc do listy',
                    style: GoogleFonts.teko(
                      color: Colors.white,
                      fontSize: 24,
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
