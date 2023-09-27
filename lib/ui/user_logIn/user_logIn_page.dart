import 'package:flutter/material.dart';
import 'package:proyecto_killer/main.dart';
import 'package:proyecto_killer/ui/user_logIn/widgets/text_register.dart';
import 'package:proyecto_killer/ui/user_logIn/widgets/button_login.dart';
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
        minimum: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Form(
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

                      if (!GlobalData.of(context).desarrollador &&
                          (value!.length < 8)) {
                        return 'Contraseña no valida';
                      }

                      return null;
                    },
                    obscureText: viewPassword,
                  ),
                  //Confirmar
                  SizedBox(height: 5.h),
                  buttonLogIn(context),
                  //Registrarse
                  textRegister(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
