import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Deposit extends StatefulWidget {
  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFf1BE37E),
        title: Text("Deposit - Quiniela Futbolera"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: WebView(
        initialUrl: 'https://quinielafutbolera.com/',
      ),
    );
  }
}
