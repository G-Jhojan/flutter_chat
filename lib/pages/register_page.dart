import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/widgets/boton_azul.dart';
import 'package:flutter_ecommerce/widgets/custom_input.dart';
import 'package:flutter_ecommerce/widgets/labels.dart';
import 'package:flutter_ecommerce/widgets/logo.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Logo(titulo: 'REGISTRATE',), 
                  _Form(), 
                  const Labels(
                    ruta: 'login',
                    texto: 'Inicia Sesión',
                    textoDescripcion: '¿Tienes cuenta?'
                    ), 
                 
                  ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
               CustomInput(
              icon: Icons.person_rounded,
              placeholder: 'Nombre',
              keyboardType: TextInputType.text,
              textController: nameCtrl,
              isPassword: false,
            ),

              CustomInput(
              icon: Icons.person_pin,
              placeholder: 'Apellido',
              keyboardType: TextInputType.text,
              textController: lastNameCtrl,
              isPassword: false,
            ),

              CustomInput(
              icon: Icons.mail_outlined,
              placeholder: 'Correo',
              keyboardType: TextInputType.emailAddress,
              textController: emailCtrl,
              isPassword: false,
            ),
            
            CustomInput(
              icon: Icons.lock_outline,
              placeholder: 'Contraseña',
              isPassword: true,
              textController: passCtrl,
            ),
            BotonAzul(
              texto: 'Registrarme',
              onPressed: () {
                print(emailCtrl.text);
                print(passCtrl.text);
              },
            )
          ],
        ));
  }
}
