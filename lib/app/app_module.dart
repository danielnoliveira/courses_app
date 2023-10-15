import 'package:courses_app/app/modules/auth/auth_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: AuthModule());
    r.module('/home', module: HomeModule());
  }
}
