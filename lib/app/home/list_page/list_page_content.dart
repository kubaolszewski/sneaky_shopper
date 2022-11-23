import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/home/add_product_page/add_product_page_content.dart';

class ListPageContent extends StatelessWidget {
  const ListPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('shoes')
            .orderBy('price', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong',
                  style: GoogleFonts.teko(color: Colors.white, fontSize: 24)),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading...',
                  style: GoogleFonts.teko(color: Colors.white, fontSize: 24)),
            );
          }

          final documents = snapshot.data!.docs;

          return ListView(children: [
            for (final document in documents) ...[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xff85c8c9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Image(
                                image: AssetImage('images/przyklad.jpg'),
                                width: 90)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(document['name'],
                                style: GoogleFonts.teko(
                                    color: Colors.white, fontSize: 24)),
                            Text('Cena: ${document['price'].toString()} -,',
                                style: GoogleFonts.teko(
                                    color: Colors.white, fontSize: 24)),
                            Text('Rozmiar: ${document['size'].toString()}',
                                style: GoogleFonts.teko(
                                    color: Colors.white, fontSize: 24)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 60.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      backgroundColor: const Color(0xff85c8c9)),
                  onPressed: () {
                    /*
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const AddProductPageContent()));
                  */
                  },
                  child: Text('Dodaj produkt do listy',
                      style:
                          GoogleFonts.teko(color: Colors.white, fontSize: 24))),
            ),
          ]);
        });
  }
}
