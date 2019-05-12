import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() { 
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(
    MaterialApp(
      home: HomePage(),
    )
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double _circleWidth = width-100;
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.red,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.event_seat, color: Colors.red)),
            Tab(icon: Icon(Icons.timer, color: Colors.grey)),
            Tab(icon: Icon(Icons.shopping_cart, color: Colors.grey)),
            Tab(icon: Icon(Icons.person_outline, color: Colors.grey))
          ],
        ),
      ),
      backgroundColor: Color(0xffedeff2),
      body: ListView(      
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Colors.red,
                height: 230,
                width: double.infinity,
              ),
              Positioned(
                right: _circleWidth * 0.7,
                bottom: 40,
                child: Container(
                  height: _circleWidth,
                  width: _circleWidth,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: _circleWidth * 0.9,
                bottom: 100,
                child: Container(
                  height: _circleWidth,
                  width: _circleWidth,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    buildContainer(50),
                    buildContainer(40),
                    buildContainer(30),
                    buildContainer(20),
                    buildContainer(10),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                SizedBox(height: 65,),
                    Row(
                    children: <Widget>[
                      SizedBox(width: 20),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,style: BorderStyle.solid,width: 1.5),
                          image: DecorationImage(
                            image: AssetImage('assets/avatar.png'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: width -150),
                      IconButton(onPressed: (){},icon: Icon(Icons.format_list_bulleted,size: 30,color: Colors.white),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: Text('Hello , Simo', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black87,decoration: TextDecoration.none)),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text('What do you want to buy?', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87,decoration: TextDecoration.none),),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(5.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.red,
                          ),
                          hintText: 'Search',
                          contentPadding:
                            EdgeInsets.only(left: 15.0, top: 15.0),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 70,
                width: double.infinity,
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(children: <Widget>[
                    Image.asset('assets/sofa.png',width: 50,height: 50,),
                    Text('Sofa',style: TextStyle(color: Colors.black),)
                  ],
                  ),
                  Column(children: <Widget>[
                    Image.asset('assets/wardrobe.png',width: 50,height: 50,),
                    Text('Wardrobe',style: TextStyle(color: Colors.black),)
                  ],
                  ),
                  Column(children: <Widget>[
                    Image.asset('assets/desks.png',width: 50,height: 50,),
                    Text('Desks',style: TextStyle(color: Colors.black),)
                  ],
                  ),
                  Column(children: <Widget>[
                    Image.asset('assets/dresser.png',width: 50,height: 50,),
                    Text('Dresser',style: TextStyle(color: Colors.black),)
                  ],
                  ),                  
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          buildContainerCart(width,'FinnNavion','assets/chair.jpg'),
          buildContainerCart(width,'FinnNavion','assets/anotherchair.jpg'),
          buildContainerCart(width,'FinnNavion','assets/ottoman.jpg'),
          buildContainerCart(width,'FinnNavion','assets/chair.jpg'),
        ],
      ),
    );
  }

  Container buildContainerCart(double width,String title, String imagePath) {
    return Container(
          margin: EdgeInsets.all(10),
          color: Colors.white,
          width: width,
          height: 200,
          child: Row(
            children: <Widget>[
              Image.asset(imagePath,width: (width-20)*0.4,),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(title,style: TextStyle(color: Colors.black87,fontSize:22,),),
                      SizedBox(width: 30.0 ),
                      Icon(Icons.favorite,color: Colors.red,),
                    ],
                  ),
                  Container(
                    width: (width-20)*0.4,
                    child: Text('Hello The FinnNavion product is the best of the our Company Please add this product in thecart'),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.red,
                        child: Center(child:Text('\$ 254',style: TextStyle(color: Colors.white, fontSize: 15),)),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.redAccent,
                        child: Center(child:Text('Add to cart',style: TextStyle(color: Colors.white, fontSize: 15))),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
  }

  Container buildContainer(double size) {
    return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white70,style:BorderStyle.solid),
            ),
          );
  }
}