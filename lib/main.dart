import 'package:flutter/material.dart';
import 'package:proyecto_killer/menu/menuPage.dart';
import 'package:proyecto_killer/playersRegister/registerPlayersPage.dart';
import 'package:proyecto_killer/user/userRegister/userRegisterPage.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    GlobalData(
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
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
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
