import 'package:flutter/material.dart';
import 'package:proyecto_killer/ui/menu/menu_page.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(
    const GlobalData(
      desarrollador: false,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MenuPage(),
        );
      },
    );
  }
}

class GlobalData extends InheritedWidget {
  const GlobalData({
    super.key,
    required this.desarrollador,
    required super.child,
  });

  final bool desarrollador;

  static GlobalData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GlobalData>();
  }

  static GlobalData of(BuildContext context) {
    final GlobalData? result = maybeOf(context);
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(GlobalData oldWidget) =>
      desarrollador != oldWidget.desarrollador;
}
