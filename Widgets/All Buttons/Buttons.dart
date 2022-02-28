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

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _data = "";
  void _function(String _name) {
    setState(() {
      _data = _name;
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
              context, MaterialPageRoute(builder: (context) => Widget1()));
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
                child: const Text("Style Button"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow, // primary => backgroundColor
                  onPrimary: Colors.red, // text or icon color
                  textStyle: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic),
                  elevation: 30,
                  shadowColor: Colors.deepOrange,
                  padding: const EdgeInsets.all(10),
                ), //style
              ), //elevatedbutton

              //----------Button: 6 -----------//

              ElevatedButton(
                onPressed: () {
                  _function("6");
                },
                child: const Text('Border'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.black,
                  side: const BorderSide(width: 2.0, color: Colors.black),
                ),
              ), //Elevatedbutto
//------------------Button: 7 ----------------//
              ElevatedButton(
                onPressed: () {
                  _function("7");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SpecialButtons(),
                      ));
                },
                child: const Text('Shape'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  onPrimary: Colors.black,
                  elevation: 25,
                  padding: const EdgeInsets.all(20),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)), //radius
                  ), //shape
                ), //style
              ), //ElevatedButto
//------------------Button: 8 ----------------//
              ElevatedButton(
                onPressed: () {
                  _function("8");
                },
                child: const Text("Stadium Border"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow, onPrimary: Colors.red,
                  side: const BorderSide(width: 2, color: Colors.black), //side
                  shape: const StadiumBorder(),
                ), //style
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
                child: const Text("Circle"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow, onPrimary: Colors.red,
                  padding: const EdgeInsets.all(30),
                  side: const BorderSide(width: 2, color: Colors.black), //side
                  shape: const CircleBorder(),
                ), //style
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
                  child: const Text(
                    "Button",
                    style: TextStyle(
                      color: Colors.white,
                    ), //style text
                  ), // text child
                  alignment: Alignment.center,
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                      color: Colors.pink, shape: BoxShape.circle), //dexoration
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
  @override
  _SpecialButtonState createState() => _SpecialButtonState();
}

class _SpecialButtonState extends State<SpecialButtons> {
  List<String> _names = ["Ani", "Kuttan", "Anu", "Anikuttan"];
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
      offset: Offset(50, 60),
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
            PopupMenuItem(
              value: 1,
              child: ListTile(title: Text("Anikuttan")),
            ),
          ]);
}

Widget _button3(String _name) {
  return PopupMenuButton<String>(
      onSelected: (value) {
        _name = value;
      },
      itemBuilder: (context) => [
            PopupMenuItem(
              value: "Anikuttan1",
              //This value is pass to onSelected parameter to do something
              child: Text('Anikuttan 1 '),
            ), //menuitem 1
            PopupMenuItem(value: "u", child: Text(_name)), //item 2
          ]);
}

class Widget1 extends StatefulWidget {
  @override
  _Widget1State createState() => _Widget1State();
}

class _Widget1State extends State<Widget1> {
  String currentMonth = "Jan";
  List<String> _months = const [
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
  _MyWidget1State createState() => _MyWidget1State();
}

class _MyWidget1State extends State<MyWidget1> {
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
            child: const Text(
              'Button',
            ),
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
              }),
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return const BorderSide(color: Colors.black, width: 3);
                }
              }),
              textStyle: bttontextStyle(),
              overlayColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.red;
                }
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.red;
                } else if (states.contains(MaterialState.hovered)) {
                  return Colors.purple;
                }
              }),
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
