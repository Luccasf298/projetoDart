// ignore_for_file: prefer_const_constructors

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/widgets.dart";
import "package:flutterdart10/pages/forgot_password.dart";
import "package:flutterdart10/pages/register_pages.dart";

import "../components/square_tile.dart";

import '../components/login_button.dart';
import "package:flutter/material.dart";
import "package:flutterdart10/components/my_test_field.dart";

import "shop_page.dart";

class LoginPages extends StatefulWidget {
  LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context as BuildContext);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ShopPage()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context as BuildContext);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(message));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Login"),
            backgroundColor: Colors.transparent,
            elevation: 0),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),

              //logo
              Icon(Icons.lock, size: 100),

              SizedBox(height: 50),

              Text("que bom te ver de volta!!",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16)),
              SizedBox(height: 25),

              //campo de usuario
              MyTextField(
                  controller: emailController,
                  hintText: "E-mail",
                  obscureText: false),
              const SizedBox(height: 10),

              //campo de senha
              MyTextField(
                  controller: passwordController,
                  hintText: "Senha",
                  obscureText: true),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgotPasswordPage();
                          }));
                        },
                        child: Text("esqueceu a senha?",
                            style: TextStyle(color: Colors.grey.shade600)))
                  ],
                ),
              ),
              const SizedBox(height: 25),
              //botao login
              LoginButton(onTap: signUserIn, text: "Entrar"),
              const SizedBox(height: 25),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("ou",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary)),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                    ],
                  )),
              const SizedBox(height: 25),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Squaretile(imagePath: "/google.png", onTap: () {}),
                SizedBox(width: 25),
                Squaretile(imagePath: "/apple.png", onTap: () {})
              ]),
              const SizedBox(height: 50),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("ainda não possui uma conta?",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary)),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()
                                  )
                                );
                        },
                        child: Text(
                          "registre-se",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ))));
  }
}
