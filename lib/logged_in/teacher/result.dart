import 'package:attendencedemo/logged_in/student/showresult.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class Resultpage extends StatefulWidget {
  @override
  _ResultpageState createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String id, name, bangla, english, math, remark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

          body:
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5, 40, 5, 30),
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
                      Text('Upload Result', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                //SingleChildScrollView(
                //child:
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1,
                                color: Colors.black26
                            )
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'ID',
                              hintText: 'Enter Student ID',
                            ),

                            onChanged: (input){
                              id = input;
                            },

                            validator: (input){
                              if(input.isEmpty){
                                return "Please type id";
                              }
                              return null;
                            }
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1,
                                color: Colors.black26
                            )
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Name',
                              hintText: 'Enter Student Name',
                            ),

                            onChanged: (input){
                              name = input;
                            },

                            validator: (input){
                              if(input.isEmpty){
                                return "Please type Name";
                              }
                              return null;
                            }
                        ),
                      ),
                      SizedBox(height: 10,),



                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1,
                                color: Colors.black26
                            )
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Bangla",
                            hintText: 'Bangla Marks',
                          ),

                          onChanged: (input){
                            bangla = input;
                          },
                        ),
                      ),
                      SizedBox(height: 10,),


                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1,
                                color: Colors.black26
                            )
                        ),

                        child: Container(

                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "English",
                              hintText: 'English Marks',
                            ),
                            onChanged: (input){
                              english = input;
                            },

                          ),
                        ),
                      ),
                      SizedBox(height: 10,),


                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1,
                                color: Colors.black26
                            )
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Math",
                            hintText: 'Math Marks',
                          ),
                          onChanged: (input){
                            math = input;
                          },
                        ),
                      ),

                      SizedBox(height: 10,),


                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1,
                                color: Colors.black26
                            )
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "remark",
                            hintText: 'remark',
                          ),
                          onChanged: (input){
                            remark = input;
                          },
                        ),
                      ),

                      SizedBox(height: 20,),

                      RaisedButton(
                        onPressed: (){
                          Firestore.instance.collection("results").add({
                            'id' : id,
                            'name': name,
                            'bangla' : bangla,
                            'english' : english,
                            'math' : math,
                            'remark' : remark,
                          });
                        },
                        child: Text('Upload',
                          style: TextStyle(color: Colors.white),),
                        color: Colors.cyan,
                        splashColor: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),

                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShowResult()),
                          );
                        },
                        child: Text('Check Results',
                          style: TextStyle(color: Colors.white),),
                        color: Colors.cyan,
                        splashColor: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),

                    ],

                  ),

                ),
                // ),
              ],
            ),
          ),


        );
  }
}
