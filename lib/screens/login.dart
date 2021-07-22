import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signinapp/screens/homepage.dart';
import 'package:flutter_signinapp/screens/signup.dart';
import 'package:flutter_signinapp/widget/myPasswordTextFormField.dart';
import 'package:flutter_signinapp/widget/myTextFormField.dart';
import 'package:flutter_signinapp/widget/mybutton.dart';
import 'package:flutter_signinapp/widget/signuporhaveanaccount.dart';
import 'package:flutter_signinapp/widget/toptitle.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  bool isLoading = false;
  UserCredential authResult;
  void submit()async{
    setState(() {
      isLoading = true;
    });
    try{
      authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx)=>HomePage(),
        ),
      );
    } on PlatformException catch(e){
      String message = "Please Check Your Internet Connection";
      if(e.message != null){
        message = e.message.toString();
      }
      scaffold.currentState.showSnackBar(
        SnackBar(content: Text(message.toString()),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch(e){
      scaffold.currentState.showSnackBar(
        SnackBar(content: Text(e.toString()),
        ),
      );
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }


  static String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = new RegExp(p);
  void validation(){
    if(email.text.isEmpty && password.text.isEmpty){
      scaffold.currentState.showSnackBar(
          SnackBar(content: Text("Both Spaces are Empty"),
          ),
      );
    }
    else if(email.text.isEmpty){
      scaffold.currentState.showSnackBar(
          SnackBar(
              content: Text("Email is Empty"),
          ),
      );
    } else if(!regExp.hasMatch(email.text)){
      scaffold.currentState.showSnackBar(SnackBar(content: Text("Email is Not Valid"),
      ),
      );
    } else if(password.text.isEmpty){
      scaffold.currentState.showSnackBar(SnackBar(content: Text("Password Is Empty"),
      ),
      );
    }

    else if (password.text.length < 8){
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Password Is Too Short"),
      ),
      );
    }
    else{
      submit();
    }
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState> ();

  final TextEditingController password = TextEditingController();
   Widget _buildAllTextFormFilledPlace(){
     return Center(
       child: Container(
         height: 200,
         width: double.infinity,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             MyTextFormField(controller: email, title: "Email",),
             SizedBox(height: 10,),
             MyPasswordTextFormField(controller: password, title: "Password",),
           ],
         ),

       ),
     );
   }
   Widget _buildButtonPart(){
     return  isLoading==false?MyButton(
       name: "Login",
       onPressed: (){validation();},
     ) : Center(child: CircularProgressIndicator(),
     );
   }
   Widget _buildSignUp0rHaveAccount(){
     return  SignUpOrHaveAccount(
       onTap: (){
         Navigator.of(context).pushReplacement(
             MaterialPageRoute(builder: (context) => SignUp()));
       },
       title: "I Don't Have An Account?", subTitle: "Sign Up",);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffold,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
           TopTitle(
             title: "Login",
             subTitle: "Welcome Back!",
           ),
              _buildAllTextFormFilledPlace(),
              _buildButtonPart(),
              SizedBox(height: 10,),
             _buildSignUp0rHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
