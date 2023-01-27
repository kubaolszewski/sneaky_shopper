import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/app/features/home/catalog_page/cubit/catalog_page_cubit.dart';
import 'package:sneaky_shopper/app/features/home/catalog_page/item_type_content/item_type_info.dart';
import 'package:sneaky_shopper/app/injection_container.dart';
import 'package:sneaky_shopper/models/item_info_model.dart';

class CatalogPage extends StatelessWidget {
  CatalogPage({
    Key? key,
  }) : super(key: key);

  final List<String> selectionButtons = ['Item types', 'Brands'];

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
                      'Items',
                      style: GoogleFonts.teko(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  // for (final selectedButton in selectionButtons)
                  //   Padding(
                  //       padding: const EdgeInsets.all(12.0),
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //             backgroundColor: const Color(0xffff97d0)),
                  //         onPressed: () {
                  //           // Navigator.of(context).push(MaterialPageRoute(builder: ((context) => SelectedItemTypeInfo))
                  //         },
                  //         child: Text(selectedButton,
                  //             style: GoogleFonts.teko(
                  //               color: Colors.white,
                  //               fontSize: 32,
                  //             )),
                  //       )),
                  for (final info in state.itemInfo)
                    ItemInfoSelection(model: info),
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

class ItemInfoSelection extends StatelessWidget {
  const ItemInfoSelection({
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
              builder: (context) => ItemTypeInfo(model: model),
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
                model.type,
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
