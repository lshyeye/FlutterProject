import 'package:flutter_test/flutter_test.dart';

import 'package:hm_shop/routes/index.dart';

void main() {
  testWidgets('App should build without errors', (WidgetTester tester) async {
    await tester.pumpWidget(getRootWidget());
    await tester.pump();
  });
}
