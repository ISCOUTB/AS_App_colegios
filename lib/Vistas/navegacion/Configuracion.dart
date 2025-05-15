import 'package:a/Vistas/colores/colores.dart';
import 'package:a/Vistas/navegacion/Barranavegacion.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
          
            height: MediaQuery.of(context).size.height * 0.55, // 40% de la pantalla
            color: AppColors.primaryDark, // Fondo oscuro
            child: Center(
              child: Text(
                "PHOTO",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          // Parte inferior (campos y decoraciones)
          Expanded(
            child: Container(
              color: Colors.amber[50], // Fondo beige
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Campos de texto
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTextField("NAME"),
                        _buildTextField("ROL"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTextField("LASTNAME"),
                        _buildTextField("GMAIL"),
                      ],
                    ),
                    SizedBox(height: 10),
                    _buildTextField("AGE"),
                    SizedBox(height: 1),
                    // Decoraciones (líneas de diamantes)
                    Spacer(),
                    // Botones inferiores
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> BNavegacion())); // Regresar a la pantalla anterior
                          },
                          backgroundColor: AppColors.background,
                          shape: CircleBorder(
                            side: BorderSide(
                              color: AppColors.primaryDark,
                              width: 2,
                            ),
                          ),
                          child: Icon(Icons.arrow_back, color: AppColors.black),
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: AppColors.background,
                          shape: CircleBorder(
                            side: BorderSide(
                              color: AppColors.primaryDark,
                              width: 2,
                            ),
                          ),
                          child: Icon(Icons.save, color: AppColors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir un campo de texto
  Widget _buildTextField(String label) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo[900]!),
          ),
        ),
      ),
    );
  }
}