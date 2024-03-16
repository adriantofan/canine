import 'package:app/conversation_create/bloc/create_flow_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/repository.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  static Page<void> page() {
    return const MaterialPage<void>(child: UserListPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(onPressed: () {
          context.read<CreateFlowBloc>().add(const CreateFlowEvent.cancel());
        }),
        title: const Text('Select a user'),
      ),
      body: UsersList(
        onUserSelected: (user) {},
      ),
    );
  }
}

class UsersList extends StatelessWidget {
  final Function(User) onUserSelected;

  const UsersList({super.key, required this.onUserSelected});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<User>>(
        stream: context.read<SyncRepository>().users(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length + 1,
              itemBuilder: (context, index) {
                return (index == 0)
                    ? _makeButton(context)
                    : ListTile(
                        title: Text(users[index - 1].messagingAddress),
                        onTap: () {
                          onUserSelected(users[index - 1]);
                        },
                      );
              },
            );
          }
          return const CircularProgressIndicator();
        });
  }

  Widget _makeButton(BuildContext context) {
    return ListTile(
        title: const Text('Start with devis'),
        subtitle: const Text(
            'Upload a devis to start a conversation with its recipient'),
        onTap: () {
          context
              .read<CreateFlowBloc>()
              .add(const CreateFlowEvent.filePressed());
        });
  }
}
