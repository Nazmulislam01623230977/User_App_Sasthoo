import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Route/route.dart';
import 'controller/change_language.dart';
import 'controller/loginController.dart';
import 'generated/l10n.dart';

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpoverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) {
          return ChangeNotifierProvider<LanguageChangeProvider>(
              create: (context) => LanguageChangeProvider(),
              child: Builder(
                builder: (context) => MaterialApp(
                  locale:
                      Provider.of<LanguageChangeProvider>(context, listen: true)
                          .currentLocale,
                  localizationsDelegates: [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  debugShowCheckedModeBanner: false,
                  supportedLocales: S.delegate.supportedLocales,
                  title: 'Digital Sasthoo',
                  theme:
                      Provider.of<LanguageChangeProvider>(context, listen: true)
                          .currentheme,
                  initialRoute: RouteManeger.loginmainpage,
                  onGenerateRoute: RouteManeger.generateroute,
                ),
              ));
        },
        designSize: const Size(428, 926)
        // child: ChangeNotifierProvider<LanguageChangeProvider>(
        //   create: (context) => LanguageChangeProvider(),
        //   child: Builder(
        //     builder: (context) => MaterialApp(
        //       locale: Provider.of<LanguageChangeProvider>(context, listen: true)
        //           .currentLocale,
        //       localizationsDelegates: [
        //         S.delegate,
        //         GlobalMaterialLocalizations.delegate,
        //         GlobalWidgetsLocalizations.delegate,
        //         GlobalCupertinoLocalizations.delegate,
        //       ],
        //       debugShowCheckedModeBanner: false,
        //       supportedLocales: S.delegate.supportedLocales,
        //       title: 'Digital Sasthoo',
        //       theme: Provider.of<LanguageChangeProvider>(context, listen: true)
        //           .currentheme,
        //       initialRoute: RouteManeger.loginmainpage,
        //       onGenerateRoute: RouteManeger.generateroute,
        //     ),
        //   )
        // )
        );
  }
}

class LoginFunction extends StatefulWidget {
  @override
  _LoginFunctionState createState() => _LoginFunctionState();
}

class _LoginFunctionState extends State<LoginFunction> {
  var token;
  var userdata;
  var users;
  var userType;
  _askquetionforpage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    if (token != null) {
      LoginController().userdata(context);
      userdata = sharedPreferences.getString('userdata');
      users = jsonDecode(userdata);
      var userType = users['user_type'];
      if (userType == "user") {
        Navigator.of(context).popAndPushNamed(RouteManeger.dashboad_page);
        print('$token');
      }
      if (userType != "user") {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.clear();
        internaterror("Credential not found", context);
        Navigator.of(context).popAndPushNamed(RouteManeger.splashs_page);
      }
    }

    if (token == null) {
      Navigator.of(context).popAndPushNamed(RouteManeger.splashs_page);
    }
  }

  @override
  void initState() {
    super.initState();
    _askquetionforpage();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void internaterror(String massge, BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(massge),
      action: SnackBarAction(
          label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

cerculerShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        );
      });
}
