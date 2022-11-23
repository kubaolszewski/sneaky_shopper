import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/home/list_page/productWidget.dart';
// import 'package:sneaky_shopper/app/home/add_product_page/add_product_page_content.dart';

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
              child: Text(
                'Something went wrong',
                style: GoogleFonts.teko(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                'Loading...',
                style: GoogleFonts.teko(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            );
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              for (final document in documents) ...[
                Dismissible(
                  key: ValueKey(document.id),
                  onDismissed: (_) {
                    FirebaseFirestore.instance
                        .collection('shoes')
                        .doc(document.id)
                        .delete();
                  },
                  child: productWidget(document),
                ),
              ],
            ],
          );
        });
  }
}
