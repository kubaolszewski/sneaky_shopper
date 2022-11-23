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
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xff85c8c9),
                hintText: 'Wpisz nazwę modelu:',
              ),
              onChanged: (newValue) {
                setState(() {
                  name = newValue;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xff85c8c9),
                hintText: 'Podaj cenę:',
              ),
              onChanged: (newValue) {
                setState(() {});
              },
            ),
            TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xff85c8c9),
                hintText: 'Podaj rozmiar:',
              ),
              onChanged: (newValue) {
                setState(() {});
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: const Color(0xff11DDC4),
                ),
                onPressed: name.isEmpty
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
