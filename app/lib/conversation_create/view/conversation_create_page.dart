import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/repository.dart';
import '../bloc/create_flow_bloc.dart';
import '../routes/routes.dart';

class ConversationCreatePage extends StatelessWidget {
  final SyncRepository _repository;
  final Function(Conversation?) _didSelectConversation;

  const ConversationCreatePage(
      {required SyncRepository repository,
      required Function(Conversation?) didSelectConversation,
      super.key})
      : _repository = repository,
        _didSelectConversation = didSelectConversation;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _repository,
      child: BlocProvider(
        create: (c) => CreateFlowBloc(c.read(), _didSelectConversation),
        child: const ConversationCreateWidget(),
      ),
    );
  }
}

class ConversationCreateWidget extends StatelessWidget {
  const ConversationCreateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateFlowBloc, CreateFlowState>(
      listener: (context, state) {},
      builder: (context, state) {
        // Seems to have it's own Navigator
        return FlowBuilder(
            state: context.select((CreateFlowBloc bloc) => bloc.state),
            onGeneratePages: onGeneratePages);
      },
    );
  }
}
