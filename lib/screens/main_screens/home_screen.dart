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
    return DraggableScrollableSheet(
      maxChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: ListView(
            children: const [
              
            ],
          ),
        );
      },

    );
  }
}
