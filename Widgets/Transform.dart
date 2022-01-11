import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(
            color: Colors.pink,
            child: Text("Scale"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyWidget()),
              );
            },
          ), //button
          SizedBox(height: 30), //box
          RaisedButton(
            color: Colors.yellow,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyWidget2()));
            },
            child: Text("Rotate"),
          ), //butt
          SizedBox(height: 30),
          RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyWidget3()),
                );
              },
              child: Text("Translate"),
              color: Colors.blue), //button
          SizedBox(height: 20), //box
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyWidget4()));
            },
            child: Text("Transform"),
          ),
        ]), //column
      ),
    );
  }
}

//------------------Scale---------------------//

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double _scaleValue = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform.scale"), //text
      ), //appbar
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Transform.scale(
            scale: _scaleValue,
            origin: Offset(50, 50),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.pink,
              child: Text(_scaleValue.toString()),
            ), //congainer
          ), //transform
          RaisedButton(
              onPressed: () {
                setState(() {
                  _scaleValue += 0.5;
                });
              },
              child: Text("Scale +")),
        ]), //column
      ),
    );
  }
}

//----------------Rotate---------------------//

class MyWidget2 extends StatefulWidget {
  @override
  _MyWidget2State createState() => _MyWidget2State();
}

class _MyWidget2State extends State<MyWidget2> {
  double _rotateValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform.rotate"), //text
      ), //appbar
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Transform.rotate(
            angle: _rotateValue,
            origin: Offset(100.0, -100.0),
            // +, + right bottom
            // -, - left top
            // -, + left bottom
            // +, - right top
            child: Container(
              height: 200,
              width: 200,
              color: Colors.yellow,
              child: Text(_rotateValue.toString()),
            ), //congainer
          ), //transform
          RaisedButton(
              onPressed: () {
                setState(() {
                  _rotateValue += 0.4;
                });
              },
              child: Text("Rotate +")),
        ]), //column
      ),
    );
  }
}

//---------------Translate--------------------//
class MyWidget3 extends StatefulWidget {
  @override
  _MyWidget3State createState() => _MyWidget3State();
}

class _MyWidget3State extends State<MyWidget3> {
  double _translateValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform.translate"), //text
      ), //appbar
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Transform.translate(
            offset: Offset(80.0, _translateValue),
            // Offset(-left & +right, -up & +down),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Text(_translateValue.toString()),
            ), //congainer
          ), //transform
          RaisedButton(
              onPressed: () {
                setState(() {
                  _translateValue = -400.0;
                });
              },
              child: Text("Translate Up")),
        ]), //column
      ),
    );
  }
}

class MyWidget4 extends StatefulWidget {
  @override
  _MyWidget4State createState() => _MyWidget4State();
}

class _MyWidget4State extends State<MyWidget4> {
  double _translateValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform.translate"), //text
      ), //appbar
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Transform(
            transform: Matrix4.skewX(0.5),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Text(_translateValue.toString()),
            ), //congainer
          ), //transform
          RaisedButton(
              onPressed: () {
                setState(() {
                  _translateValue = -400.0;
                });
              },
              child: Text("Translate Up")),
        ]), //column
      ),
    );
  }
}
------------- Card Flip Tansform ----------------


class FlipCard extends StatefulWidget {
  const FlipCard({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  double flipValue = 0;
  bool frontView = true;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    controller.addListener(() {
      setState(() {
        flipValue = animation.value;
        setSide();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hwllo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${flipValue.toInt()}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onHorizontalDragUpdate: (h) {
                setState(() {
                  flipValue -= h.delta.dx;
                  flipValue %= 360;
                  setSide();
                });
              },
              onHorizontalDragEnd: (hd) {
                // why hea dceating animation ????
                // because on animation Start
                double endValue = frontView ? (flipValue > 180 ? 360 : 0) : 180;
                animation = Tween<double>(begin: flipValue, end: endValue)
                    .animate(controller);
                controller.forward(from: 0);
              },
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY((flipValue / 180) * pi),
                child: frontView ? frontContainer() : backContainer(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setSide() {
    if (flipValue <= 90 || flipValue >= 270) {
      frontView = true;
    } else {
      frontView = false;
    }
  }

  Widget frontContainer() {
    return Container(
      height: 220,
      width: 350,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red, Colors.purple]),
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Front View',
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget backContainer() {
    // back side Widget shows readingview because of this Transform by pi
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: Container(
        height: 220,
        width: 350,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.yellow,
          ]),
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        alignment: Alignment.center,
        child: const Text(
          'Back View',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}





