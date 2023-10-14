import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:courses_app/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.course0).existsSync(), isTrue);
    expect(File(Images.course1).existsSync(), isTrue);
    expect(File(Images.course2).existsSync(), isTrue);
    expect(File(Images.course4).existsSync(), isTrue);
    expect(File(Images.course5).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
  });
}
