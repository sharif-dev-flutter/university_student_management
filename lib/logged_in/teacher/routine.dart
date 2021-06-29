import 'package:attendencedemo/logged_in/student/showroutine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class Routinepage extends StatefulWidget {
  @override
  _RoutinepageState createState() => _RoutinepageState();
}

class _RoutinepageState extends State<Routinepage> {
  final fb = Firestore.instance;
  // var retrievedName="";
  String Course_Code = " ";
  String Course_Title = "";
  String Teacher_Name = " ";
  String FirstClass = " ";
  String SecondClass = " ";
  String Date = " ";

  @override
  Widget build(BuildContext context) {
    final ref=fb.collection('Class_Routine');
    return Scaffold(
      // appBar: AppBar(
      //   // padding: EdgeInsets.fromLTRB(5, 40, 5, 30),
      //
      //       // color: Colors.cyan,
      //       // borderRadius: BorderRadius.only(
      //       //     bottomLeft: Radius.circular(50),
      //       //     bottomRight: Radius.circular(50)
      //       // ),
      //
      //   title: Text("Routine Table"),
      // ),

      body: SingleChildScrollView(

        child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(5, 50, 5, 30),
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)
                    )
                ),
                child: Row(
                  children: <Widget>[
                    BackButton(color: Colors.white70,),
                    Text('Class Routine', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1,
                          color: Colors.black26
                      )
                  ),
                  child: TextFormField(
                    onChanged: (val){
                      setState(() {
                        Course_Code=val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText : 'Course Code',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1,
                          color: Colors.black26
                      )
                  ),

                  child: TextFormField(
                    onChanged: (val){
                      setState(() {
                        Course_Title=val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText : 'Course Title',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1,
                          color: Colors.black26
                      )
                  ),
                  child: TextFormField(
                    onChanged: (val){
                      setState(() {
                        Teacher_Name=val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText : "Teacher's Name",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1,
                          color: Colors.black26
                      )
                  ),
                  child: TextFormField(
                    onChanged: (val){
                      setState(() {
                        Date=val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText : 'Date',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1,
                          color: Colors.black26
                      )
                  ),
                  child: TextFormField(
                    onChanged: (val){
                      setState(() {
                        FirstClass=val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText : '1st Class',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1,
                          color: Colors.black26
                      )
                  ),
                  child: TextFormField(
                    onChanged: (val){
                      setState(() {
                        SecondClass=val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText : '2nd Class',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),




              SizedBox(height: 30,),

              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                color: Colors.black,
                onPressed: (){
                  Firestore.instance.collection('Class_Routine').add({
                    'Course Code' : Course_Code,
                    'Course Title' : Course_Title,
                    'Date' : Date,
                    '1st Class' : FirstClass,
                    '2nd Class' : SecondClass,
                    'Teacher' : Teacher_Name,
                  });
                },

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text("Upload Routine",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                splashColor: Colors.red,
              ),


              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShowRoutine()));
                },
                child: Text("Check Routine"),
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular((40)))
                ),
              ),
              



            ]
        ),
      ),


    );
  }
}
