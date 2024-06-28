import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/answer_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/359fe050-3abb-4764-b470-33c7883ce044/de8a3k1-2faf1efc-9a8d-49ff-8789-ebfb9467a262.png/v1/fill/w_274,h_470,strp/bob_the_builder_os__png__by_agustinsepulvedave_de8a3k1-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NDcwIiwicGF0aCI6IlwvZlwvMzU5ZmUwNTAtM2FiYi00NzY0LWI0NzAtMzNjNzg4M2NlMDQ0XC9kZThhM2sxLTJmYWYxZWZjLTlhOGQtNDlmZi04Nzg5LWViZmI5NDY3YTI2Mi5wbmciLCJ3aWR0aCI6Ijw9Mjc0In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.yWKvrIVQihDXZ18mh54L5s8hD1P8G-lt-zLEek0H5o8'),
          ),
        ),
        title: const Text('Bob the Builder'),
      ),
      body: _ChatView(),
    );
  }
}

// Widget del chat
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                final message = chatProvider.messages[index];

                return (message.fromWho == FromWho.other)
                    ? AnswerMessageBubble( message: message )
                    : MyMessageBubble(message: message);
              },
            )),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
