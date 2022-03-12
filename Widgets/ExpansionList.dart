import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Items> itemList = List.generate(
    6,
    (index) =>
        Items(id: index, personName: 'Item Name : $index', isOpen: false),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Panel'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          //hederPading ===> Gap between Heder and body part
          expandedHeaderPadding: EdgeInsets.symmetric(vertical: 40),
          dividerColor: Colors.red,
          expansionCallback: (int i, bool currentState) {
            setState(() {
              itemList[i].isOpen = !currentState;
            });
          },
          children: itemList
              .map(
                (e) => ExpansionPanel(
                  backgroundColor: Colors.blue[100],
                  isExpanded: e.isOpen,
                  headerBuilder: (context, isopen) {
                    return ListTile(
                      title: Text('${e.personName}'),
                    );
                  },
                  body: ListTile(title: Text('${e.id}')),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class Items {
  final int id;
  final String personName;
  bool isOpen;
  Items({
    this.isOpen = false,
    required this.id,
    required this.personName,
  });
}
