import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'list_page_state.dart';

class ListPageCubit extends Cubit<ListPageState> {
  ListPageCubit()
      : super(
          const ListPageState(
            documents: [],
          ),
        );
}
