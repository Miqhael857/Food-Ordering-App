import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_signinapp/screens/homepage.dart';
import 'package:flutter_signinapp/screens/login.dart';
import 'package:flutter_signinapp/widget/myPasswordTextFormField.dart';
import 'package:flutter_signinapp/widget/myTextFormField.dart';
import 'package:flutter_signinapp/widget/mybutton.dart';
import 'package:flutter_signinapp/widget/signuporhaveanaccount.dart';
import 'package:flutter_signinapp/widget/toptitle.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isMale = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();
  static String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = new RegExp(p);
  bool isLoading = false;
   UserCredential authResult;
   void submit()async{
     setState(() {
       isLoading = true;
     });
     try{
       authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: email.text, password: password.text);
     } on PlatformException catch(e){
       String message = "Please Check Your Internet Connection";
       if(e.message != null){
         message = e.message.toString();
       }
       scaffold.currentState.showSnackBar(
         SnackBar(content: Text(message),
       ),
       );
       setState(() {
         isLoading = false;
       });
     } catch(e){
       setState(() {
         isLoading = false;
       });
       scaffold.currentState.showSnackBar(
         SnackBar(content: Text(e.toString()),
         ),
       );
     }
   await FirebaseFirestore.instance.collection
     ("UserData").doc(authResult.user.uid).set({
     "UserName":fullName.text,
     "UserId":authResult.user.uid,
     "UserEmail":email.text,
     "UserNumber":phoneNumber.text,
     "UserAddress":address.text,
     "UserGender":isMale==false?"Male":"Female",

   });
     Navigator.of(context).pushReplacement(
         MaterialPageRoute(builder: (ctx)=>HomePage(),
         ),
     );
     setState(() {
       isLoading = false;
     });
   }


  void validation(){
    if(email.text.isEmpty &&
        password.text.isEmpty &&
        fullName.text.isEmpty &&
        address.text.isEmpty &&
        phoneNumber.text.isEmpty){
      scaffold.currentState.showSnackBar(
        SnackBar(content: Text("All Spaces are Empty"),
        ),
      );
    }
    else if(fullName.text.isEmpty){
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("FullName is Empty"),
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
    }
    else if(phoneNumber.text.isEmpty){
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("PhoneNumber is Empty"),
        ),
      );
    }
    else if(phoneNumber.text.length < 11){
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Phone Number not Complete"),
        ),
      );
    }
    else if(password.text.isEmpty){
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

  Widget _buildAllTextFormField(){
    return  Container(
      height: 400,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyTextFormField(
                controller: fullName,
                title: "Full Name",
              ),
              SizedBox(height: 5,),
              MyTextFormField(
                controller: email,
                title: "Email",
              ),
              SizedBox(height: 5,),
              MyTextFormField(
                controller: phoneNumber,
                title: "Phone Number",
              ),
              SizedBox(height: 5,),
              MyTextFormField(
                controller: address,
                title: "Address",),
              SizedBox(height: 5,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    isMale= !isMale;
                  });
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    isMale==false?"Female":"Male", style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),),
                  decoration: BoxDecoration(
                      color: Color(0xfff5d8e4),
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              SizedBox(height: 5,),
              MyPasswordTextFormField(
                controller: password,
                title: "Password",
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildButtonPart(){
    return isLoading==false?MyButton(
      name: "Sign Up", onPressed: (){validation();
    },
    ) : Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSignUpOrHaveAccount(){
    return SignUpOrHaveAccount(
      onTap: (){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Login()));
      },
      title: "I Have An Account,",subTitle: "Login",);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        key: scaffold,
    body: Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TopTitle(title: "SignUp", subTitle: "Create An Account",),
               _buildAllTextFormField(),
               _buildButtonPart(),
               _buildSignUpOrHaveAccount(),
            ],
          ),
        ],
      ),
    ),
    );
  }
}
