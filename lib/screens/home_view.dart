import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CollectionReference todos = FirebaseFirestore.instance.collection('todos');
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  TextEditingController txtController = TextEditingController();
  bool isEdit = false;
  String docId = '';

  addTodos() async {
    await todos.add({
      "title": txtController.text,
      "time": DateTime.now(),
    });
    // await todos.doc('ImnxbAy7YifsJCUum2et').set({
    //   "title": "Hello 3",
    //   "time": DateTime.now(),
    // });
    txtController.clear();
    // setState(() {});
  }

  updateTodo() async {
    await todos.doc(docId).update({
      "title": txtController.text,
      "time": DateTime.now(),
    });
    txtController.clear();
  }

  deleteTodo(docId) async {
    await todos
        .doc(docId)
        .delete()
        .then((value) => print("Todo Deleted"))
        .catchError(
          (error) => print("Failed to delete todo: $error"),
        );
  }

  Stream<QuerySnapshot> getTodos() {
    return todos.snapshots();
  }

  // registerUser() async {
  //   try {
  //       await firebaseAuth.createUserWithEmailAndPassword()
  //       .then((value) {
  //          print("User Added successfully");
  //         await users.doc(value.uid).set({});
  //       })
  //       .catchError(
  //         (error) => print("Failed to delete todo: $error"),
  //       );
  //   } catch (e) {}
  // }

  // createOrFoundChatRoom(){

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: txtController,
          decoration: const InputDecoration(
            hintText: "Enter something....",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              isEdit ? await updateTodo() : await addTodos();
            },
            icon: const Icon(Icons.add_task),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getTodos(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "${snapshot.data!.docs[index]['title']}",
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      isEdit = true;
                      txtController.text = snapshot.data!.docs[index]['title'];
                      docId = snapshot.data!.docs[index].id;
                    },
                    icon: const Icon(Icons.task_alt),
                  ),
                );
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
