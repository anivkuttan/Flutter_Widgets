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
  late final FocusNode firstTextFieldFocus;
  String _text = 'Unknown';
  bool isHidden = true;
  @override
  void initState() {
    super.initState();
    firstTextFieldFocus = FocusNode();
  }

  @override
  void dispose() {
    firstTextFieldFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field'),
        leading: IconButton(
          onPressed: () {
            //to requesting focus
            FocusScope.of(context).requestFocus(firstTextFieldFocus);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: PageView(children: [
            textField0(),
            textField1(),
            textField2(),
            textField3(),
            textField4(),
            textField5(),
            textField6(),
            textField7(),
          ]),
        ),
      ),
    );
  }

  Widget textField0() {
    return Column(
      children: const [
        TextField(
          // strutStyle: StrutStyle(height: 1),
          decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            // contentPadding: EdgeInsets.symmetric(vertical: -1),
            hintText: "Enter Name",
            // hintStyle: TextStyle(fontSize: 30),
            isDense: true,
          ),
        ),
        SizedBox(height: 30),
        Text(
          " contentPadding: EdgeInsets.symmetric(vertical: -1),",
        )
      ],
    );
  }

  Widget textField7() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          TextField(
            obscuringCharacter: '&',
            obscureText: true,
            decoration: InputDecoration(
                filled: true,
                counterText: 'Counter Text allways hear',
                fillColor: Colors.yellow,
                prefixText: 'Hello ',
                hintText: 'obscuringCharacter: &'),
          ),
          Text("textField7")
        ],
      ),
    );
  }

  Widget textField6() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            // obscureText: isHidden,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              labelText: 'obscure text : true',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                  icon:
                      Icon(isHidden ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  }),
            ),
          ),
          const Text("textField6")
        ],
      ),
    );
  }

  Widget textField5() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            enabled: true,
            decoration: InputDecoration(
              //labelText: "Round text",
              hintText: "Enter hear",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 4,
                  color: Colors.green,
                ), //borderside
              ), //border
            ),
          ),
          const Text("textField5")
        ],
      ),
    );
  }

  Widget textField4() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            enabled: false, //true make it normal
            decoration: InputDecoration(
              labelText: "This is Disable TextField",
              //disabledBorder,enabledBorder,focusedBorder
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: Colors.orange,
                ), //birderside
                borderRadius: BorderRadius.circular(30),
              ), //inputborder
            ), //decoration
          ),
          const Text("textField4")
        ],
      ),
    );
  }

  Widget textField3() {
    return Center(
      child: Column(
        children: const [
          TextField(
            autofocus: true, //automatically cursor open in this text field
            decoration: InputDecoration(
              // prefixicon shows inside of the field
              prefixIcon: Icon(Icons.save),
              labelText: "This is Label text",
              hintText:
                  "This is hint text & Auto focus on So cursser on first tis field ",
              hintStyle: TextStyle(
                color: Colors.purple,
              ), //textstyle
            ), //input
          ),
          Text("textField3")
        ],
      ),
    );
  }

  Widget textField2() {
    return Center(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              counter: ElevatedButton(
                  onPressed: () {}, child: const Text('Counter widget')),
              border: const OutlineInputBorder(),
              labelText: "Full Name",
              hintText: "Enter your full Name",
            ), //Inputdecoration
          ),
          const Text("textField2")
        ],
      ),
    );
  }

  Widget textField1() {
    return Center(
      child: Column(
        children: [
          const Text("Widget Name : textField1"),
          const SizedBox(height: 40),
          TextField(
            // this is use for Keyboard Enter button's icon
            textInputAction: TextInputAction.search,
            focusNode: firstTextFieldFocus,
            decoration: const InputDecoration(
              floatingLabelBehavior:
                  FloatingLabelBehavior.always, //never-label text hide
              labelText: 'Labeltext always hear',
              helperText: "Enter some thing",
              //icon parameter shows icons on outside of th field(front)
              icon: Icon(Icons.print),
            ), //decoration
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 20,
            ), //textstyle
            cursorColor: Colors.red,
            cursorWidth: 7,
            // maxLength: 8, //maxLines:3,
            keyboardType: TextInputType.emailAddress,

            onChanged: (text) {
              setState(() {
                _text = text;
              });
            },
          ),
          const SizedBox(height: 30),
          const Text(" textInputAction: TextInputAction.search"),
          const Text(" floatingLabelBehavior:FloatingLabelBehavior.always")
        ],
      ),
    );
  }
}
