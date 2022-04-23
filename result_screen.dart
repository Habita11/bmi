import 'package:flutter/material.dart';

class ResultScreen  extends StatelessWidget {
bool isMale;
int ?result;
int ?age;
ResultScreen({
  required this.isMale,
  required this.age,
  required this.result
}
    )  ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Result'),),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Gender:${isMale? 'Male' : 'Female'}'),
          Text('Age:$age'),
          Text('Result:$result'),
        ],
      ),
    ),);
  }
}
