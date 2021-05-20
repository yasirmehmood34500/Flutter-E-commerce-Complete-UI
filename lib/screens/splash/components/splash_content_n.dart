import 'package:flutter/material.dart';
import '../../../api/api_conf.dart' as ApiBase;
import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
    this.header,
  }) : super(key: key);
  final String text, image, header;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          header,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              image: DecorationImage(
                  image: NetworkImage(ApiBase.splashURL + image),
                  fit: BoxFit.fill)),
        ),
        // Image.asset(
        //   image,
        //   height: getProportionateScreenHeight(265),
        //   width: getProportionateScreenWidth(235),
        // ),
      ],
    );
  }
}
