import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_repository.dart';
import 'chat_screen.dart';
import 'chat_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ChatRepository(), // Provee el repositorio
      child:  MaterialApp(
        home: ChatListScreen(),
      ),
      // Removed invalid key assignment
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillNet Chat',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(), // Usa google_fonts
      ),
      home: const ChatScreen(groupId: 'grupo-prueba-123'), // Tu pantalla de chat
    );
  }
}