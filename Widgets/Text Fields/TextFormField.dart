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
  final _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  String userEmail;
  String userPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Form Field')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('email:$userEmail'),
                SizedBox(height: 20),
                Text('password : $userPassword'),
                SizedBox(height: 20),
                TextFormField(
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter Your Name";
                    } else if (value.length < 4) {
                      return 'Name Should be 4 leaters';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    setState(() {
                      userEmail = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    hintText: 'Enter Your Full Name',
                    prefixIcon: Icon(Icons.people),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10),
                        right: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  obscureText: isPasswordHidden,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter Your Password";
                    } else if (value.length > 8) {
                      return 'maximum 8';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    setState(() {
                      userPassword = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordHidden = !isPasswordHidden;
                          });
                        },
                        icon: Icon(isPasswordHidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10),
                        right: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final form = _formKey.currentState;
          if (form.validate()) {
            // now field text validated
            form.save(); //it call onSaved parameter(function)
          }

          _formKey.currentState.validate();
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
