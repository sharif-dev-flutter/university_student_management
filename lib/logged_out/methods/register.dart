
import 'package:attendencedemo/classes/account.dart';
import 'package:attendencedemo/classes/firestore.dart';
import 'package:attendencedemo/shared/formatting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final ValueChanged<bool> updateTitle;
  Register(this.updateTitle);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final User _account = User();
  final _formKey = GlobalKey<FormState>();

  String email, pass, firstName, lastName;
  String error = '';
  String type = '';
  List<String> _types = ['', 'Student', 'Teacher'];
  bool loading = false;
  Widget _currentForm;

  @override
  void initState() {
    super.initState();
    _currentForm = _registerNameEmail();
  }

  @override
  Widget build(BuildContext context) {
    return loading ? AuthLoading(185, 20) : Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 45, 0, 5),
          child: _currentForm,
        ),
        SizedBox(height: 30,),
        GestureDetector(
          onTap: () => widget.updateTitle(true),
          child: Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 70),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.cyan[300],
            ),
            child: Center(
              child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 17),),
            ),
          ),
        ),
      ],
    );
  }

  Widget _registerNameEmail(){
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                color: Color.fromRGBO(51, 204, 255, 0.3),
                blurRadius: 20,
                offset: Offset(0, 10),
              )],
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child:Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey[200]))
                        ),
                        child: TextFormField(
                          decoration: authInputFormatting.copyWith(hintText: "First Name"),
                          validator: (val) => val.isEmpty ? 'Can\'t Be Empty' : null,
                          onChanged: (val){
                            firstName = val;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey[200]))
                        ),
                        child: TextFormField(
                          decoration: authInputFormatting.copyWith(hintText: "Last Name"),
                          validator: (val) => val.isEmpty ? 'Can\'t Be Empty' : null,
                          onChanged: (val){
                            lastName =val;
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                  ),
                  child: TextFormField(
                    decoration: authInputFormatting.copyWith(hintText: "Enter Email"),
                    validator: _account.validateId,
                    onChanged: (val){
                      email = val;
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Text(error, style: TextStyle(color: Colors.red),),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              if(_formKey.currentState.validate())
                {
                  setState(() {
                    _currentForm = _registerPasswordType();
                  });
                }
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.cyan,
              ),
              child: Center(
                child: Text("Next", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 17),),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _registerPasswordType()
  {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                color: Color.fromRGBO(51, 204, 255, 0.3),
                blurRadius: 20,
                offset: Offset(0, 10),
              )],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                  ),
                  child: TextFormField(
                    decoration: authInputFormatting.copyWith(hintText: "Enter Password"),
                    validator: _account.validateRegisterPass,
                    obscureText: true,
                    onChanged: (val){
                      pass = val;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                  ),
                  height: 70,
                  child: FormField<String>(
                    validator: (val) => val.isEmpty ? "Choose A Category" : null,
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: authInputFormatting.copyWith(hintText: 'Choose Account Type'),
                        isEmpty: type == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: type,
                            isDense: true,
                            onChanged: (value) {
                              setState(() {
                                type = value;
                                state.didChange(value);
                              });
                            },
                            items: _types.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Text(error, style: TextStyle(color: Colors.red),),
          SizedBox(height: 30,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentForm = _registerNameEmail();
                    });
                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.cyan,
                    ),
                    child: Center(
                      child: Text("Back", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 17),),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () async{
                    if(_formKey.currentState.validate())
                    {
                      setState(() => loading = true);
                      FirebaseUser user = await _account.register(email, pass);
                      if(user != null)
                      {
                        UserDataBase userData = UserDataBase(user) ;
                        dynamic userDataSet = await userData.newUserData(firstName, lastName, type);
                        bool isEmailVerified = user.isEmailVerified;
                        if(userDataSet != null)
                        {
                          dynamic type = await userData.userType();
                          if(type != null){
                            Navigator.of(context).pushReplacementNamed('/home', arguments: {'type' : type, 'isEmailVerified' : isEmailVerified});
                          }
                          else{
                            await _account.signOut();
                            setState(() {
                              loading = false;
                              error = 'Couldn\'t get user type, try to log in';
                            });
                          }
                        }
                        else
                        {
                          await _account.deleteUser();
                          setState(() {
                            loading = false;
                            error = "Couldn't add user details to database";
                          });
                        }
                      }
                      else
                      {
                        setState(() {
                          type = '';
                          loading = false;
                          error = "Please provide an valid E-mail";
                          _currentForm = _registerNameEmail();
                        });
                      }
                    }
                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.cyan,
                    ),
                    child: Center(
                      child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 17),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

