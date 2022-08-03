import 'package:flutter/material.dart';

import '../UserModel/activetabbarmodel.dart';

class ActiveTabbarWeiget extends StatelessWidget {
  final ActiveTablist active;
  const ActiveTabbarWeiget({Key key, this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 9, left: 23, right: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        active.date,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 9.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: 'Roboto'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text(
                          active.time,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Roboto'),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    active.amount,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Roboto'),
                  )
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(active.imageurl),
                      radius: 30.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                        width: 250,
                        child: Text(
                          active.text,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Roboto'),
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 23, right: 23),
                child: Divider(color: Color(0xff959595)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 23),
                child: Text(
                  active.secdule,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 9.0,
                      color: Color(0xff128041),
                      fontFamily: 'Roboto'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
