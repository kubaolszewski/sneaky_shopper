import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/app/features/item_details/cubit/item_details_cubit.dart';
import 'package:sneaky_shopper/app/injection_container.dart';
import 'package:sneaky_shopper/models/item_model.dart';

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
      body: BlocProvider<ItemDetailsCubit>(
        create: (context)  => getIt()
          ..getItemWithID(id: id),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
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
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.success:
                    final itemDetailsModel = state.itemDetailsModel;

                    if (itemDetailsModel == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return _ProductWidgetDetails(
                      itemDetailsModel: itemDetailsModel,
                    );
                  case Status.error:
                    return Center(
                      child: Text(
                        state.errorMessage ?? 'Unknown error occured.',
                        style: GoogleFonts.teko(
                          fontSize: 32,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    );
                }
              },
            ),
          ],
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

  final ItemModel itemDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(itemDetailsModel.image),
                        radius: 100,
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
                  Text(
                    itemDetailsModel.itemType,
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
      ),
    );
  }
}
