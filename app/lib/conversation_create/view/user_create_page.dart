import 'package:flutter/material.dart';

class UserCreatePage extends StatelessWidget {
  static Page<void> page() => MaterialPage<void>(
        child: UserCreatePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: UserCreateForm(),
    );
  }
}

class UserCreateForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("UserCreateForm");
  }
}
