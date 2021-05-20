import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import '../../../api/api_conf.dart' as ApiBase;
import 'package:http/http.dart' as http;

class ProductList extends StatefulWidget {
  final String menuid;
  const ProductList({Key key, @required this.menuid}) : super(key: key);
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var products;
  void initState() {
    super.initState();
    var url = ApiBase.baseURL + "products.php?menu_id=" + widget.menuid;
    fetchdata(url);
  }

  fetchdata(url) async {
    var res = await http.get(url);
    products = jsonDecode(res.body);
    // print(products);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        products.length,
        (index) { 
          return ProductCard(product: products[index]);
          // return Text(products[index]["name"]);
        },
      ),
    );
  }
}