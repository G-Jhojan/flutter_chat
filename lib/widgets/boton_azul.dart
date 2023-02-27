import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String texto;
  final Function() onPressed;

  const BotonAzul({
    super.key, 
    required this.texto, 
    required this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const StadiumBorder(),
          backgroundColor: Colors.blue),

      onPressed: onPressed,

      child: Container(
        height: 55,
        width: double.infinity,
        child: Center(
          child: Text(
            texto,
            style:  const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      )
    );
  }
}
