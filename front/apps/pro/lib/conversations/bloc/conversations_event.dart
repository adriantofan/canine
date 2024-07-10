part of 'conversations_bloc.dart';

@freezed
sealed class ConversationsEvent with _$ConversationsEvent {
  const factory ConversationsEvent.initial() = ConversationsEventInitial;
  const factory ConversationsEvent.select(ConversationInfo conversation) =
      ConversationsEventSelect;
  const factory ConversationsEvent.routeChanged(String id) =
      ConversationsEventRouteChanged;
  const factory ConversationsEvent.deselect() = ConversationsEventDeselect;
}
