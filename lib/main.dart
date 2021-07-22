import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signinapp/provider/myprovider.dart';
import 'package:flutter_signinapp/screens/homepage.dart';
import 'package:flutter_signinapp/screens/login.dart';
import 'package:flutter_signinapp/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
        create: (ctx) => MyProvider(),
         child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          snackBarTheme: SnackBarThemeData(
            actionTextColor: Colors.white,
            backgroundColor: Colors.pinkAccent,
          ),
          primaryColor: Colors.pinkAccent,
          accentColor: Color(0xff04d4ee),
        ),
        home: StreamBuilder<Object>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return HomePage();
            }else{
              return Login();
            }
          }
        ),

      ),
    );
  }
}

