// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchPageState {
  List<SingleSneakerModel> get sneakersModel =>
      throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchPageStateCopyWith<SearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPageStateCopyWith<$Res> {
  factory $SearchPageStateCopyWith(
          SearchPageState value, $Res Function(SearchPageState) then) =
      _$SearchPageStateCopyWithImpl<$Res, SearchPageState>;
  @useResult
  $Res call(
      {List<SingleSneakerModel> sneakersModel,
      Status status,
      String errorMessage});
}

/// @nodoc
class _$SearchPageStateCopyWithImpl<$Res, $Val extends SearchPageState>
    implements $SearchPageStateCopyWith<$Res> {
  _$SearchPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sneakersModel = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      sneakersModel: null == sneakersModel
          ? _value.sneakersModel
          : sneakersModel // ignore: cast_nullable_to_non_nullable
              as List<SingleSneakerModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchPageStateImplCopyWith<$Res>
    implements $SearchPageStateCopyWith<$Res> {
  factory _$$SearchPageStateImplCopyWith(_$SearchPageStateImpl value,
          $Res Function(_$SearchPageStateImpl) then) =
      __$$SearchPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SingleSneakerModel> sneakersModel,
      Status status,
      String errorMessage});
}

/// @nodoc
class __$$SearchPageStateImplCopyWithImpl<$Res>
    extends _$SearchPageStateCopyWithImpl<$Res, _$SearchPageStateImpl>
    implements _$$SearchPageStateImplCopyWith<$Res> {
  __$$SearchPageStateImplCopyWithImpl(
      _$SearchPageStateImpl _value, $Res Function(_$SearchPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sneakersModel = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$SearchPageStateImpl(
      sneakersModel: null == sneakersModel
          ? _value._sneakersModel
          : sneakersModel // ignore: cast_nullable_to_non_nullable
              as List<SingleSneakerModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchPageStateImpl implements _SearchPageState {
  const _$SearchPageStateImpl(
      {final List<SingleSneakerModel> sneakersModel = const [],
      this.status = Status.initial,
      this.errorMessage = ''})
      : _sneakersModel = sneakersModel;

  final List<SingleSneakerModel> _sneakersModel;
  @override
  @JsonKey()
  List<SingleSneakerModel> get sneakersModel {
    if (_sneakersModel is EqualUnmodifiableListView) return _sneakersModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sneakersModel);
  }

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'SearchPageState(sneakersModel: $sneakersModel, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPageStateImpl &&
            const DeepCollectionEquality()
                .equals(other._sneakersModel, _sneakersModel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sneakersModel),
      status,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPageStateImplCopyWith<_$SearchPageStateImpl> get copyWith =>
      __$$SearchPageStateImplCopyWithImpl<_$SearchPageStateImpl>(
          this, _$identity);
}

abstract class _SearchPageState implements SearchPageState {
  const factory _SearchPageState(
      {final List<SingleSneakerModel> sneakersModel,
      final Status status,
      final String errorMessage}) = _$SearchPageStateImpl;

  @override
  List<SingleSneakerModel> get sneakersModel;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$SearchPageStateImplCopyWith<_$SearchPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}