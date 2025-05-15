import 'package:flutter/material.dart';
import 'message_model.dart';


class MessageBubble extends StatelessWidget {
  final Message message;
  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // Simulación: Si el ID termina en 1 es universitario, sino escolar
    final isUniversity = message.senderId.endsWith('1');

    return Align(
      alignment: isUniversity ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isUniversity 
              ? const Color.fromARGB(255, 12, 17, 70).withOpacity(0.8) // Azul oscuro para universitarios
              : const Color(0xFF534BAE).withOpacity(0.8), // Azul claro para escolares
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ícono según tipo de usuario
            Icon(
              isUniversity ? Icons.school : Icons.person,
              color: const Color.fromARGB(255, 252, 228, 228),
              size: 16,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre del remitente
                  Text(
                    message.senderName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Contenido del mensaje
                  Text(
                    message.text,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Hora del mensaje
            Text(
              '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}