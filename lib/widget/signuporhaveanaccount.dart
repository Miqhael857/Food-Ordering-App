import 'package:flutter/material.dart';
class SignUpOrHaveAccount extends StatelessWidget {
  final String title,subTitle;
  final Function onTap;
  SignUpOrHaveAccount({this.onTap,this.title, this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(
          fontSize: 15,
          color: Colors.black,),),
        GestureDetector(
          onTap: onTap,
          child: Text(subTitle, style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
          ),),
        ),
      ],
    );
  }
}
