import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_killer/main.dart';
import 'package:proyecto_killer/domain/entities/user.dart';
import 'package:proyecto_killer/ui/user_register/widgets/button_register.dart';
import 'package:sizer/sizer.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  List<User> users = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final textControllerId = TextEditingController();
  final textControllerNombre = TextEditingController();
  final textControllerCorreo = TextEditingController();
  final textControllerContrasena = TextEditingController();

  ImageProvider _imageFile = const AssetImage('assets/images/avatar.jpg');

  _openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      try {
        _imageFile = FileImage(File(pickedFile!.path));
      } catch (e) {
        _imageFile = const AssetImage('assets/images/avatar.jpg');
      }
    });
  }

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
                //Foto
                SizedBox(height: 3.h),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _imageFile,
                ),
                ElevatedButton(
                  onPressed: () {
                    _openGallery(context);
                  },
                  child: const Text('Seleccionar foto'),
                ),
                SizedBox(height: 2.h),
                //nombre
                TextFormField(
                  controller: textControllerNombre,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                  ),
                  validator: (value) {
                    if (!GlobalData.of(context).desarrollador &&
                        (value == null || value.isEmpty)) {
                      return 'Este campo es obligatorio';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                //Correo
                TextFormField(
                  controller: textControllerCorreo,
                  decoration: const InputDecoration(
                    labelText: 'Correo',
                  ),
                  validator: (value) {
                    if (!GlobalData.of(context).desarrollador &&
                        (value == null || value.isEmpty)) {
                      return 'Este campo es obligatorio';
                    }
                    if (!GlobalData.of(context).desarrollador &&
                        (!RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            .hasMatch(value!))) {
                      return 'Ingrese un correo válido';
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
                      return 'La contraseña debe tener al menos 8 caracteres';
                    }
                    if (!GlobalData.of(context).desarrollador &&
                        (!RegExp(r'(?=.*[a-zA-Z])(?=.*\d)').hasMatch(value!))) {
                      return 'La contraseña debe contener al menos una letra y un número';
                    }
                    return null;
                  },
                  obscureText: viewPassword,
                ),

                SizedBox(height: 2.h),
                //telefono (opcional)
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Teléfono (opcional)',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Ingrese un número de teléfono válido';
                      }
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                //edad (opcional)
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Edad (opcional)',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Ingrese una edad válida';
                      }
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                //genero (opcional)
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Género (opcional)',
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                        return 'Ingrese un género válido';
                      }
                    }
                    return null;
                  },
                ),

                //Confirmar
                SizedBox(height: 5.h),
                buttonRegiser(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
