import 'package:flutter/material.dart';
import 'package:flutter_test_app/const/cach_helper/cach_helper.dart';
import 'package:flutter_test_app/const/component/constabt.dart';
import 'package:flutter_test_app/screens/chat_app/chat_home_screen/chat_home_screen.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isVisible = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/login.json', width: 150, height: 180),
              Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: userNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field must not be empty";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text("User Name"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: !isVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field must not be empty";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(!isVisible
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    label: Text("Password"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          CachHelper.setData(key: "name", value: userNameController.text).then((value) {
                            AppConstant.navigateTo(context, ChatHomeScreen());
                          });
                        }
                      },
                      child: Text("Login")))
            ],
          ),
        ),
      ),
    );
  }
}
