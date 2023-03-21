import 'package:flutter/material.dart';

import 'mathematics_course.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required String title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 15,
            child: Container(
              margin: EdgeInsets.only(bottom: 30, top: 30),
              color: Colors.grey,
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
            flex: 20,
            child: Container(
              child: IconButton(
                icon: Image.network(
                    'https://media.istockphoto.com/id/1168040655/vector/chalk-doodle-math-blackboard.jpg?s=612x612&w=0&k=20&c=-T5xCvLgJUIMMqQuQoG8u0o1bx9wuTvJdTgc7oIX2Pw=',
                    fit: BoxFit.fitHeight),
                iconSize: 900,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MathematicsCourse(title: 'Mathematics Course',)),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Text(
                '10th Grade mathematics Course',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: IconButton(
              icon: Image.network(
                  'https://www.sketchappsources.com/resources/source-image/science-icons-miraviolet.png?v1'),
              iconSize: 800,
              onPressed: () {},
            ),
          ),
          Expanded(
            flex: 5,
            child: Text('10th Grade Science Course'),
          ),
          Expanded(
            flex: 20,
            child: IconButton(
              icon: Image.network(
                  'https://juniortech.org/wp-content/uploads/2019/04/algorithm-icon-362x320px.png'),
              iconSize: 800,
              onPressed: () {},
            ),
          ),
          Expanded(
            flex: 5,
            child: Text('Algorithms For Beginners'),
          ),
        ],
      ),
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
