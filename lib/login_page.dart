import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_management/home_page.dart';
import 'mathematics_course.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required String title}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 20,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30, top: 30),
                    color: Colors.grey,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const HomePage(title: "Home Page")
                                )
                            );
                          },
                          icon: const Icon(Icons.computer_rounded),
                          iconSize: 50,
                        ),
                        Text(
                          'Learning Management Software',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 50,
                            left: 30),
                        child: Text(
                          "Login",

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoMono',
                            fontSize: 40,
                          ),
                        ),

                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 30, top: 30),
                        child: RichText(
                            text: TextSpan(
                              text: "Email Address",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' * ',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ))
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 30, top: 30),
                        child: RichText(
                            text: TextSpan(
                              text: "Password",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' * ',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ))
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 30,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.indigo,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      onPressed: () {

                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                            .then((value){
                              print("Successfully login!");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  MathematicsCourse(title: "Mathmetics Course")
                                  ));

                        }
                        ).catchError((error){
                          print("Failed to Login");
                          print(error.toString());
                        }
                        );
                      },
                      child: Text(
                        'Login',
                      ),
                    ),
                  ),

                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: const Text('Lost your passoword?'),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  Align buildText(String fieldName) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 30, top: 30),
        child: RichText(
            text: TextSpan(
              text: fieldName,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              children: <TextSpan>[
                TextSpan(
                    text: ' * ',
                    style: TextStyle(
                      color: Colors.red,
                    ))
              ],
            )),
      ),
    );
  }

  Padding buildTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 10),
        child: getTextField(),
      ),
    );
  }

  TextField getTextField() {
    bool _validate = false;
    return const TextField(

      decoration: InputDecoration(
        fillColor: Colors.white,
        border: OutlineInputBorder(),
      ),
    );
  }
}