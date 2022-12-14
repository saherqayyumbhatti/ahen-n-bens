import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'fooddata.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.food}) : super(key: key);

  @override
  final Food food;

  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  int quantity = 1;
  bool _isButtonClicked=false;
  Widget build(BuildContext context) {
    int price;
    price = quantity * widget.food.price;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.black,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.angleLeft,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _isButtonClicked=!_isButtonClicked;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: _isButtonClicked ? Colors.red:Colors.black
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    widget.food.image,
                  ),
                )),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: double.infinity,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.35),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)
                    )),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 20, left: 40, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.food.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          ),
                          Text(
                            "\$" + price.toString(),
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 45,
                          width:MediaQuery.of(context).size.width*0.2,
                          child: Card(
                            elevation: 10,
                            color: Colors.white,
                            shadowColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text("⭐" +widget.food.rating.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          width:MediaQuery.of(context).size.width*0.3,
                          child: Card(
                            elevation: 10,
                            color: Colors.white,
                            shadowColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text("🔥"+" "+widget.food.calaries,style: TextStyle(fontWeight: FontWeight.bold))),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          width:MediaQuery.of(context).size.width*0.3,
                          child: Card(
                            elevation: 10,
                            color:Colors.white,
                            shadowColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text("🕒"+" " +widget.food.time,style: TextStyle(fontWeight: FontWeight.bold))),
                          ),
                        )
                      ],
                    ),
                     Padding(
                       padding: const EdgeInsets.only(left: 40,right: 40),
                       child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Description:', style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),),
                          Text(widget.food.description2)
                        ],
                    ),
                     ),
                    Center(
                      child: FloatingActionButton(
                        child: Icon(Icons.add),
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                /*Padding(
                  padding: const EdgeInsets.only(
                      top: 60, bottom: 20, left: 40, right: 40),
                  child:
                ),*/
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.yellow,
                ),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.30,
                  left: MediaQuery.of(context).size.height * 0.16,
                ),
                width: MediaQuery.of(context).size.height * 0.2,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            quantity--;
                          });
                        },
                        icon: Center(
                            child: Icon(
                          Icons.minimize_outlined,
                        ))),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
