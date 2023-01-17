import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/repositories/login_repository.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit(this._loginRepository) : super(const RootState());

  final LoginRepository _loginRepository;

  Future<void> register(
      {required String email,
      required String password,
      required String confirmPassword}) async {
    if (password.trim() != confirmPassword.trim()) {
      emit(
        const RootState(
          errorMessage: 'Passwords don\'t match.',
          isCreatingAccount: true,
        ),
      );
    } else {
      try {
        await _loginRepository.register(email: email, password: password);
        emit(
          const RootState(status: Status.success),
        );
      } catch (error) {
        emit(
          RootState(
            user: null,
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      }
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _loginRepository.signIn(email: email, password: password);
      emit(
        const RootState(status: Status.success),
      );
    } catch (error) {
      emit(
        RootState(
          user: null,
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> signOut() async {
    _loginRepository.signOut();
    emit(
      const RootState(status: Status.success),
    );
  }

  Future<void> changeIndexOnSave(int newPageIndex) async {
    emit(
      RootState(
        pageIndex: newPageIndex,
      ),
    );
  }

  Future<void> creatingAccount() async {
    emit(
      RootState(
        user: null,
        isCreatingAccount: true,
        pageIndex: state.pageIndex,
      ),
    );
  }

  Future<void> notCreatingAccount() async {
    emit(
      RootState(
        user: null,
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
        status: Status.initial,
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
          emit(RootState(
              status: Status.error,
              errorMessage: error.toString(),
              pageIndex: state.pageIndex));
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
