import 'package:flutter/material.dart';
import 'package:flutter_signinapp/screens/homepage.dart';
import 'package:flutter_signinapp/widget/mybutton.dart';
class CheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 250,
        color: Theme.of(context).accentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: Text("Total", style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25, color: Colors.white,
              ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("\$50",
                  style: TextStyle(color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            MyButton(
              name: "Order",
              onPressed: (){

              },
            ),

          ],
        ),
      ),
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
        title: Text("Check Out", style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w900,
        ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                height: 70,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/pancake.jpg"),
                  ),
                  title: Row(
                    children: [
                      Text("x1"),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Pancake",
                            style: TextStyle(
                              fontSize: 18,
                            ),),
                          SizedBox(height: 10,),
                          Text("Star Hotel",
                            style: TextStyle(
                              fontSize: 18,),
                          ),
                            ],
                      ),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("\$50",
                      style: TextStyle(color: Theme.of(context).accentColor,
                        fontSize: 20,
                         fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                height: 70,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/pancake.jpg"),
                  ),
                  title: Row(
                    children: [
                      Text("x1"),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Pancake",
                            style: TextStyle(
                              fontSize: 18,
                            ),),
                          SizedBox(height: 10,),
                          Text("Star Hotel",
                            style: TextStyle(
                              fontSize: 18,),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("\$50",
                      style: TextStyle(color: Theme.of(context).accentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
