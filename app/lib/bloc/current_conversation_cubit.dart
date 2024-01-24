import 'package:app/state/ws.dart';
import 'package:bloc/bloc.dart';

class CurrentConversationCubit extends Cubit<Conversation?> {
  CurrentConversationCubit() : super((null));

  void selectConversation(Conversation? conversation) {
    emit(conversation);
  }
}
