// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RootState {
  User? get user => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  bool get isCreatingAccount => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  int get pageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RootStateCopyWith<RootState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootStateCopyWith<$Res> {
  factory $RootStateCopyWith(RootState value, $Res Function(RootState) then) =
      _$RootStateCopyWithImpl<$Res, RootState>;
  @useResult
  $Res call(
      {User? user,
      Status status,
      bool isCreatingAccount,
      String errorMessage,
      int pageIndex});
}

/// @nodoc
class _$RootStateCopyWithImpl<$Res, $Val extends RootState>
    implements $RootStateCopyWith<$Res> {
  _$RootStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? status = null,
    Object? isCreatingAccount = null,
    Object? errorMessage = null,
    Object? pageIndex = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      isCreatingAccount: null == isCreatingAccount
          ? _value.isCreatingAccount
          : isCreatingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RootStateImplCopyWith<$Res>
    implements $RootStateCopyWith<$Res> {
  factory _$$RootStateImplCopyWith(
          _$RootStateImpl value, $Res Function(_$RootStateImpl) then) =
      __$$RootStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User? user,
      Status status,
      bool isCreatingAccount,
      String errorMessage,
      int pageIndex});
}

/// @nodoc
class __$$RootStateImplCopyWithImpl<$Res>
    extends _$RootStateCopyWithImpl<$Res, _$RootStateImpl>
    implements _$$RootStateImplCopyWith<$Res> {
  __$$RootStateImplCopyWithImpl(
      _$RootStateImpl _value, $Res Function(_$RootStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? status = null,
    Object? isCreatingAccount = null,
    Object? errorMessage = null,
    Object? pageIndex = null,
  }) {
    return _then(_$RootStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      isCreatingAccount: null == isCreatingAccount
          ? _value.isCreatingAccount
          : isCreatingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RootStateImpl implements _RootState {
  const _$RootStateImpl(
      {this.user,
      this.status = Status.initial,
      this.isCreatingAccount = false,
      this.errorMessage = '',
      this.pageIndex = 0});

  @override
  final User? user;
  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final bool isCreatingAccount;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final int pageIndex;

  @override
  String toString() {
    return 'RootState(user: $user, status: $status, isCreatingAccount: $isCreatingAccount, errorMessage: $errorMessage, pageIndex: $pageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RootStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isCreatingAccount, isCreatingAccount) ||
                other.isCreatingAccount == isCreatingAccount) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, status, isCreatingAccount, errorMessage, pageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RootStateImplCopyWith<_$RootStateImpl> get copyWith =>
      __$$RootStateImplCopyWithImpl<_$RootStateImpl>(this, _$identity);
}

abstract class _RootState implements RootState {
  const factory _RootState(
      {final User? user,
      final Status status,
      final bool isCreatingAccount,
      final String errorMessage,
      final int pageIndex}) = _$RootStateImpl;

  @override
  User? get user;
  @override
  Status get status;
  @override
  bool get isCreatingAccount;
  @override
  String get errorMessage;
  @override
  int get pageIndex;
  @override
  @JsonKey(ignore: true)
  _$$RootStateImplCopyWith<_$RootStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
