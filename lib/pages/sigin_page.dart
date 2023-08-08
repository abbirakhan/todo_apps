import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:todo_apps/pages/login_page.dart';
import 'package:todo_apps/pages/post_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
        backgroundColor: Color.fromARGB(255, 177, 167, 167),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color.fromARGB(255, 109, 7, 55),
        title: Text(
          'Sig up',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 270.h),
                      SizedBox(
                        height: 50,
                        width: 350.w,
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your email";
                            } else if (!value.contains("@")) {
                              return "please used @ in email ";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color(0xff5E5B5B),
                            ),
                            hintText: "Enter your email ",
                            hintStyle: TextStyle(
                              fontSize: 15.sp,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff5E5B5B),
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                )),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 109, 7, 55),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 50,
                        width: 350.w,
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your password";
                            } else if (value.length < 7) {
                              return "Password must be greater than 7";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xff5E5B5B),
                            ),
                            hintText: "Enter your password",
                            hintStyle: TextStyle(
                              fontSize: 15.sp,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff5E5B5B),
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                )),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 109, 7, 55),
                                )),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 130.w,
                          ),
                          Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => const LoginScreen()));
                              },
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => const LoginScreen()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Color(0xff5E5B5B),
                                    fontSize: 16.sp,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  )),
              SizedBox(height: 30.h),
              SizedBox(
                height: 55.h,
                width: 300.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Color.fromARGB(255, 109, 7, 55),
                        elevation: 4,
                        shadowColor: Colors.grey),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const PostPage()));
                    },
                    child: const Text("Sigin",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
