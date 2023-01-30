import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/app/features/home/catalog_page/cubit/catalog_page_cubit.dart';
import 'package:sneaky_shopper/app/features/home/catalog_page/browsing_pages/item_type_info_content.dart';
import 'package:sneaky_shopper/app/injection_container.dart';
import 'package:sneaky_shopper/models/item_info_model.dart';

class ItemType extends StatelessWidget {
  const ItemType({
    Key? key,
  }) : super(key: key);

  // final List<String> selectionButtons = ['Item types', 'Brands'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatalogPageCubit>(
      create: (context) => getIt()..start(),
      child: BlocBuilder<CatalogPageCubit, CatalogPageState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return Center(
                child: Text(
                  'Initial state.',
                  style: GoogleFonts.teko(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              );
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.success:
              return ListView(
                children: [
                  Center(
                    child: Text(
                      'Item types',
                      style: GoogleFonts.teko(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         backgroundColor: const Color(0xffff97d0)),
                  //     onPressed: () {},
                  //     child: Text(
                  //       'Item types',
                  //       style: GoogleFonts.teko(
                  //         color: Colors.white,
                  //         fontSize: 32,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  for (final info in state.itemInfo)
                    _ItemTypeSelection(model: info),
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

class _ItemTypeSelection extends StatelessWidget {
  const _ItemTypeSelection({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ItemInfoModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ItemTypeInfoContent(model: model),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xff85c8c9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(model.image),
                  radius: 60,
                ),
              ),
              Text(
                model.itemType,
                style: GoogleFonts.teko(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.arrow_right,
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
