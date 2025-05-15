import 'dart:async';
import 'package:flutter/material.dart';
import 'message_model.dart';

class ChatRepository with ChangeNotifier {
  final Map<String, List<Message>> _groupMessages = {}; // Mensajes por grupo
  final StreamController<Map<String, List<Message>>> _streamController = 
      StreamController<Map<String, List<Message>>>.broadcast();

  ChatRepository() {
    loadMockMessages();
  }

  // Obtener mensajes de un grupo específico
  Stream<List<Message>> getMessages(String groupId) {
    return _streamController.stream.map((messagesMap) => messagesMap[groupId] ?? []);
  }

  // Enviar mensaje a un grupo específico
  Future<void> sendMessage(String groupId, String text) async {
    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'user1',
      senderName: 'Usuario Prueba',
      text: text,
      timestamp: DateTime.now(),
    );

    _groupMessages.putIfAbsent(groupId, () => []).insert(0, newMessage);
    _notifyStream();
  }

  // Cargar datos iniciales para grupos de prueba
  void loadMockMessages() {
    _groupMessages['matematicas123'] = [
      Message(
        id: '1',
        senderId: 'user2',
        senderName: 'Ana',
        text: '¿Alguien resolvió el problema 5?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      Message(
        id: '2',
        senderId: 'user3',
        senderName: 'Carlos',
        text: 'Yo necesito ayuda con el 7',
        timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      ),
    ];

    _groupMessages['literatura456'] = [
      Message(
        id: '3',
        senderId: 'user4',
        senderName: 'María',
        text: '¿Han leído el último capítulo?',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      ),
    ];

    _notifyStream();
  }

  // Notificar a los listeners
  void _notifyStream() {
    _streamController.add(_groupMessages);
    notifyListeners();
  }

  @override
  void dispose() {
    _streamController.close(); // Importante para evitar memory leaks
    super.dispose();
  }
}