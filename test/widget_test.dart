import 'package:flutter_test/flutter_test.dart';
import 'package:water_hydration/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const WaterTrackerApp());
    expect(find.text('Water Tracker'), findsOneWidget);
  });
}
