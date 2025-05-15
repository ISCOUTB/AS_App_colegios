import 'package:a/Vistas/colores/colores.dart';
import 'package:flutter/material.dart';
import 'package:a/Vistas/Start.dart';
import 'package:a/Vistas/Foros.dart';
import 'package:a/Vistas/Myforos.dart';

class BNavegacion extends StatefulWidget {
  const BNavegacion({Key? key}) : super(key: key);

  @override
  State<BNavegacion> createState() => _BNavegacionState();
}

class _BNavegacionState extends State<BNavegacion> {
  final PageController _pageController = PageController();
  int pagina = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        onPageChanged: (int i) {
          setState(() {
            pagina = i;
          });
        },
        children: [
          Start(pageController: _pageController), // Pasa el controlador aquí
          const Foros(),
          const Myforo(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60, // Altura para centrar los íconos
        margin: const EdgeInsets.all(20), // Espacio alrededor para diseño redondeado
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(50),
        ),
        child: BottomNavigationBar(
          currentIndex: pagina,
          onTap: (int i) {
            setState(() {
              pagina = i; // Cambia el índice del BottomNavigationBar
            });
            _pageController.jumpToPage(i); // Cambia la página del PageView
          },
          selectedItemColor: AppColors.background, // Color del ítem seleccionado
          unselectedItemColor: AppColors.Grey, // Color de los ítems no seleccionados
          backgroundColor: Colors.transparent, // Fondo transparente
          elevation: 0, // Sin sombra
          items: const [     
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25),
              label: "Inicio",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.forum, size: 25),
              label: "Foros",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_numbered_rtl_rounded, size: 25),
              label: "Mis Foros",
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // Libera el controlador
    super.dispose();
  }
}
