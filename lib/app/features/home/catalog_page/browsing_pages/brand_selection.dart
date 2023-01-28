import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/app/features/home/catalog_page/browsing_pages/brand_info_content.dart';
import 'package:sneaky_shopper/app/features/home/catalog_page/cubit/catalog_page_cubit.dart';
import 'package:sneaky_shopper/app/injection_container.dart';
import 'package:sneaky_shopper/models/brand_model.dart';

class BrandPage extends StatelessWidget {
  const BrandPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatalogPageCubit>(
      create: (context) => getIt()..start(),
      child: BlocBuilder<CatalogPageCubit, CatalogPageState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return Center(
                child: Text(
                  'Initial state.',
                  style: GoogleFonts.teko(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              );
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.success:
              return ListView(
                children: [
                  Center(
                    child: Text(
                      'Brands',
                      style: GoogleFonts.teko(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  for (final brand in state.brandsInfo)
                    _BrandSelection(brand: brand),
                ],
              );
            case Status.error:
              return Center(
                child: Text(
                  'Something went wrong: ${state.errorMessage}',
                  style: GoogleFonts.teko(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}

class _BrandSelection extends StatelessWidget {
  const _BrandSelection({
    Key? key,
    required this.brand,
  }) : super(key: key);

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BrandInfoContent(brand: brand),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xff85c8c9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(brand.image),
                  radius: 60,
                ),
              ),
              Text(
                brand.brandName,
                style: GoogleFonts.teko(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
