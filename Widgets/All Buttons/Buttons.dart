import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  MyWidgetState createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  String _data = "";
  void _function(String name) {
    setState(() {
      _data = name;
    });
  } //void function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      //Location:
      // centerDocked,
      // centerFloat
      // endDocked
      // endFloat
      // endTop
      // startTop
      // miniStartTop
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Widget1()),
          );
        },
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add, size: 25),
      ), //FloatingactionButton
      appBar: AppBar(
        title: const Text("All Buttons"),
      ), //appbar
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            "Comment No:$_data",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ), //Text
          //-------------Button: 1 -------------//
          ElevatedButton(
            onPressed: () {
              _function("1");
            },
            child: const Text("Elevated Button"),
          ), //bhtton

          //-------------Button: 2 --------------//
          const ElevatedButton(
            onPressed: null,
            child: Text("Disable Button"),
          ), //elevated button
          //--------------Button: 3 ------------//
          TextButton(
              child: const Text("Text Button"),
              onPressed: () {
                _function("3");
              }), //textbutton
          //-------------Button: 4 ------------//
          ElevatedButton.icon(
            onPressed: () {
              _function("4");
            },
            label: const Text("Elevated.icon"),
            icon: const Icon(Icons.save),
          ), //ele ic
          ButtonBar(
            children: [
//------------------Button: 5 ----------------//
              ElevatedButton(
                onPressed: () {
                  _function("5");
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red,
                  backgroundColor: Colors.yellow, // text or icon color
                  textStyle: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic),
                  elevation: 30,
                  shadowColor: Colors.deepOrange,
                  padding: const EdgeInsets.all(10),
                ),
                child: const Text("Style Button"), //style
              ), //elevatedbutton

              //----------Button: 6 -----------//

              ElevatedButton(
                onPressed: () {
                  _function("6");
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.orange,
                  side: const BorderSide(width: 2.0, color: Colors.black),
                ),
                child: const Text('Border'),
              ), //Elevatedbutto
//------------------Button: 7 ----------------//
              ElevatedButton(
                onPressed: () {
                  _function("7");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SpecialButtons(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.amber,
                  elevation: 25,
                  padding: const EdgeInsets.all(20),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)), //radius
                  ), //shape
                ),
                child: const Text('Shape'), //style
              ), //ElevatedButto
//------------------Button: 8 ----------------//
              ElevatedButton(
                onPressed: () {
                  _function("8");
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red, backgroundColor: Colors.yellow,
                  side: const BorderSide(width: 2, color: Colors.black), //side
                  shape: const StadiumBorder(),
                ),
                child: const Text("Stadium Border"), //style
              ), //elevatedbutto
            ],
          ), //buttonba
          ButtonBar(
            children: [
//------------------Button: 9 ----------------//
              ElevatedButton(
                onPressed: () {
                  _function("9");
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red, backgroundColor: Colors.yellow,
                  padding: const EdgeInsets.all(30),
                  side: const BorderSide(width: 2, color: Colors.black), //side
                  shape: const CircleBorder(),
                ),
                child: const Text("Circle"), //style
              ), //elevatedbutton
//------------------Button: 10 ----------------//
//----------------OtherProperties------------//
              ClipOval(
                child: Material(
                  //button
                  color: Colors.purple,
                  child: InkWell(
                    onTap: () {
                      _function("10");
                    },
                    splashColor: Colors.yellow,
                    child: const SizedBox(
                      height: 70,
                      width: 70,
                      child: Icon(Icons.bluetooth, color: Colors.white),
                    ), //sizedbox
                  ), //inkwell
                ), //material
              ), //clipova
//------------------Button: 11 ----------------//
              InkWell(
                onTap: () {
                  _function("11");
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                      color: Colors.pink, shape: BoxShape.circle),
                  child: const Text(
                    "Button",
                    style: TextStyle(
                      color: Colors.white,
                    ), //style text
                  ), //dexoration
                ), //contaimer
              ) //inkwell
            ],
          ), //buttinbar
        ]), //colum
      ), //center
    );
  }
}

