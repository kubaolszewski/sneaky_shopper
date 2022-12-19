part of 'root_cubit.dart';

class RootState {
  const RootState({
    this.user,
    this.isLoading = false,
    this.isCreatingAccount = false,
    this.errorMessage = '',
    this.pageIndex = 0,
  });

  final User? user;
  final bool isLoading;
  final bool isCreatingAccount;
  final String errorMessage;
  final int pageIndex;
}
