import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/repository.dart';
import '../bloc/create_flow_cubit.dart';
import '../model/create_result.dart';
import '../routes/routes.dart';

class ConversationCreatePage extends StatelessWidget {
  final SyncRepository _repository;
  final ValueSetter<CreateFlowResult> _didCreate;

  const ConversationCreatePage(
      {required SyncRepository repository,
      required ValueSetter<CreateFlowResult> didCreate,
      super.key})
      : _repository = repository,
        _didCreate = didCreate;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _repository,
      child: BlocProvider(
        create: (c) => CreateFlowCubit(_didCreate, _repository),
        child: const ConversationCreateWidget(),
      ),
    );
  }
}

class ConversationCreateWidget extends StatelessWidget {
  const ConversationCreateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateFlowCubit, CreateFlowState>(
      listener: (context, state) {},
      builder: (context, state) {
        // Seems to have it's own Navigator
        return FlowBuilder(
          state: context.select((CreateFlowCubit bloc) => bloc.state),
          onGeneratePages: onGeneratePages,
          observers: [
            // this is used to change state on the back button press to work with
            // onGeneratePages
            _PopObserver(onPop: () => context.read<CreateFlowCubit>().onPop())
          ],
        );
      },
    );
  }
}

class _PopObserver extends NavigatorObserver {
  _PopObserver({
    this.onPop,
  });

  final VoidCallback? onPop;

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    onPop?.call();
  }
}