class SpecialButtons extends StatefulWidget {
  const SpecialButtons({super.key});

  @override
  SpecialButtonState createState() => SpecialButtonState();
}

class SpecialButtonState extends State<SpecialButtons> {
  final List<String> _names = ["Ani", "Kuttan", "Anu", "Anikuttan"];
  String _name = "Ani";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SpecialButton"),
      ), //appbar
      body: Align(
        alignment: Alignment.bottomLeft,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _button1(),
          _button2(),
          _button3(_name),
          DropdownButton(
              //    hint:Text("DropDown"),//it not #how the seleted value
              hint: _name == "Ani"
                  ? const Text("Select")
                  : Text(
                      _name,
                      style: const TextStyle(
                          fontSize: 15, color: Colors.purple), //textstule
                    ),
              onChanged: (value) {
                setState(() {
                  _name = value.toString();
                });
              },
              items: _names.map((String alfabet) {
                return DropdownMenuItem(
                  value: alfabet,
                  child: Text("Select a value : $alfabet"),
                );
              }).toList()), //dropdown
        ]), //column
      ), //align
    );
  }
}

Widget _button1() {
  return PopupMenuButton<int>(
      offset: const Offset(50, 60),
      itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Container(color: Colors.red, height: 300), //container
            ),
          ]);
}

Widget _button2() {
  return PopupMenuButton<int>(
      itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: ListTile(title: Text("Anikuttan")),
            ),
          ]);
}

Widget _button3(String name) {
  return PopupMenuButton<String>(
      onSelected: (value) {
        name = value;
      },
      itemBuilder: (context) => [
            const PopupMenuItem(
              value: "Anikuttan1",
              //This value is pass to onSelected parameter to do something
              child: Text('Anikuttan 1 '),
            ), //menuitem 1
            PopupMenuItem(value: "u", child: Text(name)), //item 2
          ]);
}

class Widget1 extends StatefulWidget {
  const Widget1({super.key});

  @override
  Widget1State createState() => Widget1State();
}

class Widget1State extends State<Widget1> {
  String currentMonth = "Jan";
  final List<String> _months = const [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Button")), //appbar
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(currentMonth),
          PopupMenuButton(
            itemBuilder: (context) {
              return _months
                  .map((month) =>
                          PopupMenuItem(value: month, child: Text(month)) //item
                      )
                  .toList();
            },
            onSelected: (value) {
              setState(() {
                currentMonth = value.toString();
              });
            },
          ), //button
        ]), //column
      ), //center
    );
  }
}

class MyWidget1 extends StatefulWidget {
  const MyWidget1({Key? key}) : super(key: key);

  @override
  MyWidget1State createState() => MyWidget1State();
}

class MyWidget1State extends State<MyWidget1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color'),
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              // splashFactory: NoSplash.splashFactory,
              shape: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(120),
                    ),
                  );
                } else {
                  return const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  );
                }
              }),
              elevation: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return 30;
                }
                return null;
              }),
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return const BorderSide(color: Colors.black, width: 3);
                }
                return null;
              }),
              textStyle: bttontextStyle(),
              overlayColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.red;
                }
                return null;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.red;
                } else if (states.contains(MaterialState.hovered)) {
                  return Colors.purple;
                }
                return null;
              }),
            ),
            child: const Text(
              'Button',
            ),
          ),
        ),
      ),
    );
  }

  MaterialStateProperty<TextStyle?> bttontextStyle() {
    return MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.pressed)) {
          return TextStyle(
            fontSize: 20,
            wordSpacing: 30,
            // color: Colors.black, // color and Backgrond Color  at the same time
            foreground: Paint()..color = Colors.black,
            // backgroundColor: Colors.purple,
          );
        } else {
          return const TextStyle(fontSize: 40, color: Colors.white);
        }
      },
    );
  }
}
