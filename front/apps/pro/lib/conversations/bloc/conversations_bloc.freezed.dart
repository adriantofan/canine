// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConversationsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ConversationInfo conversation) select,
    required TResult Function(String id) routeChanged,
    required TResult Function() deselect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ConversationInfo conversation)? select,
    TResult? Function(String id)? routeChanged,
    TResult? Function()? deselect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ConversationInfo conversation)? select,
    TResult Function(String id)? routeChanged,
    TResult Function()? deselect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationsEventInitial value) initial,
    required TResult Function(ConversationsEventSelect value) select,
    required TResult Function(ConversationsEventRouteChanged value)
        routeChanged,
    required TResult Function(ConversationsEventDeselect value) deselect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationsEventInitial value)? initial,
    TResult? Function(ConversationsEventSelect value)? select,
    TResult? Function(ConversationsEventRouteChanged value)? routeChanged,
    TResult? Function(ConversationsEventDeselect value)? deselect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationsEventInitial value)? initial,
    TResult Function(ConversationsEventSelect value)? select,
    TResult Function(ConversationsEventRouteChanged value)? routeChanged,
    TResult Function(ConversationsEventDeselect value)? deselect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationsEventCopyWith<$Res> {
  factory $ConversationsEventCopyWith(
          ConversationsEvent value, $Res Function(ConversationsEvent) then) =
      _$ConversationsEventCopyWithImpl<$Res, ConversationsEvent>;
}

/// @nodoc
class _$ConversationsEventCopyWithImpl<$Res, $Val extends ConversationsEvent>
    implements $ConversationsEventCopyWith<$Res> {
  _$ConversationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ConversationsEventInitialImplCopyWith<$Res> {
  factory _$$ConversationsEventInitialImplCopyWith(
          _$ConversationsEventInitialImpl value,
          $Res Function(_$ConversationsEventInitialImpl) then) =
      __$$ConversationsEventInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConversationsEventInitialImplCopyWithImpl<$Res>
    extends _$ConversationsEventCopyWithImpl<$Res,
        _$ConversationsEventInitialImpl>
    implements _$$ConversationsEventInitialImplCopyWith<$Res> {
  __$$ConversationsEventInitialImplCopyWithImpl(
      _$ConversationsEventInitialImpl _value,
      $Res Function(_$ConversationsEventInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConversationsEventInitialImpl implements ConversationsEventInitial {
  const _$ConversationsEventInitialImpl();

  @override
  String toString() {
    return 'ConversationsEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationsEventInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ConversationInfo conversation) select,
    required TResult Function(String id) routeChanged,
    required TResult Function() deselect,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ConversationInfo conversation)? select,
    TResult? Function(String id)? routeChanged,
    TResult? Function()? deselect,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ConversationInfo conversation)? select,
    TResult Function(String id)? routeChanged,
    TResult Function()? deselect,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationsEventInitial value) initial,
    required TResult Function(ConversationsEventSelect value) select,
    required TResult Function(ConversationsEventRouteChanged value)
        routeChanged,
    required TResult Function(ConversationsEventDeselect value) deselect,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationsEventInitial value)? initial,
    TResult? Function(ConversationsEventSelect value)? select,
    TResult? Function(ConversationsEventRouteChanged value)? routeChanged,
    TResult? Function(ConversationsEventDeselect value)? deselect,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationsEventInitial value)? initial,
    TResult Function(ConversationsEventSelect value)? select,
    TResult Function(ConversationsEventRouteChanged value)? routeChanged,
    TResult Function(ConversationsEventDeselect value)? deselect,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ConversationsEventInitial implements ConversationsEvent {
  const factory ConversationsEventInitial() = _$ConversationsEventInitialImpl;
}

/// @nodoc
abstract class _$$ConversationsEventSelectImplCopyWith<$Res> {
  factory _$$ConversationsEventSelectImplCopyWith(
          _$ConversationsEventSelectImpl value,
          $Res Function(_$ConversationsEventSelectImpl) then) =
      __$$ConversationsEventSelectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ConversationInfo conversation});
}

