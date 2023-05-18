import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.home,
              size: 40,
            ),
          )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/kmcck.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  TextField(
                    controller: textFieldController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(12)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _sendDataBack(context);        
                          },
                          icon: Icon(Icons.arrow_forward_ios_outlined)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 10,
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Поиск Горадов и Стран",
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  void _sendDataBack(BuildContext context) {
    String textToSendBack = textFieldController.text;
    Navigator.pop(context, textToSendBack);
  }
}
