import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ESP8266 Display Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _messageController = TextEditingController();
  String _webServerIP = '192.168.0.100'; // Replace with your ESP8266 IP address
  FocusNode _messageFocusNode = FocusNode();

  void _sendMessage() async {
    String message = _messageController.text;
    String url = 'http://$_webServerIP/action_page?msg=$message';
    await http.get(Uri.parse(url));
    _messageFocusNode.unfocus(); // Dismiss the keyboard after submitting
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESP8266 Display Controller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Web Server IP:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                onChanged: (value) {
                  _webServerIP = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter ESP8266 IP address',
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Enter Text:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _messageController,
                focusNode: _messageFocusNode,
                decoration: InputDecoration(
                  hintText: 'Enter your text here',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendMessage,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
