import 'package:attendencedemo/shared/account_settings.dart';
import 'package:attendencedemo/shared/attendance_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'classes/account.dart';
import 'logged_in/home.dart';
import 'logged_in/teacher/add_students.dart';
import 'logged_in/teacher/attendance.dart';
import 'logged_in/teacher/batches.dart';
import 'logged_in/teacher/students.dart';
import 'logged_out/authentication.dart';



void main() => runApp(LoginApp());
class LoginApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: User().account,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Attendance App ',
        home: Authentication(),
        routes: {
          '/batches' : (context) => Batches(),
          '/enrolledStudents' : (context) => EnrolledStudents(),
          '/addStudents' : (context) => AddStudents(),
          '/addAttendance' : (context) => AddAttendance(),
          '/attendanceList' : (context) => AttendanceList(),
          '/home' : (context) => Home(),
          '/authentication': (context) => Authentication(),
          '/accountSettings': (context) => AccountSettings(),
        },
      ),
    );
  }
}




