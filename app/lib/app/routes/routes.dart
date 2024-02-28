import 'package:canine_sync/canine_sync.dart';
import 'package:flutter/material.dart';

import '../../login/login.dart';
import '../../tab_home.dart';

List<Page> onGenerateAppViewPages(
    AuthenticationStatus authenticationStatus, List<Page<dynamic>> pages) {
  switch (authenticationStatus) {
    case AuthenticationStatus.authenticated:
      return [const MaterialPage<void>(child: TabHome())];
    case AuthenticationStatus.unknown || AuthenticationStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
