part of 'conversations_bloc.dart';

@immutable
sealed class ConversationsEvent {}

class ConversationsInitial extends ConversationsEvent {}

class ConversationsSelect extends ConversationsEvent {
  final ConversationInfo conversation;
  ConversationsSelect(this.conversation);
}

class ConversationsRouteChanged extends ConversationsEvent {
  final String id;
  ConversationsRouteChanged(this.id);
}

class ConversationsDeselect extends ConversationsEvent {}
