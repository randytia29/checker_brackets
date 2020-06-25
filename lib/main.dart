import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController textController = TextEditingController();
  bool isMatched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checker Brackets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (text) {
                  String openBracket = '';
                  String closeBracket = '';
                  for (int i = 0; i < text.length; i++) {
                    openBracket += text.codeUnitAt(i) == 40 ? text[i] : '';
                    closeBracket += text.codeUnitAt(i) == 41 ? text[i] : '';
                  }
                  setState(() {
                    isMatched = openBracket.length == closeBracket.length &&
                        openBracket.length != 0 &&
                        closeBracket.length != 0;
                  });
                },
                controller: textController,
                decoration: InputDecoration(
                    labelText: 'Input Text',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(isMatched ? 'true' : 'false')
          ],
        ),
      ),
    );
  }
}