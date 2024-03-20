import 'package:app/re_login/view/re_login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../login/login.dart';
import '../../logout/logout.dart';
import '../../re_login/re_login.dart';
import '../../splash/splash.dart';
import '../../tab_home/tab_home.dart';
import '../bloc/app_bloc.dart';

List<Page> onGenerateAppViewPages(
    AppState appState, List<Page<dynamic>> pages) {
  switch (appState) {
    case Unknown():
      return [SplashPage.page()];
    case LoginRegisterFlow():
      return [LoginPage.page()];

    case Login():
      return [ReLoginPage.page()];
    case Running():
      return [TabHome.page()];
    case RunningRefresh():
      // TODO:
      return [TabHome.page(), ReLoginPage.page()]; // try to add refresh
    case LoggingOut():
      return [LogoutPage.page()];
  }
}

// see https://croxx5f.hashnode.dev/adding-modal-routes-to-your-gorouter
abstract class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/confirm-password',
        builder: (context, state) => const ReLoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const TabHome(),
      ),
      GoRoute(
        path: '/logout',
        builder: (context, state) => const LogoutPage(),
      ),
    ],
  );
}
