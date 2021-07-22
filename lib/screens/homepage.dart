
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signinapp/provider/myprovider.dart';
import 'package:flutter_signinapp/screens/login.dart';
import 'package:flutter_signinapp/widget/about.dart';
import 'package:flutter_signinapp/widget/checkout.dart';
import 'package:flutter_signinapp/widget/contact.dart';
import 'package:flutter_signinapp/widget/detail_screen.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildSingleFeature({context, String foodTitle, foodSubTitle,String rating, String price,String assets,}){
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 30),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            height: 210,
            width: 200,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(foodTitle, style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).accentColor,
                ),),
                Text(foodSubTitle, style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[600],),
                      SizedBox(width: 5,),
                      Text("$rating Ratings", style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      ),
                      SizedBox(width: 5,),
                      Text("\$$price", style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).accentColor,
                      ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.cyanAccent,
          maxRadius: 70,
          backgroundImage: AssetImage("assets/$assets.jpg"),
        ),
      ],
    );
  }

  Widget _buildSingleCategory({String assets, String name,}){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        height: 200,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(assets),
                  ),
              ),
            ),
            Text(name, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900
            ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopPart(context){
    return     Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              margin:
              EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.sort,
                      size: 35,
                      color: Colors.white,),
                    onPressed: (){
                      _scaffoldKey.currentState.openDrawer();
                    },
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.notifications,
                        size: 35,
                        color: Colors.white,),
                      onPressed: (){
                        FirebaseAuth.instance.signOut();
                      }
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  child:  Column(
                    children: [
                      Container(
                        height: 100,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 40,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                maxRadius: 40,
                                backgroundImage: AssetImage("assets/face.jpg"),
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 200,
                              child: ListTile(
                                title: Text("Do You Need",
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                subtitle: Text("food?",
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildBottomPart(context){
    return Expanded(
      flex: 2,
      child:  Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color(0xfff2f3f4),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 190,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myProvider.getCategoryModelList.length,
                      itemBuilder: (ctx, index) =>
                          _buildSingleCategory(
                              name: myProvider.getCategoryModelList[index].name,
                              assets: myProvider.getCategoryModelList[index].assets ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).accentColor,
                  ),),
                  Text("see all", style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).accentColor,
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
           _buildFeatureProduct(context),
          ],
        ),
      ),
    );
  }
  MyProvider myProvider;
  Widget _buildFeatureProduct(context){
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 240,
                    child: ListView.builder(
                        itemBuilder: (ctx,index) =>
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (ctx) => DetailScreen(
                                      foodName: myProvider.featureModelList[index].foodTitle,
                                      foodTitle: myProvider.featureModelList[index].foodSubtitle,
                                      assets: myProvider.featureModelList[index].foodassets,
                                      price: myProvider.featureModelList[index].price,
                                    ),));
                              },
                              child: _buildSingleFeature(
                          context: context,
                          foodTitle: myProvider.featureModelList[index].foodTitle,
                          foodSubTitle:  myProvider.featureModelList[index].foodSubtitle,
                          price: myProvider.featureModelList[index].price,
                          rating:  myProvider.featureModelList[index].rating,
                          assets:  myProvider.featureModelList[index].foodassets,
                        ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyDrawer(context){
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/face.jpg"),
            ),
            accountName: Text("Mary"),
            accountEmail: Text("MaryConnor@gmail.com"),
          ),

          ListTile(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx)=>Contact()));
            },
            leading: Icon(Icons.contact_phone,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            title: Text("Contact Us",),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx)=>About()));
            },
            leading: Icon(Icons.info,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            title: Text("About Us"),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx)=>CheckOut()));
            },
            leading: Icon(Icons.shopping_cart,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            title: Text("Order"),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx)=>Login()));
            },
            leading: Icon(Icons.exit_to_app,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            title: Text("LogOut"),
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey= GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
   myProvider=Provider.of<MyProvider>(context);
   myProvider.getCategoryProduct();
   myProvider.getFeatureFood();
    return Scaffold(
      key: _scaffoldKey,
    drawer: _buildMyDrawer(context),
    body:  SafeArea(
        child: Container(
          child:  Column(
            children: [
              _buildTopPart(context),
              _buildBottomPart(context),
            ],
          ),
        ),
    ),
    );
  }
}
