import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/models/brand_model.dart';

class BrandInfoContent extends StatelessWidget {
  const BrandInfoContent({
    Key? key,
    required this.brand,
  }) : super(key: key);

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2D9A8D),
      appBar: AppBar(
        backgroundColor: const Color(0xff03675B),
        centerTitle: true,
        title: Text(
          brand.brandName,
          style: GoogleFonts.teko(
            color: Colors.white,
            fontSize: 36,
          ),
        ),
      ),
      body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(brand.image),
                        radius: 120,
                      ),
                    ),
                  ),
                  Text(
                    brand.brandName,
                    style: GoogleFonts.teko(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    brand.field,
                    style: GoogleFonts.teko(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff85c8c9),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          brand.description,
                          style: GoogleFonts.teko(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}