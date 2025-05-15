import 'package:a/Vistas/colores/colores.dart';
import 'package:a/Vistas/InformacionForos.dart';
import 'package:flutter/material.dart';

class Myforo extends StatefulWidget {
  const Myforo({super.key});

  @override
  State<Myforo> createState() => _MyforoState();
}

class _MyforoState extends State<Myforo> {
  final List<Map<String, String>> allForums = const [
    {'title': 'Flutter Avanzado', 'status': 'EN CURSO'},
    {'title': 'Diseño UX Intermedio', 'status': 'EN CURSO'},
    {'title': 'Comunicación Efectiva', 'status': 'EN CURSO'},
    {'title': 'Scrum para Equipos', 'status': 'EN CURSO'},
    {'title': 'Backend con Dart', 'status': 'EN CURSO'},
    {'title': 'Reactivo en Flutter', 'status': 'EN CURSO'},
    {'title': 'Firebase Avanzado', 'status': 'EN CURSO'},
    {'title': 'Liderazgo Técnico', 'status': 'EN CURSO'},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> filteredForums = allForums
        .where((forum) =>
            forum['title']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5EEDC),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  Text(
                    'SkillNet',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Mis Foros',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) => setState(() => searchQuery = value),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Buscar foros...',
                  hintStyle: const TextStyle(color: Colors.white70),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: AppColors.primaryDark,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(40),
                child: filteredForums.isEmpty
                    ? const Center(
                        child: Text(
                          'No se encontraron foros.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredForums.length,
                        itemBuilder: (context, index) {
                          final forum = filteredForums[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 400),
                                    pageBuilder: (_, __, ___) =>
                                        Foro(
                                      forumTitle: forum['title']!,
                                      forumDescription:
                                          'Este es un foro en curso sobre ${forum['title']!}.',
                                      fromMyForums: true,
                                    ),
                                    transitionsBuilder:
                                        (_, animation, __, child) {
                                      final offsetAnimation = Tween<Offset>(
                                        begin: const Offset(1.0, 0.0),
                                        end: Offset.zero,
                                      ).animate(CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeInOut,
                                      ));
                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryDark,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white24),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Icon(Icons.forum,
                                        size: 35,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              forum['title']!,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              forum['status']!,
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(Icons.check_circle_outline,
                                          color: Colors.white),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
