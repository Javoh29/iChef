import 'package:flutter/material.dart';

import '../../../config/constants/local_data.dart';
import '../../widgets/bottom_textfield_widget.dart';
import '../../widgets/chat_comment_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // RecipeModel model =
  //     RecipeModel(recipeSteps: recipeSteps, userComment: userComments2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              ...userComments.map(
                (userComment) {
                  return ChatCommentWidget(
                    userName: userComment["userName"],
                    userImage: userComment["userImage"],
                    lastSeen: userComment["lastSeen"],
                    time: userComment["time"],
                    chatText: userComment["chatText"],
                    isOwner: userComment["isOwner"],
                  );
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
          const BottomTextFiledWidget(),
        ],
      ),
    );
  }
}
