import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
// import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import '../../home/home_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:http/http.dart' as http;
import '../../../api/api_conf.dart' as ApiBase;

// This is the best practice
import '../components/splash_content_n.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var splashs;
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    // var url ="http://192.168.18.58:8080/Git-PHP-Project/PHP-HTTP_AUTHORIZATION/Basic_Auth/index.php";
    // var res = await http.get(url, headers: {"authorization": "Basic eWFzaXI6MTIz"},);
    // var splashs = jsonDecode(res.body);
    var url = ApiBase.baseURL + "app_splash_screen.php";
    // print(url);
    var res = await http.get(
      url,
      headers: {"authorization": "Basic eWFzaXI6MTIz"},
    );
    splashs = jsonDecode(res.body);
    // print(splashs);
    setState(() {});
  }

  int currentPage = 0;
  // List<Map<String, String>> splashs = [
  //   {
  //     "header": "Flatros",
  //     "text": "Welcome to Flatros, Let’s shop!",
  //     "image_name": "assets/images/splash_1.png"
  //   },
  //   {
  //     "header": "Shopping",
  //     "text":
  //         "We help people conect with store \naround United State of America",
  //     "image_name": "assets/images/splash_2.png"
  //   },
  //   {
  //     "header": "Multi Category",
  //     "text": "FInal Screen",
  //     "image_name": "assets/images/splash_3.png"
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashs.length,
                itemBuilder: (BuildContext context, int index) => SplashContent(
                  header: splashs[index]["header"],
                  image: splashs[index]["image_name"],
                  text: splashs[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashs.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
