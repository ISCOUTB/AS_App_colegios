import 'package:a/Vistas/colores/colores.dart';

import 'package:a/Vistas/navegacion/Configuracion.dart';
import 'package:a/Vistas/Inicio.dart';
import 'package:a/screens/Iniciop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Start(pageController: PageController()));

class Start extends StatelessWidget {
  final PageController pageController;

  const Start({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Positioned(
              top: 35, // Ajusta la posición vertical
              left: 0, // Ajusta la posición horizontal
              right: 0, // Asegura que ocupe todo el ancho
              child: Center(
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 70)),
                    Positioned(child: Row(
                      children: [Image.asset(
                      "assets/Logo.png",
                      width: 70,
                    ),
                    Text(
                      "SkillNet",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    )],
                    ))
                    
                  ],
                ),
              ),
            ),
            Positioned(
              top: 120, // Ajusta la posición vertical del Row
              left: 20, // Ajusta la posición horizontal
              right: 20, // Asegura que ocupe todo el ancho
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_circle,
                    color: AppColors.primaryDark,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "[Student Name]",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDark,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      SizedBox(),
                      Text(
                        "[ROL]",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.primaryDark,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      )
                    ],
                  ),
                  Spacer(), // Empuja el icono hacia la derecha
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.background,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Principal())); // Regresar a la pantalla anterior
                    },
                    child: Icon(
                      Icons.logout,
                      color: AppColors.primaryDark,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 170, // Ajusta la posición vertical del Row
              left: 20,
              right: 20, // Ajusta la posición horizontal
              child: Column(
                children: [
                  Text(
                    "Student Information",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.Grey,
                        border: Border.all(
                          color: AppColors.black,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2, // Ocupa 2/3 del espacio
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[400], // Color gris
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ), // Bordes redondeados solo en la parte superior
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.mail,
                                    color: AppColors.primaryDark,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "[News]",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.primaryDark,
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // Botón de Foros
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        pageController.jumpToPage(1); // Cambia al índice de la página de Foros
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryDark,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(100, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.forum,
                            color: AppColors.white,
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Foros",
                            style: TextStyle(
                              fontSize: 19,
                              color: AppColors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Botón de Configuración
                  SizedBox(
                    width: 250, // Ancho máximo del botón
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryDark,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 80), // Altura mínima del botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // Ajusta el tamaño del botón al contenido
                        children: [
                          Icon(
                            Icons.settings,
                            color: AppColors.white,
                            size: 28,
                          ),
                          SizedBox(width: 10), // Espaciado entre el ícono y el texto
                          Text(
                            "Configuración",
                            style: TextStyle(
                              fontSize: 19,
                              color: AppColors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}