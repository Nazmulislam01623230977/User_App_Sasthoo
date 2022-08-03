import 'package:flutter/material.dart';
import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../generated/l10n.dart';

class PaymentOptionPage extends StatefulWidget {
  PaymentOptionPage({Key key}) : super(key: key);

  @override
  State<PaymentOptionPage> createState() => _PaymentOptionPageState();
}

class _PaymentOptionPageState extends State<PaymentOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff128041),
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Stack(
              children: const [
                Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
                Positioned(
                  child: Icon(
                    Icons.brightness_1,
                    color: Colors.red,
                    size: 9,
                  ),
                )
              ],
            ),
            onPressed: () {
              // do something
            },
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 20),
          //   child: CircleAvatar(
          //     backgroundColor: Colors.white,
          //     radius: 15,
          //     // child: Image.asset(
          //     //   "assets/images/logo.png",
          //     //   height: 80,
          //     //   width: 80,
          //     // ),
          //   ),
          // ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 35, right: 35, bottom: 45),
            child: Text(
              S.of(context).payment_paymenthead,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SizedBox(
              height: 400,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .popAndPushNamed(RouteManeger.doneAppoinment_page);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 20,
                        width: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/bkash.png'),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                  child: Text(
                                S.of(context).payment_bkash,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/nagad.png'),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              S.of(context).payment_nagad,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/rocket.png',
                            height: 50,
                            width: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                                child: Text(
                              S.of(context).payment_rocket,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/credit.png',
                            height: 50,
                            width: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            child: Center(
                                child: Text(
                              S.of(context).payment_card,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.green,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
