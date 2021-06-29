import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class ShowRoutine extends StatefulWidget {
  @override
  _ShowRoutineState createState() => _ShowRoutineState();
}

class _ShowRoutineState extends State<ShowRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(

                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(
                            children: [
                              Text("Course Code"),
                              Text("Course Title"),
                              Text("Date"),
                              Text("Teacher's name"),
                              Text("1st Class"),
                              Text("2nd Class"),
                            ]
                        )
                      ],
                    ),
                  ),
                  StreamBuilder(
                      stream: Firestore.instance.collection('Class_Routine').snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if(!snapshot.hasData){
                          return Text('no value');
                        }
                        else{
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              snapshot.data.documents.map((e) {
                                return Table(
                                    border: TableBorder.all(),
                                    //columnWidths: {0: FlexColumnWidth(.60)},

                                    children: [
                                      //Text("Please check your routine"),
                                      TableRow(
                                          children: [
                                            Column(
                                              children: [

                                                Container(
                                                  // decoration: BoxDecoration(
                                                  //   border: new Border.all(color: Colors.red),
                                                  // ),
                                                  alignment: Alignment.center,
                                                  height: 80,
                                                  width: 80,
                                                  child: Text(e['Course Code'] ?? 'N/A txt',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            Column(
                                              children: [

                                                Container(
                                                  alignment: Alignment.center,

                                                  height: 80,
                                                  width: 100,
                                                  child: Text(e['Course Title'] ?? 'N/A txt',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [

                                                Container(
                                                  alignment: Alignment.center,

                                                  height: 80,
                                                  width: 80,
                                                  child: Text(e['Date'] ?? 'N/A txt',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              //crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: 80,
                                                  width: 80,
                                                  child: Text(e['Teacher'] ?? 'N/A txt',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [

                                                Container(
                                                  alignment: Alignment.center,

                                                  height: 80,
                                                  width: 80,
                                                  child: Text(e['1st Class'] ?? 'N/A txt',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [

                                                Container(
                                                  alignment: Alignment.center,

                                                  height: 80,
                                                  width: 80,
                                                  child: Text(e['2nd Class'] ?? 'N/A txt',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]
                                      ),
                                    ]
                                );
                              }).toList()
                          );
                        }
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
