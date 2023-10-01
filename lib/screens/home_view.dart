import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CollectionReference todos = FirebaseFirestore.instance.collection('todos');
  TextEditingController txtController = TextEditingController();

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

  Stream<QuerySnapshot> getTodos() {
    return todos.snapshots();
  }

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
              await addTodos();
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
                return Text(
                  "${snapshot.data!.docs[index]['title']}",
                  style: const TextStyle(
                    fontSize: 30,
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
