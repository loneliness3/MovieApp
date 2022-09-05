import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home_scr.dart';

class Overview extends StatefulWidget {  
  Overview({Key? key})
      : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {

  // OverViewData(){
  // late String? backDrop;
  // late String? poster;
  // late String? title;
  // late String? overview;
  // OverViewData(backDrop, poster, title, overview){
  //   // backDrop = 
  // }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: (() {
                // print(widget.title);
              }),
              child: Text('aaa'))
        ],
      ),
    );
  }
}
