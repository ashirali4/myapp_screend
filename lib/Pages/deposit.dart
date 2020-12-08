import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Deposit extends StatefulWidget {
  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: WebView(
        initialUrl: 'https://quinielafutbolera.com/',
      ),
    );
  }
}
