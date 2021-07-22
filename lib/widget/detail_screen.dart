import 'package:flutter/material.dart';
import 'package:flutter_signinapp/screens/homepage.dart';
import 'package:flutter_signinapp/widget/mybutton.dart';
class DetailScreen extends StatefulWidget {
  final String foodName, foodTitle, assets;
  final String price;
  DetailScreen({this.foodName, this.foodTitle, this.assets, this.price});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Widget _buildDetailText({context,String title, String subTitle, String tralingTitle, String tralingSubTitle}){
    return   Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),

              Text(tralingTitle,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ],
          ),

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subTitle,
                style: TextStyle(color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(tralingSubTitle,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int counter = 1;
  String totalPrice;
  @override
  Widget build(BuildContext context) {
    setState(() {
      totalPrice = widget.price * counter;
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back,
              color: Color(0xfffef0f7),
              size: 30,),
            onPressed: (){},
        ),

      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                 Expanded(
                   child: Container(
                     color: Color(0xfffef0f7),
                   ),
                 ),
                 Expanded(
                   flex: 3,
                 child:Container(
                   padding: EdgeInsets.symmetric(horizontal: 20),
                   width: double.infinity,
                  color: Color(0xfff8f8f8),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         height: 130,
                           alignment: Alignment.bottomLeft,
                           child: Text(widget.foodName, style: TextStyle(
                            color: Theme.of(context).primaryColor,
                             fontSize: 40,
                             fontWeight: FontWeight.bold,
                           ),
                           ),
                       ),
                       Text(widget.foodTitle, style: TextStyle(
                         color: Colors.grey,
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       ),
                       ),
                       Container(
                         height: 100,
                         color: Colors.lightBlue,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text("\$${totalPrice.toString()}",
                                     style: TextStyle(color: Theme.of(context).accentColor,
                                       fontSize: 25,
                                       fontWeight: FontWeight.w900,
                                     ),
                                   ),
                                   Container(
                                     height: 35,
                                     width: 100,
                                     decoration: BoxDecoration(
                                       color: Colors.lightBlue[100],
                                       borderRadius: BorderRadius.circular(10),
                                     ),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [
                                         GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                counter++;
                                              });
                                            },
                                            child: Icon(Icons.add,
                                              size: 30,
                                              color:Theme.of(context).accentColor,),
                                        ),
                                         Text(counter.toString(),
                                           style: TextStyle(color: Theme.of(context).accentColor,
                                             fontSize: 25,
                                             fontWeight: FontWeight.w900,
                                           ),
                                         ),
                                         GestureDetector(
                                           onTap: (){
                                             if(counter >1){
                                               setState(() {
                                                 counter--;
                                               });
                                             }
                                           },
                                           child: Icon(Icons.add,
                                             size: 30,
                                             color:Theme.of(context).accentColor,),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                           ],
                         ),
                       ),
                       _buildDetailText(
                         context: context,
                         title: "Weight",
                         subTitle: "128kg",
                         tralingTitle: "Mix Together",
                         tralingSubTitle: "Milk Egg , Dip",
                       ),
                       _buildDetailText(
                         context: context,
                         title: "Calories",
                         subTitle: "430 ccal",
                         tralingTitle: "Chicken in this",
                         tralingSubTitle: "mixture",
                       ),
                       MyButton(
                         name: "CheckOut",
                         onPressed: (){
                           Navigator.of(context).pushReplacement(
                               MaterialPageRoute(builder: (ctx) => HomePage(),));
                         },
                       ),
                     ],
                   ),
                ),
                 )
              ],
            ),
            Positioned(
              left: 100,
              child: Image(
                height: 250,
                width: 230,
                image: NetworkImage(widget.assets),),
            ),
          ],
        ),
      ),
    );
  }
}
