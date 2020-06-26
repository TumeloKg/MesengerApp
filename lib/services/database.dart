import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_app/views/chatRoomScreen.dart';

class DatabaseMethods {
  getUserByUsername(String username) async {
    return await Firestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();
  }

  getUserByUserEmail(String userEmail) async {
    return await Firestore.instance
        .collection("users")
        .where("email", isEqualTo: userEmail)
        .getDocuments();
  }

  uploadUserInfo(userMap) {
    Firestore.instance.collection("users").add(userMap);
  }

  createChatroom(String chatroomid, chatRoomMap) {
    Firestore.instance
        .collection("Chatroom")
        .document(chatroomid)
        .setData(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
