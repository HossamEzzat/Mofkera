import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mofkraaa/helper/func.dart';
import 'package:share/share.dart';

import '../constant.dart';


class reviewScreen extends StatefulWidget {
  var done;
  var date;
  var title;
  var description;

  reviewScreen({this.done, this.date, this.title, this.description});

  @override
  _reviewScreenState createState() => _reviewScreenState();
}

class _reviewScreenState extends State<reviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.title}",
          style: GoogleFonts.akronim(
            textStyle: TextStyle(
              color: txtcolor,
              fontSize: 30,
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: txtcolor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: primarydarkcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
      ),
      backgroundColor: primarycolor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            Text("${widget.date}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            Text("${widget.description}",style: TextStyle(fontSize: 35),),


          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Func.shareLink("title=>${widget.title} \n description: ${widget.description}");

        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(
          Icons.share,
          color: txtcolor,
        ),
      ),
    );
  }
}
