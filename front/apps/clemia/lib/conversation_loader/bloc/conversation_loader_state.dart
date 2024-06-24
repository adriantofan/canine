part of 'conversation_loader_cubit.dart';

@freezed
class ConversationLoaderState with _$ConversationLoaderState {
  const factory ConversationLoaderState.initial({
    required int workspaceId,
    @Default(null) ConversationInfo? conversationInfo,
  }) = ConversationLoaderStateInitial;
}
