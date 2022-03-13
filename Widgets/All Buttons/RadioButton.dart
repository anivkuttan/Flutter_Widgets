import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

enum Gender { male, female, other }

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Gender genderValue = Gender.male;
  int groupValue = 0;
  int group = 1;
  String groupString = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
      ), //appba
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(children: [
            Radio<Gender>(
                value: Gender.male,
                groupValue: genderValue,
                onChanged: (value) {
                  setState(() {
                    genderValue = value!;
                  });
                }), //radio male
            const Text('Male'), //male text
          ]),
          Row(children: [
            Radio<Gender>(
                value: Gender.female,
                groupValue: genderValue,
                onChanged: (value) {
                  setState(() {
                    genderValue = value!;
                  });
                }), //radio male
            const Text('Female'), //male text
          ]),
          Row(children: [
            Radio<Gender>(
                value: Gender.other,
                groupValue: genderValue,
                onChanged: (value) {
                  setState(() {
                    genderValue = value!;
                  });
                }), //radio male
            const Text('Other'), //male text
          ]),

          Radio<int>(
              value: 1,
              groupValue: groupValue,
              activeColor: Colors.purple,
              onChanged: (value) {
                setState(() {
                  groupValue = value!;
                });
              }), //radio
          Radio<int>(
              value: 2,
              activeColor: Colors.purple,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value!;
                });
              }), //radio
          Radio<String>(
              value: 'One',
              groupValue: groupString,
              onChanged: (value) {
                setState(() {
                  groupString = value!;
                });
              }),
          Radio<String>(
              value: 'Two',
              groupValue: groupString,
              onChanged: (value) {
                setState(() {
                  groupString = value!;
                });
              }), //raxio
          ListTile(
            title: const Text('Radio List Tile'),
            leading: Radio<int>(
                value: 3,
                activeColor: Colors.purple,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }), //radio
          ), //tile
        ]), //column
      ), //center
    );
  }
}
