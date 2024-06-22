import 'package:applib/private/config.dart';

import 'app/bloc/app_bloc.dart';

void initAppLib(AppType appType) {
  AppLibConfig.init(appType: appType);
}
