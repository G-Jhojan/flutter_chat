import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({
    super.key, 
    required this.titulo
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: 170,
      child: Column(
        children:  [
          const Image(image: AssetImage('assets/logo/tag-logo.png')),
          const SizedBox(
            height: 20,
          ),
          Text(
            titulo,
            style: const TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}
