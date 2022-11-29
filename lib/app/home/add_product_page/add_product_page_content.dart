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
<<<<<<< HEAD
                  filled: true,
                  fillColor: const Color(0xff85c8c9),
                  hintText: 'Wpisz nazwę modelu:',
                  hintStyle:
                      GoogleFonts.teko(color: Colors.white, fontSize: 24)),
=======
                filled: true,
                fillColor: const Color(0xff85c8c9),
                hintText: 'Wpisz nazwę modelu:',
                hintStyle: GoogleFonts.teko(color: Colors.white, fontSize: 24),
              ),
>>>>>>> 37918dd7a9f61cfe850a80d2e1ee7d7a586eb710
              onChanged: (newValue) {
                setState(() {
                  name = newValue;
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
<<<<<<< HEAD
                  filled: true,
                  fillColor: const Color(0xff85c8c9),
                  hintText: 'Podaj cenę:',
                  hintStyle:
                      GoogleFonts.teko(color: Colors.white, fontSize: 24)),
=======
                filled: true,
                fillColor: const Color(0xff85c8c9),
                hintText: 'Podaj cenę:',
                hintStyle: GoogleFonts.teko(color: Colors.white, fontSize: 24),
              ),
>>>>>>> 37918dd7a9f61cfe850a80d2e1ee7d7a586eb710
              onChanged: (newValue) {
                setState(() {
                  price = newValue;
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
<<<<<<< HEAD
                  filled: true,
                  fillColor: const Color(0xff85c8c9),
                  hintText: 'Podaj rozmiar:',
                  hintStyle:
                      GoogleFonts.teko(color: Colors.white, fontSize: 24)),
=======
                filled: true,
                fillColor: const Color(0xff85c8c9),
                hintText: 'Podaj rozmiar:',
                hintStyle: GoogleFonts.teko(color: Colors.white, fontSize: 24),
              ),
>>>>>>> 37918dd7a9f61cfe850a80d2e1ee7d7a586eb710
              onChanged: (newValue) {
                setState(() {
                  size = newValue;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
<<<<<<< HEAD
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: const Color(0xffff40ac)),
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
=======
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.black,
                  width: 0.5,
                ),
                // disabledBackgroundColor: const Color(0xffff97d0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: const Color(0xffff40ac),
              ),
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
              child: Text(
                'Dodaj pozycję',
                style: GoogleFonts.teko(color: Colors.white, fontSize: 24),
              ),
            )
>>>>>>> 37918dd7a9f61cfe850a80d2e1ee7d7a586eb710
          ],
        ),
      ),
    );
  }
}
