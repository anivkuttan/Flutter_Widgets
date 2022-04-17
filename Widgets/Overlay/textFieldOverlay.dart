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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OverLay Widget'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18),
          child: ListView(
            children: [
              Container(color: Colors.purple, height: 120),
              Container(
                color: Colors.orange,
                height: 120,
              ),
              const SizedBox(height: 30),
              const SeaarchBoxField(),
              const SizedBox(height: 30),
              Container(color: Colors.yellow, height: 120),
              Container(
                color: Colors.pink,
                height: 120,
              ),
              Container(color: Colors.green, height: 120),
              Container(
                color: Colors.blue,
                height: 120,
              ),
              Container(color: Colors.orange, height: 120),
              Container(
                color: Colors.indigo,
                height: 120,
              ),
              Container(color: Colors.tealAccent, height: 120),
              Container(
                color: Colors.lightGreen,
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeaarchBoxField extends StatefulWidget {
  const SeaarchBoxField({Key? key}) : super(key: key);

  @override
  State<SeaarchBoxField> createState() => _SeaarchBoxFieldState();
}

class _SeaarchBoxFieldState extends State<SeaarchBoxField> {
  late final TextEditingController controller;
  OverlayEntry? overlayEntry;
  final FocusNode? myFocusNode = FocusNode();
  final layerLink = LayerLink();
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    // this line for showing overlay widget on starting app
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showOverLaySuggestion(context);
    });
    myFocusNode!.addListener(() {
      if (myFocusNode!.hasFocus) {
        showOverLaySuggestion(context);
      } else {
        hideOverLay();
      }
    });
  }

  void showOverLaySuggestion(BuildContext context) {
    OverlayState overLayState = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    // render box is size of over widget
    final size = renderBox.size;
    //this localatoglobal methed used for find position of our widget
    // we are using layerlink so not need this
    // final offset = renderBox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return Positioned(
        // we are using layerlink so not need this
        // left: offset.dx,
        // top: offset.dy + size.height + 10,
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          child: Material(
            elevation: 8,
            child: Column(
              children: [
                ListTile(
                  title: const Text('Hello 1'),
                  tileColor: Colors.blue,
                  onTap: () {
                    controller.text = 'Hello 1';
                    hideOverLay();
                    // to hide keyboaed
                    myFocusNode!.unfocus();
                  },
                ),
                ListTile(
                  title: const Text('Hello 2'),
                  tileColor: Colors.blue,
                  onTap: () {
                    setState(() {
                      controller.text = 'Hello 2';
                    });

                    hideOverLay();
                    myFocusNode!.unfocus();
                  },
                ),
                ListTile(
                  title: const Text('Hello 3'),
                  tileColor: Colors.blue,
                  onTap: () {
                    controller.text = 'Hello 3';
                    hideOverLay();
                    myFocusNode!.unfocus();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });

    overLayState.insert(overlayEntry!);
  }

  void hideOverLay() {
    overlayEntry!.remove();
    overlayEntry = null;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: TextField(
        controller: controller,
        focusNode: myFocusNode,
        decoration: InputDecoration(
            border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
        )),
      ),
    );
  }
}
