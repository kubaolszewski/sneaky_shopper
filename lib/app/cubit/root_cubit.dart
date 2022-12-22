import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sneaky_shopper/repositories/login_repository.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit(this._loginRepository) : super(const RootState());

  final LoginRepository _loginRepository;

  Future<void> register(
      {required String email, required String password}) async {
    try {
      await _loginRepository.register(email: email, password: password);
    } catch (error) {
      emit(
        RootState(user: null, errorMessage: error.toString()),
      );
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _loginRepository.signIn(email: email, password: password);
    } catch (error) {
      emit(
        RootState(user: null, errorMessage: error.toString()),
      );
    }
  }

  Future<void> signOut() async {
    _loginRepository.signOut();
  }

  Future<void> changeIndexOnSave(int newPageIndex) async {
    emit(
      RootState(
        isLoading: true,
        pageIndex: newPageIndex,
      ),
    );
  }

  Future<void> creatingAccount() async {
    emit(
      RootState(
        user: null,
        isLoading: true,
        isCreatingAccount: true,
        pageIndex: state.pageIndex,
      ),
    );
  }

  Future<void> notCreatingAccount() async {
    emit(
      RootState(
        user: null,
        isLoading: true,
        isCreatingAccount: false,
        pageIndex: state.pageIndex,
      ),
    );
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      RootState(
        user: null,
        isLoading: true,
        isCreatingAccount: false,
        errorMessage: '',
        pageIndex: state.pageIndex,
      ),
    );

    _streamSubscription = _loginRepository.authState().listen(
      (user) {
        emit(
          RootState(user: user, pageIndex: state.pageIndex),
        );
      },
    )..onError(
        (error) {
          emit(
            RootState(
                errorMessage: error.toString(), pageIndex: state.pageIndex),
          );
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
