

import 'package:flutter_test/flutter_test.dart';

class UriTest {

  void main() {

    test("can we append query string to uri",  () {

      final uri = Uri.parse("google.com");
      expect(uri.queryParameters.putIfAbsent("q", () => "howto"), "google.com?q=howto");
    },);

  }

}