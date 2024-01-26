part of 'conversations_bloc.dart';

@immutable
abstract class ConversationsEvent {}

class ConversationsInitial extends ConversationsEvent {}

class ConversationsSelect extends ConversationsEvent {
  final ConversationInfo conversation;
  ConversationsSelect(this.conversation);
}
