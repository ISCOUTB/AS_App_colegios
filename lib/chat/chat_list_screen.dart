import 'package:flutter/material.dart';

import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final chatRepo = Provider.of<ChatRepository>(context); // Removed as it is unused

    // Lista de grupos/chats disponibles (puedes cargarlos desde Firebase después)
    final List<Map<String, String>> groups = [
      {"id": "matematicas123", "name": "Grupo de Matemáticas", "lastMessage": "Ana: ¿Alguien resolvió el problema 5?"},
      {"id": "literatura456", "name": "Club de Literatura", "lastMessage": "Carlos: Hoy discutiremos Poe"},
      {"id": "ciencias789", "name": "Taller de Ciencias", "lastMessage": "Profesor: Traigan sus proyectos"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Chats',style:TextStyle(color: Color.fromARGB(255, 246, 233, 216)) ,),
        backgroundColor: const Color(0xFF0C0734),
      ),
      backgroundColor: const Color.fromARGB(255, 246, 233, 216),
      body: ListView.builder(
        
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF534BAE),
              child: Text(
                groups[index]['name']!.substring(0, 1),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              groups[index]['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(groups[index]['lastMessage']!),
            trailing: const Text("12:30 PM", style: TextStyle(color: Colors.grey)),
            onTap: () {
              // Navegar al chat específico
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(groupId: groups[index]['id']!),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Para crear nuevos grupos
        backgroundColor: const Color(0xFF0C0734),
        child: const Icon(Icons.add, color: Color.fromARGB(255, 246, 233, 216)),
      ),
    );
  }
}