import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'home_screen.dart';

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
              Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50),
                  child: const Center(
                      child: Text(
                        "Entries this month",
                        style: TextStyle(color: Colors.white),
                      ))),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 35),
                child: const Center(
                    child: Text(
                      "3",
                      style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
        CardFb2(text: "Vikar", imageUrl: "https://katrinebjergskolen.aarhus.dk/media/23192/aula-logo.jpg?anchor=center&mode=crop&width=1200&height=630&rnd=132022572610000000", subtitle: "+1290 DKK", onPressed: showHistoryInfo),
        CardFb2(text: "KFC", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Kentucky_Fried_Chicken_201x_logo.svg/2560px-Kentucky_Fried_Chicken_201x_logo.svg.png", subtitle: "+650 DKK", onPressed: showHistoryInfo),
        CardFb2(text: "Athenas", imageUrl: "https://www.aeldresagen.dk/-/media/aeldresagen-dk/03-tilbud-og-rabatter/partners/t/tikko/logo.png", subtitle: "+450 DKK", onPressed: showHistoryInfo),
      ],
    );
  }
  Future showHistoryInfo () => showSlidingBottomSheet(
    context,
    builder: (context) => SlidingSheetDialog(
      duration: const Duration(milliseconds: 450),
      snapSpec: const SnapSpec(
          snappings: [0.4, 0.7, 1], initialSnap: 0.4
      ),
      builder: showHistory,
      /////headerBuilder: buildHeader,
      avoidStatusBar: true,
      cornerRadius: 15,
    ),
  );

  Widget buildHeader(BuildContext context, SheetState state) => Material(child: Stack(children: <Widget>[Container(height: MediaQuery.of(context).size.height / 3 , color: Colors.blue,),Positioned(bottom: 20, child: SizedBox(width: MediaQuery.of(context).size.width, height: 40, child: Image.network("https://katrinebjergskolen.aarhus.dk/media/23192/aula-logo.jpg?anchor=center&mode=crop&width=1200&height=630&rnd=132022572610000000", height: 59, fit: BoxFit.contain)))],),);

  Widget showHistory(context, state) => Material(
    child: ListView(
      shrinkWrap: true,
      primary: false,
      children: [

        Container(margin: const EdgeInsets.only(left: 10, right: 10), child: ElevatedButton(style: ElevatedButton.styleFrom(shape: const StadiumBorder(), padding: const EdgeInsets.symmetric(horizontal: 1)), onPressed: () => Navigator.of(context).pop(), child: const Text("Close")))
      ],
    ),
  );
  }

