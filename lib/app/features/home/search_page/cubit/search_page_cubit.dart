import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_info_remote_data_source.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart';
import 'package:sneaky_shopper/models/single_sneaker_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

part 'search_page_state.dart';

part 'search_page_cubit.freezed.dart';

class SearchPageCubit extends Cubit<SearchPageState> {
  final ItemsRepository itemsRepository = ItemsRepository(
    sneakersRemoteDataSource: SneakersRemoteDataSource(),
    itemsRemoteFirestoreDataSource: ItemsRemoteFirestoreDataSource(),
    itemsRemoteRetrofitDataSource: ItemsInfoRemoteRetrofitDataSource(
      Dio(),
    ),
  );
  SearchPageCubit() : super(const SearchPageState());

  Future<void> fetchSneakers() async {
    emit(const SearchPageState(status: Status.loading));
    try {
      final sneakersModel = await itemsRepository.fetchSneakers();
      emit(SearchPageState(
          sneakersModel: sneakersModel, status: Status.success));
    } catch (error) {
      emit(SearchPageState(
          status: Status.error, errorMessage: error.toString()));
    }
  }
}
