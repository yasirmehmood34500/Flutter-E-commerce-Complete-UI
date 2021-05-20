import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './product_list.dart';
import '../../../api/api_conf.dart' as ApiBase;
import '../../../size_config.dart';
import './section_title.dart';

class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  var url = ApiBase.baseURL + "menus.php";
  var menus;
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    menus = jsonDecode(res.body)["menu"];
    // print(menus);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(menus.length, (index) {
        return Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(0)),
            child: SectionTitle(title: menus[index]["name"], press: () {}),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ProductList(menuid: menus[index]["id"]),
          ),
        ]);
      }),
    );
  }
}
