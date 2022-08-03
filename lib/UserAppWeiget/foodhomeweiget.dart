
import 'package:flutter/material.dart';

import '../UserModel/foodhomemodel.dart';

class FoodHomeWeiget extends StatelessWidget {
  final FoodHomelist foodlist;
  const FoodHomeWeiget({Key key, this.foodlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 59, bottom: 45),
            child: Image.asset(foodlist.arrowicon),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 0, right: 24),
                child: Text(
                  foodlist.itemname,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 14),
                child: Text(
                  foodlist.detills,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 147, 148, 151)),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 0, left: 45, bottom: 15, top: 15),
            child: Image.asset(
              foodlist.imageurl,
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.width * .2,
            ),
          )
        ],
      ),
    );
  }
}
