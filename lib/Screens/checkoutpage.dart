import 'package:delivery_app/components/SearchBox.dart';
import 'package:delivery_app/constants.dart';
import 'package:delivery_app/restaurantModel.dart';
import 'package:delivery_app/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:delivery_app/Screens/dish.dart';
import 'package:delivery_app/Screens/wishList.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class checkout extends StatefulWidget {
  const checkout({Key? key}) : super(key: key);

  @override
  _checkoutState createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  @override
  Widget build(BuildContext context) {
    List e = userCart;
    return Scaffold(
      backgroundColor: Background_Color,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48.0, left: 16),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  iconSize: 25,
                  // onPressed: () {
                  //   Navigator.pop(context);
                  // },
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
                'CHECKOUT',
                style: TextStyle(
                    fontSize: 24,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16),
                  child: Text(
                    'Address details',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 16),
                  child: Text('change',
                      style: TextStyle(fontSize: 20, color: kPrimaryColor)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32),

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '1/234/6  uppal ',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Container(
                        height: 1,
                        color: kPrimaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'near ring road ,hyderabad  ',
                        style: TextStyle(
                            fontSize: 15, color: Colors.black.withOpacity(0.7)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Container(
                        height: 1,
                        color: kPrimaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '987654321',
                        style: TextStyle(
                            fontSize: 20, color: Colors.black.withOpacity(0.4)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Text(
                  'Delivery Method',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.check_box_outline_blank ),
                          SizedBox(width:48),
                          Text(
                            'Door Delivery ',
                            style: TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Container(
                        height: 1,
                        color: kPrimaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.check_box_outline_blank ),
                          SizedBox(width:48),
                          Text(
                            'Take Away ',
                            style: TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16),
                  child: Text(
                    'Order Summary',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 16),
                  child: Text('View Order',
                      style: TextStyle(fontSize: 18, color: kPrimaryColor)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 32),
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Total Bill ' ,style: TextStyle(
                          fontSize: 15, color: Colors.black),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text( '₹ ' +'1500 ' ,style: TextStyle(
                          fontSize: 15, color: Colors.black),),
                    ),

                  ],
                ),
              ),
            ),


          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(30),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => checkout(),
                ), // map == name,cost,id,offer.
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 105, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kPrimaryColor,
              ),
              child: Text(
                'PLACE ORDER ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
