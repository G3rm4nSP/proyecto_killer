import 'package:flutter/material.dart';
import 'package:proyecto_killer/main.dart';
import 'package:proyecto_killer/ui/killer_game/register_players_page.dart';
import 'package:proyecto_killer/ui/user_logIn/user_log_in_page.dart';
import 'package:proyecto_killer/ui/user_register/user_register_page.dart';
import 'package:sizer/sizer.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: const Color.fromARGB(255, 129, 195, 224),
        //boton que cambie la vaariable GlobalData.of(context) a true o false segun se pulse
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                GlobalData.of(context).desarrollador;
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //juegos
              ElevatedButton(
                style: ButtonStyle(
                    maximumSize:
                        MaterialStateProperty.all<Size>(Size(100.w, 8.h)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(70.w, 7.h)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 129, 195, 224)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: Text('Juegos',
                    style: TextStyle(
                      color: Colors.white, //negrita
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    )),
              ),
              SizedBox(height: 5.h),
              //tricount
              ElevatedButton(
                style: ButtonStyle(
                    maximumSize:
                        MaterialStateProperty.all<Size>(Size(100.w, 8.h)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(70.w, 7.h)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 129, 195, 224)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ))),
                onPressed: () {
                  /*  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ´´´´´´´´()),
                  );*/
                },
                child: Text('Tricount',
                    style: TextStyle(
                      color: Colors.white, //negrita
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    )),
              ),
              SizedBox(height: 5.h),
              //Lista tareas
              ElevatedButton(
                style: ButtonStyle(
                    maximumSize:
                        MaterialStateProperty.all<Size>(Size(100.w, 8.h)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(70.w, 7.h)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 129, 195, 224)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserLogIn()),
                  );
                },
                child: Text('Lista tareas',
                    style: TextStyle(
                      color: Colors.white, //negrita
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    )),
              ),
              SizedBox(height: 5.h),
              //GPS Grupo
              ElevatedButton(
                style: ButtonStyle(
                    maximumSize:
                        MaterialStateProperty.all<Size>(Size(100.w, 8.h)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(70.w, 7.h)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 129, 195, 224)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserRegister()),
                  );
                },
                child: Text('GPS Grupo',
                    style: TextStyle(
                      color: Colors.white, //negrita
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
