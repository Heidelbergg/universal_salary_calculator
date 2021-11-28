import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryScreen  extends StatefulWidget {
  const HistoryScreen ({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<HistoryScreen>{
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 0),
      children: [
        Container(
          color: Colors.blue,
          margin: const EdgeInsets.only(bottom: 10),
          height: MediaQuery.of(context).size.height / 3,
          child: ListView(
            children: [

            ],
          ),
        ),
      ],
    );
  }
}
