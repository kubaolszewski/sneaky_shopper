part of 'root_cubit.dart';

@freezed
class RootState with _$RootState {
  const factory RootState({
    User? user,
    @Default(Status.initial) Status status,
    @Default(false) bool isCreatingAccount,
    @Default('') String errorMessage,
    @Default(0) int pageIndex,
  }) = _RootState;
}

// class RootState {
//   const RootState({
//     this.user,
//     this.status = Status.initial,
//     this.isCreatingAccount = false,
//     this.errorMessage = '',
//     this.pageIndex = 0,
//   });

//   final User? user;
//   final Status status;
//   final bool isCreatingAccount;
//   final String errorMessage;
//   final int pageIndex;
// }
