import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/features/home/add_product_page/cubit/add_product_page_cubit.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_dio_data_source.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

class AddProductPageContent extends StatelessWidget {
  const AddProductPageContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function onSave;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductPageCubit(ItemsRepository(
          ItemsRemoteFirestoreDataSource(), ItemsRemoteDioDataSource()))
        ..start(),
      child: BlocBuilder<AddProductPageCubit, AddProductPageState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff85c8c9),
                      hintText: 'Wpisz nazwę przedmiotu:',
                      hintStyle:
                          GoogleFonts.teko(color: Colors.white, fontSize: 24),
                    ),
                    // setting name of an item
                    onChanged: (nameValue) {
                      context
                          .read<AddProductPageCubit>()
                          .changeNameValue(nameValue);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff85c8c9),
                      hintText: 'Podaj cenę:',
                      hintStyle:
                          GoogleFonts.teko(color: Colors.white, fontSize: 24),
                    ),
                    // setting price of an item
                    onChanged: (priceValue) {
                      context
                          .read<AddProductPageCubit>()
                          .changePriceValue(priceValue);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff85c8c9),
                      hintText: 'Podaj rozmiar:',
                      hintStyle:
                          GoogleFonts.teko(color: Colors.white, fontSize: 24),
                    ),
                    // setting size of an item
                    onChanged: (sizeValue) {
                      context
                          .read<AddProductPageCubit>()
                          .changeSizeValue(sizeValue);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff85c8c9),
                      hintText: 'Podaj typ przedmiotu: ',
                      hintStyle:
                          GoogleFonts.teko(color: Colors.white, fontSize: 24),
                    ),
                    // setting type of an item
                    onChanged: (typeValue) {
                      context
                          .read<AddProductPageCubit>()
                          .setTypeValue(typeValue);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff85c8c9),
                      hintText: 'Prześlij grafikę',
                      hintStyle:
                          GoogleFonts.teko(color: Colors.white, fontSize: 24),
                    ),
                    // upload an image of item
                    onChanged: (imageInput) {
                      context
                          .read<AddProductPageCubit>()
                          .imageInput(imageInput);
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.black,
                        width: 0.5,
                      ),
                      disabledBackgroundColor: const Color(0xffff97d0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: const Color(0xffff40ac),
                    ),
                    onPressed: state.nameValue.isEmpty ||
                            state.priceValue.isEmpty ||
                            state.sizeValue.isEmpty ||
                            state.typeValue.isEmpty ||
                            state.image.isEmpty
                        ? null
                        :
                        // adding an item to the list
                        () {
                            context
                                .read<AddProductPageCubit>()
                                .addProductToList(
                                  state.nameValue,
                                  state.priceValue,
                                  state.sizeValue,
                                  state.typeValue,
                                  state.image,
                                );
                            onSave();
                          },
                    child: Text(
                      'Dodaj pozycję',
                      style:
                          GoogleFonts.teko(color: Colors.white, fontSize: 24),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
