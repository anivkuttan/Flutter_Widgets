// import 'package:demo/Second_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String image1 =
      'https://images.unsplash.com/photo-1640622657553-f5af5b34ee2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw0MHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=60';
  String image2 =
      'https://images.unsplash.com/photo-1641873130470-0b29e95780a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=60';
  String image3 =
      'https://images.unsplash.com/photo-1641854262984-da26c899909c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Widget'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Route route = MaterialPageRoute(builder: (context) {
                  return SecondPage(imageInt: 1, image: Image.network(image1));
                });
                Navigator.push(context, route);
              },
              child: SizedBox(
                height: 100,
                width: 100,
                child: Hero(tag: '1', child: Image.network(image1)),
              ),
            ),
            InkWell(
              onTap: () {
                Route route = MaterialPageRoute(builder: (context) {
                  return SecondPage(imageInt: 2, image: Image.network(image2));
                });
                Navigator.push(context, route);
              },
              child: SizedBox(
                height: 100,
                width: 100,
                child: Hero(tag: '2', child: Image.network(image2)),
              ),
            ),
            InkWell(
              onTap: () {
                Route route = MaterialPageRoute(builder: (context) {
                  return SecondPage(imageInt: 3, image: Image.network(image3));
                });
                Navigator.push(context, route);
              },
              child: SizedBox(
                height: 100,
                width: 100,
                child: Hero(tag: '3', child: Image.network(image3)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final Widget image;
  final int imageInt;
  const SecondPage({Key? key, required this.image, required this.imageInt})
      : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 400,
        width: 300,
        // color: Colors.green,
        child: Hero(tag: '${widget.imageInt}', child: widget.image),
      ),
    );
  }
}
