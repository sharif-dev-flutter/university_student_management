import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ShowResult extends StatefulWidget {
  @override
  _ShowResultState createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {
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
                  Text('Results', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(

                    child: Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(
                            children: [
                              Text("ID"),
                              Text("Name"),
                              Text("Bangla"),
                              Text("English"),
                              Text("Math"),
                              Text("Remarks"),

                            ]
                        )
                      ],
                    ),
                  ),
                  StreamBuilder(
                      stream: Firestore.instance.collection('results').snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if(!snapshot.hasData){
                          return Text("no value");
                        }
                        else
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              snapshot.data.documents.map((d) {
                                return Table(
                                  border: TableBorder.all(),
                                  children: [
                                    TableRow(
                                        children:

                                        [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [


                                              Container(
                                                alignment: Alignment.center,
                                                height: 80,
                                                width: 80,
                                                child: Text(d['id'] ?? ' ',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [


                                              Container(
                                                alignment: Alignment.center,
                                                height: 80,
                                                width: 80,
                                                child: Text(d['name'] ?? ' ',
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
                                                child: Text(d['bangla'] ?? ' ',
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
                                                child: Text(d['english'] ?? ' ',
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
                                                child: Text(d['math'] ?? ' ',
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
                                                child: Text(d['remark'] ?? '',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]
                                    )

                                  ],
                                );

                              }).toList()
                          );

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
