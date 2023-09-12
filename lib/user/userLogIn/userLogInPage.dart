import 'package:flutter/material.dart';
import 'package:proyecto_killer/main.dart';
import 'package:proyecto_killer/menu/menuPage.dart';
import 'package:proyecto_killer/user/userRegister/userRegisterPage.dart';
import 'package:sizer/sizer.dart';

class UserLogIn extends StatefulWidget {
  const UserLogIn({super.key});

  @override
  State<UserLogIn> createState() => _UserLogInState();
}

class _UserLogInState extends State<UserLogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final textControllerUsuario = TextEditingController();
  final textControllerContrasena = TextEditingController();

  bool viewPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                //nombre de usuario (o correo electronico)
                TextFormField(
                  controller: textControllerUsuario,
                  decoration: const InputDecoration(
                      labelText: 'nombre de usuario (o correo electronico)'),
                  validator: (value) {
                    if (!GlobalData.of(context).desarrollador &&
                        (value == null || value.isEmpty)) {
                      return 'Este campo es obligatorio';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                //Contraseña
                TextFormField(
                  controller: textControllerContrasena,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          viewPassword = !viewPassword;
                        });
                      },
                      icon: Icon(viewPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  validator: (value) {
                    if (!GlobalData.of(context).desarrollador &&
                        (value == null || value.isEmpty)) {
                      return 'Este campo es obligatorio';
                    }
                    //comprobar si existe en la base de datos el usuario y ver si coincide con su contraseña

                    if (!GlobalData.of(context).desarrollador &&
                        (value!.length < 8)) {
                      return 'Contraseña no valida';
                    }

                    return null;
                  },
                  obscureText: viewPassword,
                ),

                SizedBox(height: 5.h),

                //Confirmar
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
                    if (_formKey.currentState!.validate()) {
                      //saltar a login page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuPage()),
                      );
                      print('pruebas: login');
                    }
                  },
                  child: Text('iniciar sesion',
                      style: TextStyle(
                        color: Colors.white, //negrita
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      )),
                ),
                SizedBox(height: 5.h),
                //Registrarse
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
                  child: Text('Registrarse',
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
      ),
    );
  }
}
