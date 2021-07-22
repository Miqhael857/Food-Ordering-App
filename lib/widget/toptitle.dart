import 'package:flutter/material.dart';
class TopTitle extends StatelessWidget {
  final String title, subTitle;
  TopTitle({this.title, this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style:  TextStyle(
            fontSize: 30,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),),
          Text(subTitle, style:  TextStyle(
            fontSize: 25,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),),
        ],
      ),
    );
  }
}
