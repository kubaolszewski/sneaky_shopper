import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(const RootState());

  Future<void> register(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(
        RootState(
          user: null,
          isLoading: false,
          isCreatingAccount: false,
          errorMessage: error.toString(),
          pageIndex: 0,
        ),
      );
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(
        RootState(
          user: null,
          isLoading: false,
          isCreatingAccount: false,
          errorMessage: error.toString(),
          pageIndex: 0,
        ),
      );
    }
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> changeOnSave(int newPageIndex) async {
    emit(
      RootState(
        user: null,
        isLoading: true,
        isCreatingAccount: false,
        errorMessage: '',
        pageIndex: newPageIndex,
      ),
    );
  }

  Future<void> changeIndex(int newPageIndex) async {
    emit(
      RootState(
        user: null,
        isLoading: true,
        isCreatingAccount: false,
        errorMessage: '',
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
        errorMessage: '',
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
        errorMessage: '',
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

    _streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        emit(
          RootState(
            user: user,
            isLoading: false,
            isCreatingAccount: false,
            errorMessage: '',
            pageIndex: state.pageIndex,
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            RootState(
              user: null,
              isLoading: false,
              isCreatingAccount: false,
              errorMessage: error.toString(),
              pageIndex: state.pageIndex,
            ),
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
