import 'package:applib/applib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListPage extends StatelessWidget {
  const UserListPage(
      {super.key,
      this.onFlowCancelled,
      this.onFilePressed,
      this.onUserSelected});
  final ValueSetter<BuildContext>? onFlowCancelled;
  final ValueSetter<BuildContext>? onFilePressed;
  final ValueSetter<(BuildContext, User)>? onUserSelected;

  static Page<void> page(
      ValueSetter<BuildContext>? onFlowCancelled,
      ValueSetter<BuildContext>? onFilePressed,
      ValueSetter<(BuildContext, User)>? onUserSelected) {
    return MaterialPage<void>(
        child: UserListPage(
      onFlowCancelled: onFlowCancelled,
      onFilePressed: onFilePressed,
      onUserSelected: onUserSelected,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(onPressed: () => onFlowCancelled?.call(context)),
        title: const Text('Select a user'),
      ),
      body: UsersList(
        onFilePressed: onFilePressed,
        onUserSelected: onUserSelected,
      ),
    );
  }
}

class UsersList extends StatelessWidget {
  final ValueSetter<BuildContext>? onFilePressed;

  final ValueSetter<(BuildContext, User)>? onUserSelected;

  const UsersList(
      {super.key, required this.onUserSelected, this.onFilePressed});

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
                        title: Text(users[index - 1].email),
                        onTap: () =>
                            onUserSelected?.call((context, users[index - 1])),
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
        onTap: onFilePressed != null
            ? () {
                onFilePressed!(context);
              }
            : null);
  }
}
