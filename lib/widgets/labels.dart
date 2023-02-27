import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String texto;
  final String textoDescripcion;

  const Labels({
    super.key, 
    required this.ruta, 
    required this.texto, 
     required this.textoDescripcion
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
           Text(textoDescripcion,
              style: const TextStyle(
                  color: Colors.black45, 
                  fontWeight: FontWeight.w300
                  )
                ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Text(
              texto,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, ruta);
            },
          )
        ],
      ),
    );
  }
}
