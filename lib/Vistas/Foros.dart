import 'package:a/Vistas/colores/colores.dart';
import 'package:a/Vistas/InformacionForos.dart';
import 'package:flutter/material.dart';

class Foros extends StatefulWidget {
  const Foros({super.key});

  @override
  State<Foros> createState() => _ForosState();
}

class _ForosState extends State<Foros> {
  final List<Map<String, String>> availableForums = const [
    {'title': 'Flutter Avanzado', 'status': 'ABIERTO'},
    {'title': 'Diseño UX Intermedio', 'status': 'ABIERTO'},
    {'title': 'Liderazgo Creativo', 'status': 'ABIERTO'},
    {'title': 'Innovación Estratégica', 'status': 'ABIERTO'},
    {'title': 'Comunicación Efectiva', 'status': 'ABIERTO'},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredForums = availableForums
        .where((forum) =>
            forum['title']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5EEDC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Stack(     
                children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 120)),
                      Image.asset(
                        'assets/Logo.png',
                        height: 50,
                      ),
                      const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'SkillNet',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                    ],
                  ) 
                ], 
              ),
            ),
           
            SizedBox(height: 16),
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
             Column(
              children: [
                Text(
                    'Foros Disponibles',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: AppColors.primaryDark,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(30),
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
                                          'Este es un foro disponible sobre ${forum['title']!}.',
                                      fromMyForums: false,
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
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AppColors.black),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColors.black,
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
                                      const _ForumIcon(),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: _ForumDetails(
                                          title: forum['title']!,
                                          status: forum['status']!,
                                        ),
                                      ),
                                      const Icon(Icons.arrow_forward_ios,
                                          color: Colors.white, size: 16),
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

class _ForumIcon extends StatelessWidget {
  const _ForumIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.Grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.forum,
      size: 40, color: AppColors.black),
    );
  }
}

class _ForumDetails extends StatelessWidget {
  final String title;
  final String status;

  const _ForumDetails({
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          status,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
