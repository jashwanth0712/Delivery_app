import 'package:delivery_app/Screens/help_support.dart';
import 'package:delivery_app/Screens/trackingScreen.dart';
import 'package:delivery_app/Services/apiservices.dart';
import 'package:delivery_app/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:delivery_app/restaurantModel.dart';
import 'package:delivery_app/constants.dart';
class order_history extends StatefulWidget {
  const order_history({Key? key}) : super(key: key);

  @override
  _order_historyState createState() => _order_historyState();
}

class _order_historyState extends State<order_history> {
  var l;
  generateYourOrder(var orderItems) {
    String yourOrder = '';
    orderItems.forEach((map) {
      var req = menu.firstWhere((element) => element['id'] == map['id']);
      yourOrder +=
          map['count'].toString() + ' ' + req['item']['itemName'] + ',  ';
    });
    yourOrder = yourOrder.substring(0, yourOrder.length - 1);
    yourOrder += '.';
    return yourOrder;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background_Color,
      body: StreamBuilder(
        stream: initialisedOrders.stream,
        builder: (context, snapshot) {
          print('gotOrders = $gotOrders');
            if(snapshot.hasError){
              return errorScreen();
            }
            else{
              return (gotOrders)?Column(
                children: [
                  SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:40,left: 12),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor.withOpacity(0.2),
                          ),
                          child: IconButton(
                            iconSize: 25,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_outlined,
                              color: kTextColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 64, top: 48),
                        child: Text(
                          'MY ORDERS',
                          style: TextStyle(
                              fontSize: 24,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.6,
                    // TODO isempty then add lottie assets/search.json
                    child: ListView.builder(
                        itemBuilder:(context,index){
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>
                                    TrackingPage(myOrders[index]['orderId']?? myOrders[index]['_id'],myOrders[index]['branchId'])
                                  //help_and_support()
                                  )
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('ID: '+(myOrders[index]['orderId']?? myOrders[index]['_id'])),
                                    SizedBox(height:3),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(myOrders[index]['createdAt']?? '     -'),
                                        (myOrders[index]['delivered']==true)?Text('Delivered',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.green),)
                                            :(myOrders[index]['delivered']==false)?Text('Not Delivered',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red),):Text('-          '),

                                      ],
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text('Total Bill',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
                                        SizedBox(width: 16,),
                                        Text(myOrders[index]['amountPaid']??'-',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
                                        SizedBox(width: 16,),


                                      ],
                                    ),
                                    SizedBox(height:8),
                                    (myOrders[index]['orderItems']!=null)
                                        ?Text(generateYourOrder((myOrders[index]['orderItems'])),style: TextStyle(color:Colors.black),)
                                            :Text(""),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(height: 1,color: Colors.grey,),
                                    ),

                                  ],
                                ),
                              ),
                            )

                            // ListTile(
                            //   //onTap: orderTapped(myOrders[index]['orderId']?? myOrders[index]['_id'],myOrders[index]['branchId']),
                            //   title: Text(myOrders[index]['orderId']?? myOrders[index]['_id']),
                            //   //subtitle: myOrders[index]['createdAt'],
                            //   subtitle: Text(myOrders[index]['createdAt']?? ''),
                            // ),
                          );
                        },
                      itemCount: myOrders.length,
                    )
                  )
                ],
              ):loadingScreen();
            }
        }
      ),
    );
  }

   loadingScreen() {
    return Column(
            children: [
              SizedBox(height: 20,),
              Center(child: Lottie.asset('assets/history.json',repeat: true,height: 200,)),
            ],
          );
  }

   errorScreen() {
    return Center(
              child: Text('Unable to fetch your Orders!!'),
            );
  }
}


//TODO: change the ListTile ,edit the loading Screen and error Screen .