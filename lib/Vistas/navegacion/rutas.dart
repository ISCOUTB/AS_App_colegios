
import 'package:a/Vistas/Foros.dart';
import 'package:a/Vistas/Myforos.dart';
import 'package:flutter/material.dart';

class Rutas extends StatelessWidget {
  final int index;
  const Rutas({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> vistas = [
      const Foros(),
      const Myforo(),
      const Myforo(),
    ];
    return vistas[index];
  }
}