import 'package:app/re_login/view/re_login_page.dart';
import 'package:flutter/material.dart';

import '../../login/login.dart';
import '../../logout/logout.dart';
import '../../re_login/re_login.dart';
import '../../splash/splash.dart';
import '../../tab_home.dart';
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
      return [TabHome.page(), ReLoginPage.page()]; // try to add refresh
    case LoggingOut():
      return [LogoutPage.page()];
  }
}
