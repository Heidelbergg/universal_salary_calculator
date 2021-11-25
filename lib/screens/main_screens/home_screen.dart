import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen  extends StatefulWidget {
  const HomeScreen ({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}
class _State extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 2),
      color: Colors.blue,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 7),
              child: Text("Total income this month")
          ),
        ],
      ),
    );
  }
}
