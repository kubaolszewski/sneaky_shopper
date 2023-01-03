part of 'root_cubit.dart';

class RootState {
  const RootState({
    this.user,
    this.status = Status.initial,
    this.isCreatingAccount = false,
    this.errorMessage = '',
    this.pageIndex = 0,
  });

  final User? user;
  final Status status;
  final bool isCreatingAccount;
  final String errorMessage;
  final int pageIndex;
}
