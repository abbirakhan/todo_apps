import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_apps/utilis/collection.dart';

class PostSavePage extends StatelessWidget {
  PostSavePage({super.key, required Future<void> Function() initData});
  final postController = TextEditingController();
  String id = Timestamp.now().millisecondsSinceEpoch.toString();

  Future<void> saveData(BuildContext context) async {
    final dataMap = {
      "id": id,
      "msg": postController.text.trim(),
    };
    await Collection.posts.doc(id).set(dataMap);
    var snackBar =
        const SnackBar(content: Text('your message is sucessfully addded'));
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: Color.fromARGB(255, 177, 167, 167),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Write it down, listen better",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 200),
                SizedBox(
                  width: 350,
                  height: 100,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Enter your message here!",
                      hintStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 131, 129, 129),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 109, 7, 55),
                          )),
                    ),
                    controller: postController,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Color.fromARGB(255, 109, 7, 55),
                          elevation: 4,
                          shadowColor: Colors.grey),
                      onPressed: () {
                        saveData(context);
                      },
                      child: const Text("Save",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
