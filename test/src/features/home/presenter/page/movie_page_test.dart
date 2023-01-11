import 'package:challenge_marvel_studio/src/features/home/presenter/page/movie_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testWidgets('Home Page - golden test', (widgetTester) async {
    await loadAppFonts();
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
      ])
      ..addScenario(widget: const MoviePage());

    await widgetTester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(widgetTester, 'Home Page');
  });
}
