import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:courses_app/resources/resources.dart';

void main() {
  test('svgs assets test', () {
    expect(File(Svgs.kidStudying).existsSync(), isTrue);
  });
}
