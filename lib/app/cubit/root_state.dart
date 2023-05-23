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