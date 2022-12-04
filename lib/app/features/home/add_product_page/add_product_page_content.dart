import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/features/home/add_product_page/cubit/add_product_page_cubit.dart';

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
  var name = '';
  var price = '';
  var size = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductPageCubit(),
      child: Builder(builder: (context) {
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
                  onChanged: (newValue) {
                    setState(() {
                      name = newValue;
                    });
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
                  onChanged: (newValue) {
                    setState(() {
                      price = newValue;
                    });
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
                  onChanged: (newValue) {
                    setState(() {
                      size = newValue;
                    });
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
                  onPressed: name.isEmpty || price.isEmpty || size.isEmpty
                      ? null
                      :
                      // dodanie pozycji do listy
                      () {
                          context
                              .read<AddProductPageCubit>()
                              .addProduct(name, price, size);
                          widget.onSave();
                        },
                  child: Text(
                    'Dodaj pozycję',
                    style: GoogleFonts.teko(color: Colors.white, fontSize: 24),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