/// @nodoc
class __$$ConversationsEventSelectImplCopyWithImpl<$Res>
    extends _$ConversationsEventCopyWithImpl<$Res,
        _$ConversationsEventSelectImpl>
    implements _$$ConversationsEventSelectImplCopyWith<$Res> {
  __$$ConversationsEventSelectImplCopyWithImpl(
      _$ConversationsEventSelectImpl _value,
      $Res Function(_$ConversationsEventSelectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversation = null,
  }) {
    return _then(_$ConversationsEventSelectImpl(
      null == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as ConversationInfo,
    ));
  }
}

/// @nodoc

class _$ConversationsEventSelectImpl implements ConversationsEventSelect {
  const _$ConversationsEventSelectImpl(this.conversation);

  @override
  final ConversationInfo conversation;

  @override
  String toString() {
    return 'ConversationsEvent.select(conversation: $conversation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationsEventSelectImpl &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationsEventSelectImplCopyWith<_$ConversationsEventSelectImpl>
      get copyWith => __$$ConversationsEventSelectImplCopyWithImpl<
          _$ConversationsEventSelectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ConversationInfo conversation) select,
    required TResult Function(String id) routeChanged,
    required TResult Function() deselect,
  }) {
    return select(conversation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ConversationInfo conversation)? select,
    TResult? Function(String id)? routeChanged,
    TResult? Function()? deselect,
  }) {
    return select?.call(conversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ConversationInfo conversation)? select,
    TResult Function(String id)? routeChanged,
    TResult Function()? deselect,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(conversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationsEventInitial value) initial,
    required TResult Function(ConversationsEventSelect value) select,
    required TResult Function(ConversationsEventRouteChanged value)
        routeChanged,
    required TResult Function(ConversationsEventDeselect value) deselect,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationsEventInitial value)? initial,
    TResult? Function(ConversationsEventSelect value)? select,
    TResult? Function(ConversationsEventRouteChanged value)? routeChanged,
    TResult? Function(ConversationsEventDeselect value)? deselect,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationsEventInitial value)? initial,
    TResult Function(ConversationsEventSelect value)? select,
    TResult Function(ConversationsEventRouteChanged value)? routeChanged,
    TResult Function(ConversationsEventDeselect value)? deselect,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class ConversationsEventSelect implements ConversationsEvent {
  const factory ConversationsEventSelect(final ConversationInfo conversation) =
      _$ConversationsEventSelectImpl;

  ConversationInfo get conversation;
  @JsonKey(ignore: true)
  _$$ConversationsEventSelectImplCopyWith<_$ConversationsEventSelectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConversationsEventRouteChangedImplCopyWith<$Res> {
  factory _$$ConversationsEventRouteChangedImplCopyWith(
          _$ConversationsEventRouteChangedImpl value,
          $Res Function(_$ConversationsEventRouteChangedImpl) then) =
      __$$ConversationsEventRouteChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ConversationsEventRouteChangedImplCopyWithImpl<$Res>
    extends _$ConversationsEventCopyWithImpl<$Res,
        _$ConversationsEventRouteChangedImpl>
    implements _$$ConversationsEventRouteChangedImplCopyWith<$Res> {
  __$$ConversationsEventRouteChangedImplCopyWithImpl(
      _$ConversationsEventRouteChangedImpl _value,
      $Res Function(_$ConversationsEventRouteChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ConversationsEventRouteChangedImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConversationsEventRouteChangedImpl
    implements ConversationsEventRouteChanged {
  const _$ConversationsEventRouteChangedImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ConversationsEvent.routeChanged(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationsEventRouteChangedImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationsEventRouteChangedImplCopyWith<
          _$ConversationsEventRouteChangedImpl>
      get copyWith => __$$ConversationsEventRouteChangedImplCopyWithImpl<
          _$ConversationsEventRouteChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ConversationInfo conversation) select,
    required TResult Function(String id) routeChanged,
    required TResult Function() deselect,
  }) {
    return routeChanged(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ConversationInfo conversation)? select,
    TResult? Function(String id)? routeChanged,
    TResult? Function()? deselect,
  }) {
    return routeChanged?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ConversationInfo conversation)? select,
    TResult Function(String id)? routeChanged,
    TResult Function()? deselect,
    required TResult orElse(),
  }) {
    if (routeChanged != null) {
      return routeChanged(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationsEventInitial value) initial,
    required TResult Function(ConversationsEventSelect value) select,
    required TResult Function(ConversationsEventRouteChanged value)
        routeChanged,
    required TResult Function(ConversationsEventDeselect value) deselect,
  }) {
    return routeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationsEventInitial value)? initial,
    TResult? Function(ConversationsEventSelect value)? select,
    TResult? Function(ConversationsEventRouteChanged value)? routeChanged,
    TResult? Function(ConversationsEventDeselect value)? deselect,
  }) {
    return routeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationsEventInitial value)? initial,
    TResult Function(ConversationsEventSelect value)? select,
    TResult Function(ConversationsEventRouteChanged value)? routeChanged,
    TResult Function(ConversationsEventDeselect value)? deselect,
    required TResult orElse(),
  }) {
    if (routeChanged != null) {
      return routeChanged(this);
    }
    return orElse();
  }
}

