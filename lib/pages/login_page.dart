import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_apps/pages/post_page.dart';

import 'package:todo_apps/pages/sigin_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool pObsured = true;
  bool password = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 177, 167, 167),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 109, 7, 55),
          title: Center(child: Text('Login', style: TextStyle(
              color: Colors.white,
            ),)),
          automaticallyImplyLeading: false,
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
                              hintText: "Enter your email address",
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
                            // decoration: InputDecoration(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xff5E5B5B),
                              ),
                              hintText: "Enter your  password",
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
                              width: 100.w,
                            ),
                            Text(
                              "Donot have an account?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const SignUpScreen()));
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const SignUpScreen()));
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.white,
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => const PostPage()));
                      },
                      child: const Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
