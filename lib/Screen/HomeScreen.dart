import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mofkraaa/Screen/DisScreen.dart';
import 'package:mofkraaa/Screen/reviewScreen.dart';

import '../HelperNote.dart';
import '../constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  void initState() {
    // TODO: implement initState
    super.initState();
    Note.db.then((value) {
      print("value $value");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "ToDo",
            style: GoogleFonts.akronim(
              textStyle: TextStyle(
                color: txtcolor,
                fontSize: 32,
              ),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: primarydarkcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
      ),
      backgroundColor: primarycolor,
      body: FutureBuilder(
        future: Note().getdata(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text(
                  "your ToDo list is empty 😁🙄",
                  style: TextStyle(fontSize: 25),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.transparent,
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) {
                              return reviewScreen(title:snapshot.data[index].title ,description:snapshot.data[index].description ,date:snapshot.data[index].date ,);
                            }));
                      },
                      title: Text(
                        "${snapshot.data[index].title}",
                        style: GoogleFonts.akronim(
                          textStyle: TextStyle(
                            color: txtcolor,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        "${snapshot.data[index].date}",
                        style: GoogleFonts.akronim(
                          textStyle: TextStyle(
                            color: txtcolor,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Note.deletedb(snapshot.data[index].id).then((value) {
                            setState(() {
                              print(value);
                            });

                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.amber,
                color: primarydarkcolor,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DisScreen();
            },
          ));
        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(
          Icons.add,
          color: txtcolor,
        ),
      ),
    ));
  }
}
