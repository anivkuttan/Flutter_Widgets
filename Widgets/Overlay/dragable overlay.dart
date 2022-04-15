import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OverlayEntry? overLayEntery;
  Offset offset = const Offset(40, 90);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OverLay Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text('Show OverLay Widget'),
                onPressed: () {
                  showOverLayWidget(context);
                }),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text('Hide OverLay Widget'),
              onPressed: hideOverLayWidget,
            )
          ],
        ),
      ),
    );
  }

  showOverLayWidget(BuildContext context) {
    final overLayState = Overlay.of(context);

    if (overLayEntery == null) {
      overLayEntery = OverlayEntry(builder: (context) {
        return Positioned(
          //offset.dx stands for x value
          // offset.dy == y value
          top: offset.dy,
          left: offset.dx,
          height: 80,
          width: 120,
          child: GestureDetector(
              onPanUpdate: (details) {
                offset += details.delta;
                //markNeedBuild for setState
                overLayEntery!.markNeedsBuild();
              },
              child: ElevatedButton(
                child: const Text('Hello'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
              )),
        );
      });
      overLayState?.insert(overLayEntery!);
    } else {
      print("We are Heare it's already showing");
      return;
    }
  }

  hideOverLayWidget() {
    overLayEntery!.remove();
    overLayEntery = null;
  }
}
