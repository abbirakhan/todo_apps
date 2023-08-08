import 'package:flutter/material.dart';
import 'package:todo_apps/utilis/helper.dart';

import '../utilis/collection.dart';

class PostEditPage extends StatelessWidget {
  PostEditPage({super.key, required this.postMap, required this.initData});
  final Function initData;
  final Map<String, dynamic> postMap;
  final _kwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: Color.fromARGB(255, 177, 167, 167),
      appBar: AppBar(
        
        backgroundColor: Color.fromARGB(255, 109, 7, 55),
        title: const Text(
          'Edit Post',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
         automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter your message here!",
                hintStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 131, 129, 129),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                      color: Colors.white,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 109, 7, 55),
                    )),
              ),
              controller: _kwController..text = postMap['msg'],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Color.fromARGB(255, 109, 7, 55),
                    elevation: 4,
                    shadowColor: Colors.grey),
                onPressed: () {
                  updatePost(context, postMap['id']);
                },
                child: const Text('Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updatePost(BuildContext context, String id) {
    Collection.posts.doc(id).set({
      'id': id,
      'msg': _kwController.text.trim(),
    }).whenComplete(() {
      Helper.showMessage(
          context, 'Post ${_kwController.text} successfully updated');
      _kwController.clear();
      initData();
    });
  }
}
