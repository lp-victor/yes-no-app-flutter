import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yesno_answer.dart';

import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getBobLaughing = GetYesNoAnswer();

  List<Message> messages = [
     Message(text: 'Hi Bob!', fromWho: FromWho.me),
     Message(text: 'Fix this', fromWho: FromWho.me)   
  ];

  Future<void> sendMessage ( String text ) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

    if ( text.endsWith('?')) {
      otherReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }
  
  Future<void> otherReply() async {
    final otherMessage = await getBobLaughing.getAnswer();
    messages.add(otherMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut);
  }
}