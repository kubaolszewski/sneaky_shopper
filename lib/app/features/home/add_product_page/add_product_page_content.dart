// ignore_for_file: override_on_non_overriding_member, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/features/home/add_product_page/cubit/add_product_page_cubit.dart';

class AddProductPageContent extends StatelessWidget {
  const AddProductPageContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  final Function onSave;
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductPageCubit(),
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
                      hintText: 'Wpisz nazwę modelu:',
                      hintStyle:
                          GoogleFonts.teko(color: Colors.white, fontSize: 24),
                    ),
                    // podmiana wartosci nazwy buta
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
                    // podmiana wartosci ceny buta
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
                    // podmiana wartosci rozmiaru buta
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
                        ? null
                        :
                        // dodanie pozycji do listy
                        () {
                            context.read<AddProductPageCubit>().addProduct(
                                state.nameValue,
                                state.priceValue,
                                state.sizeValue);
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
