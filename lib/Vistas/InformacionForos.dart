import 'package:a/chat/chat_list_screen.dart';
import 'package:a/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class Foro extends StatelessWidget {
  final String forumTitle;
  final String forumDescription;
  final bool fromMyForums;

  const Foro({
    super.key,
    required this.forumTitle,
    required this.forumDescription,
    required this.fromMyForums,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EEDC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Botón de regresar
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF1D1B4E)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 8),

              // Título
              Center(
                child: Text(
                  forumTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D1B4E),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Imagen simulada
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFE2C6),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 48, color: Color(0xFF1D1B4E)),
                ),
              ),

              const SizedBox(height: 16),

              // Subtítulo
              const Text(
                "ACERCA DEL FORO",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF1D1B4E),
                ),
              ),

              const SizedBox(height: 8),

              // Descripción del foro
              Text(
                forumDescription,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),

              const Spacer(),

              // Botones en la parte inferior
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Botón Recompensas
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF1D1B4E)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    child: const Icon(
                      Icons.card_giftcard,
                      color: Color(0xFF1D1B4E),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  // Botón Unirse / Continuar
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatListScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D1B4E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    child: Icon(
                      fromMyForums ? Icons.play_arrow : Icons.send,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
