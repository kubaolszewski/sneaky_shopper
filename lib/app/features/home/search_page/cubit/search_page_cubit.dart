import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sneaky_shopper/app/core/enums.dart';

part 'search_page_state.dart';

part 'search_page_cubit.freezed.dart';

class SearchPageCubit extends Cubit<SearchPageState> {
  SearchPageCubit() : super(const SearchPageState());
}
