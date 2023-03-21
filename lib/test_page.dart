import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'mathematics_course.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key, required String title}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var courseList = [];
  final List<int> colorCodes = <int>[500, 400, 300];

  @override
  void initState() {
    courseList = [];
    FirebaseFirestore.instance
        .collection("courses")
        .get()
        .then((querySnapShot) {
      print("Sucessfully loaded all courses");
      querySnapShot.docs.forEach((element) {
        print(element.data());
        courseList.add(element.data());
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
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(bottom: 30, top: 30),
          color: Colors.grey,
          child: Expanded(
            flex: 15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.computer_rounded),
                  iconSize: 50,
                ),
                Text(
                  'Learning Management Software',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
        Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                'Welcome to the Best Learning Management Software where you will find broad selection of courses',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  foreground: Paint()
                    ..style = PaintingStyle.fill
                    ..strokeWidth = 6
                    ..color = Colors.blue[700]!,
                ),
              ),
            )),
        Expanded(
          flex: 80,
          child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: courseList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    IconButton(
                      icon: Image.network('${courseList[index]['imageUrl']}',
                          fit: BoxFit.fitHeight),
                      iconSize: 400,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MathematicsCourse(
                                    title: 'Mathematics Course',
                                  )),
                        );
                      },
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        '${courseList[index]['title']}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.deepPurple),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        '(Teacher Name: ${courseList[index]['teacherName']})',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blue,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 5,
                      indent: 10,
                      endIndent: 0,
                      color: Colors.grey,
                    ),
                  ],
                );
              }),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outlined),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