abstract class ConversationsEventRouteChanged implements ConversationsEvent {
  const factory ConversationsEventRouteChanged(final String id) =
      _$ConversationsEventRouteChangedImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$ConversationsEventRouteChangedImplCopyWith<
          _$ConversationsEventRouteChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConversationsEventDeselectImplCopyWith<$Res> {
  factory _$$ConversationsEventDeselectImplCopyWith(
          _$ConversationsEventDeselectImpl value,
          $Res Function(_$ConversationsEventDeselectImpl) then) =
      __$$ConversationsEventDeselectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConversationsEventDeselectImplCopyWithImpl<$Res>
    extends _$ConversationsEventCopyWithImpl<$Res,
        _$ConversationsEventDeselectImpl>
    implements _$$ConversationsEventDeselectImplCopyWith<$Res> {
  __$$ConversationsEventDeselectImplCopyWithImpl(
      _$ConversationsEventDeselectImpl _value,
      $Res Function(_$ConversationsEventDeselectImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConversationsEventDeselectImpl implements ConversationsEventDeselect {
  const _$ConversationsEventDeselectImpl();

  @override
  String toString() {
    return 'ConversationsEvent.deselect()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationsEventDeselectImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ConversationInfo conversation) select,
    required TResult Function(String id) routeChanged,
    required TResult Function() deselect,
  }) {
    return deselect();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ConversationInfo conversation)? select,
    TResult? Function(String id)? routeChanged,
    TResult? Function()? deselect,
  }) {
    return deselect?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ConversationInfo conversation)? select,
    TResult Function(String id)? routeChanged,
    TResult Function()? deselect,
    required TResult orElse(),
  }) {
    if (deselect != null) {
      return deselect();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationsEventInitial value) initial,
    required TResult Function(ConversationsEventSelect value) select,
    required TResult Function(ConversationsEventRouteChanged value)
        routeChanged,
    required TResult Function(ConversationsEventDeselect value) deselect,
  }) {
    return deselect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationsEventInitial value)? initial,
    TResult? Function(ConversationsEventSelect value)? select,
    TResult? Function(ConversationsEventRouteChanged value)? routeChanged,
    TResult? Function(ConversationsEventDeselect value)? deselect,
  }) {
    return deselect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationsEventInitial value)? initial,
    TResult Function(ConversationsEventSelect value)? select,
    TResult Function(ConversationsEventRouteChanged value)? routeChanged,
    TResult Function(ConversationsEventDeselect value)? deselect,
    required TResult orElse(),
  }) {
    if (deselect != null) {
      return deselect(this);
    }
    return orElse();
  }
}

abstract class ConversationsEventDeselect implements ConversationsEvent {
  const factory ConversationsEventDeselect() = _$ConversationsEventDeselectImpl;
}
