import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/features/home/add_product_page/cubit/add_product_page_cubit.dart';
import 'package:sneaky_shopper/app/injection_container.dart';

class AddProductPageContent extends StatelessWidget {
  const AddProductPageContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function onSave;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddProductPageCubit>(
      create: (context) => getIt(),
      child: BlocBuilder<AddProductPageCubit, AddProductPageState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ThemedTextField(
                    hintText: 'Enter item name:',
                    // setting name of a clothing
                    onChanged: (nameValue) {
                      context
                          .read<AddProductPageCubit>()
                          .changeNameValue(nameValue);
                    },
                  ),
                  const SizedBox(height: 10),
                  _ThemedTextField(
                    hintText: 'Enter item price:',
                    // setting price of a clothing
                    onChanged: (priceValue) {
                      context
                          .read<AddProductPageCubit>()
                          .changePriceValue(priceValue);
                    },
                  ),
                  const SizedBox(height: 10),
                  _ThemedTextField(
                    hintText: 'Enter item size: ',
                    // setting size of a clothing
                    onChanged: (sizeValue) {
                      context
                          .read<AddProductPageCubit>()
                          .changeSizeValue(sizeValue);
                    },
                  ),
                  const SizedBox(height: 10),
                  _ThemedTextField(
                    hintText: 'Enter item type: ',
                    // setting type of a clothing
                    onChanged: (typeValue) {
                      context
                          .read<AddProductPageCubit>()
                          .setTypeValue(typeValue);
                    },
                  ),
                  const SizedBox(height: 10),
                  _ThemedTextField(
                    hintText: 'Enter image URL:',
                    // upload an image of a clothing
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
                      'Add item to the list',
                      style:
                          GoogleFonts.teko(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ThemedTextField extends StatelessWidget {
  const _ThemedTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff85c8c9),
          hintText: hintText,
          hintStyle: GoogleFonts.teko(color: Colors.white, fontSize: 24),
        ),
        // setting properties of added clothing
        onChanged: (requiredValue) {
          onChanged(requiredValue);
        });
  }
}
