import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mofkraaa/HelperNote.dart';
import 'package:mofkraaa/Screen/HomeScreen.dart';

import '../constant.dart';

class DisScreen extends StatefulWidget {


  @override
  _DisScreenState createState() => _DisScreenState();
}

class _DisScreenState extends State<DisScreen> {
  String? title, date, description;
Note note=Note();
  _DisScreenState({this.title, this.date, this.description});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add ToDo",
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(color: green, fontSize: 20),
                hintText: "Enter Title",
                contentPadding: EdgeInsets.all(10),
                helperStyle: TextStyle(color: primarycolor),
                fillColor: primarycolor,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: primarydarkcolor, width: 0.5)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: primarydarkcolor, width: 0.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.amber, width: 0.5)),
              ),
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: "Date",
                labelStyle: TextStyle(color: green, fontSize: 20),
                hintText: "Enter Date",
                contentPadding: EdgeInsets.all(10),
                helperStyle: TextStyle(color: primarycolor),
                fillColor: primarycolor,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: primarydarkcolor, width: 0.5)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: primarydarkcolor, width: 0.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.amber, width: 0.5)),
              ),
              onChanged: (value) {
                setState(() {
                  date = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 9,
              decoration: InputDecoration(
                labelText: "Note",
                labelStyle: TextStyle(color: green, fontSize: 20),
                hintText: "Enter Note",
                contentPadding: EdgeInsets.all(10),
                helperStyle: TextStyle(color: primarycolor),
                fillColor: primarycolor,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: primarydarkcolor, width: 0.5)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: primarydarkcolor, width: 0.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.amber, width: 0.5)),
              ),
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Note.insertdb({
                      'description': description,
                      'date': date,
                      'title': title,
                      'done':"Note Saved",
                    }).then((value) {

                        print("inserted note successfully: $value");

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      },));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primarydarkcolor,
                  ),
                  icon: Icon(
                    Icons.add,
                    size: 18,
                    color: txtcolor,
                  ),
                  label: Text(
                    "ADD",
                    style: GoogleFonts.akronim(
                      textStyle: TextStyle(
                        color: txtcolor,
                        fontSize: 15,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
