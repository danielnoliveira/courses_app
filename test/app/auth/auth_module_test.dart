import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:courses_app/app/auth/auth_module.dart';
 
void main() {

  setUpAll(() {
    initModule(AuthModule());
  });
}