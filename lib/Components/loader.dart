import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget onLoading(BuildContext context)
{
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ],
      );
    },
  );
}




Widget Loaderfor()
{
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    ],
  );
}



