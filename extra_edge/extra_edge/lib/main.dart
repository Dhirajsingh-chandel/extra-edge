import 'package:extra_edge/controller/rocket_info.dart';
import 'package:extra_edge/resource/route_manager/route_manager.dart';
import 'package:extra_edge/resource/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/rocket_list_controller.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(
        create: (_) => RocketListProvider()),
          ChangeNotifierProvider(
              create: (_) => RocketInfoProvider()),
        ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          onGenerateRoute: RoutesGenerator.getRoute,
          initialRoute: Routes.splashPage,
      ),
    );
  }
}
