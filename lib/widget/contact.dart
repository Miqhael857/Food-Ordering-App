import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signinapp/screens/homepage.dart';
import 'package:flutter_signinapp/widget/myTextFormField.dart';
import 'package:flutter_signinapp/widget/mybutton.dart';
class Contact extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState> ();
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController message = TextEditingController();
  static String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = new RegExp(p);
  void validation(){
    if(email.text.isEmpty && fullName.text.isEmpty && message.text.isEmpty){
      scaffold.currentState.showSnackBar(
        SnackBar(content: Text("All Spaces are Empty"),
        ),
      );
    }
    else if(email.text.isEmpty){
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Email is Empty"),
        ),
      );
    }else if(fullName.text.isEmpty){
      scaffold.currentState.showSnackBar(SnackBar(content: Text("FullName Is Empty"),
      ),
      );
    }

    else if(!regExp.hasMatch(email.text)){
      scaffold.currentState.showSnackBar(SnackBar(content: Text("Email is Not Valid"),
      ),
      );
    }
    else if (message.text.isEmpty){
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Message Is Too Short"),
        ),
      );
    }
    else{}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffold,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back,
              color: Colors.black,
              size: 20,
            ),
            onPressed: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx)=>HomePage()));
            }),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Contact Us", style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w900,
        ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyTextFormField(
                      controller: fullName,
                      title: "Full Name",
                    ),
                    MyTextFormField(
                      controller: email,
                      title: "Email",
                    ),
                    MyTextFormField(
                      controller: message,
                      title: "Message",
                    ),
                    MyButton(
                      name: "Send",
                      onPressed: (){
                         validation();
                      },
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
