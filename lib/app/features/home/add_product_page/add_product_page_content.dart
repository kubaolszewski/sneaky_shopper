import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/features/home/add_product_page/cubit/add_product_page_cubit.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_dio_data_source.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

class AddProductPageContent extends StatefulWidget {
  const AddProductPageContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function onSave;

  @override
  State<AddProductPageContent> createState() => _AddProductPageContentState();
}

class _AddProductPageContentState extends State<AddProductPageContent> {
  final List<bool> selections = List.generate(7, (_) => false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddProductPageCubit(ItemsRepository(ItemsRemoteFirestoreDataSource(),ItemsRemoteDioDataSource()))
            ..start(),
      child: BlocBuilder<AddProductPageCubit, AddProductPageState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ToggleButtons(
                      fillColor: const Color(0xffff40ac),
                      highlightColor: const Color(0xffff97d0),
                      disabledColor: const Color(0xffff97d0),
                      borderWidth: 3,
                      borderColor: const Color(0xffff40ac),
                      selectedBorderColor: const Color(0xffff40ac),
                      borderRadius: BorderRadius.circular(12),
                      isSelected: selections,
                      onPressed: (int index) {
                        setState(() {
                          selections[index] = !selections[index];
                        });
                      },
                      children: [
                        Text('Sneakers',
                            style: GoogleFonts.teko(
                                color: Colors.white, fontSize: 18)),
                        Text('T-shirt',
                            style: GoogleFonts.teko(
                                color: Colors.white, fontSize: 18)),
                        Text('Hoodie',
                            style: GoogleFonts.teko(
                                color: Colors.white, fontSize: 18)),
                        Text('Pants',
                            style: GoogleFonts.teko(
                                color: Colors.white, fontSize: 18)),
                        Text('Jacket',
                            style: GoogleFonts.teko(
                                color: Colors.white, fontSize: 18)),
                        Text('Cap',
                            style: GoogleFonts.teko(
                                color: Colors.white, fontSize: 18)),
                        Text('Suit',
                            style: GoogleFonts.teko(
                                color: Colors.white, fontSize: 18)),
                      ],
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff85c8c9),
                      hintText: 'Wpisz nazwę przedmiotu:',
                      hintStyle:
                          GoogleFonts.teko(color: Colors.white, fontSize: 24),
                    ),
                    // setting name of shoes
                    onChanged: (newNameValue) {
                      context
                          .read<AddProductPageCubit>()
                          .changeNameValue(newNameValue);
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
                    // setting price of shoes
                    onChanged: (newPriceValue) {
                      context
                          .read<AddProductPageCubit>()
                          .changePriceValue(newPriceValue);
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
                    // setting size of shoes
                    onChanged: (newSizeValue) {
                      context
                          .read<AddProductPageCubit>()
                          .changeSizeValue(newSizeValue);
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
                            state.sizeValue.isEmpty
                        //selections.isEmpty
                        ? null
                        :
                        // adding an item to the list
                        () {
                            context.read<AddProductPageCubit>().addProduct(
                                state.nameValue,
                                state.priceValue,
                                state.sizeValue, selections.toString());
                            widget.onSave();
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
