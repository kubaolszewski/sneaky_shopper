part of 'root_cubit.dart';

@immutable
class RootState {
  final User? user;
  final bool isLoading;
  final bool isCreatingAccount;
  final String errorMessage;
  final int pageIndex;

  const RootState({
    required this.user,
    required this.isLoading,
    required this.errorMessage,
    required this.pageIndex,
    required this.isCreatingAccount,
  });
}
