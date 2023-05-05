import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_management/lesson_player_page.dart';
import 'package:learning_management/mathematics_course_registration.dart';
import 'package:learning_management/home_page.dart';

class MathematicsCourse extends StatefulWidget {
  const MathematicsCourse({Key? key, required String title}) : super(key: key);

  @override
  State<MathematicsCourse> createState() => _MathematicsCourseState();
}

class _MathematicsCourseState extends State<MathematicsCourse> {
  var lessonList = [];

  @override
  void initState() {
    lessonList = [];
    FirebaseFirestore.instance
        .doc("courses/2rhPuS6ZCnNebiIGp3pZ")
        .collection("lessons")
        .get()
        .then((querySnapShot) {
      print("Sucessfully loaded all courses");
      querySnapShot.docs.forEach((element) {
        print(element.data());
        lessonList.add(element.data());
      });
      setState(() {});
    }).catchError((error) {
      print("Failed to load courses");
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 40,
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
                                      const HomePage(title: "Home Page")));
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
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Text(
                        "Make Full Payment  For Academic Year 2022 - 2023",
                        style: TextStyle(
                            backgroundColor: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "USD 70.00",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                        child: Text(
                          "Access until April 15, 2024 12:00 AM",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MCourseRegistration(
                                        title:
                                            "Mathmetics Course Registration")));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // <-- Radius
                            ),
                          ),
                          child: Text('Join Now'),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 35, right: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Lessons",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            backgroundColor: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 60,
            child: ListView.builder(
                itemCount: lessonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {

                    },
                    title: Container(
                        color: Colors.grey,
                        height: 30,
                        margin: EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        child: Row(
                          children: [
                            /* Text(
                              '${lessonList[index]['lessonNumber']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'RobotoMono',
                                  color: Colors.black),
                            ),*/
                            Spacer(),
                            Text(
                              '${lessonList[index]['title']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'RobotoMono',
                                  color: Colors.black),
                            ),
                            Spacer(),
                          ],
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
