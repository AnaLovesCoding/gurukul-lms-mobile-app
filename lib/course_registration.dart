import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learning_management/mathematics_course.dart';
import 'package:learning_management/test_page.dart';
import 'home_page.dart';

class CourseRegistration extends StatefulWidget {
  const CourseRegistration({Key? key, required String title})
      : super(key: key);

  @override
  State<CourseRegistration> createState() => _CourseRegistrationState();
}

class _CourseRegistrationState extends State<CourseRegistration> {

  final List<TextEditingController> _controllers = [];
  final List<String> info = <String>['Email', 'Confirm Email'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 15,
          child: Container(
            margin: EdgeInsets.only(bottom: 30),
            color: Colors.grey,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TestPage(title: "Home Page")));
                      },
                      icon: const Icon(Icons.computer_rounded),
                      iconSize: 50,
                    ),
                    Text(
                      'Learning Management Software',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            color: Colors.grey[200],
            width: 500,
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Purchase",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: RichText(
                            text: TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('login clicked');
                                },
                              text: ' Click here to login',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 65,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.grey[200],
                width: 500,
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                        child: Text(
                          "Billing Information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            )),
      ],
    ));
  }
}
