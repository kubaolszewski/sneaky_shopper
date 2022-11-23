import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProductPageContent extends StatefulWidget {
  const AddProductPageContent({
    required this.onSave,
    Key? key,
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
                      GoogleFonts.teko(color: Colors.black, fontSize: 24)),
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
                      GoogleFonts.teko(color: Colors.black, fontSize: 24)),
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
                      GoogleFonts.teko(color: Colors.black, fontSize: 24)),
              onChanged: (newValue) {
                setState(() {
                  size = newValue;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: const Color(0xff11DDC4)),
                onPressed: name.isEmpty || price.isEmpty || size.isEmpty
                    ? null
                    : () {
                        FirebaseFirestore.instance.collection('shoes').add({
                          'name': name,
                          'price': price,
                          'size': size,
                        });
                        widget.onSave();
                      },
                child: Text('Dodaj pozycję',
                    style: GoogleFonts.teko(color: Colors.white, fontSize: 24)))
          ],
        ),
      ),
    );
  }
}
