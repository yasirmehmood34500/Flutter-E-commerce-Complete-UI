import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';
class DetailsScreen extends StatefulWidget {
   static String routeName = "/details";
   DetailsScreen({Key key}):super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
 void initState(){
      super.initState();
      print("Detail Page Done");
    }

  @override
  Widget build(BuildContext context) {
    final agrs = ModalRoute.of(context).settings.arguments;
  
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: 4.4),
      // body: Body(product: agrs), 
      body: Text("Detail Page"),
    );
  }
}

// class ProductDetailsArguments {
//   final Product product;

//   ProductDetailsArguments({@required this.product});
// }
