// OrderProdectHome

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../componnt/widgets/filter.dart';
import '../../constant/constants.dart';
import '../lists/list_prodect_v.dart';
import '../lists/list_sub_catagory.dart';
import '../lists/store_list_v.dart';
import 'prodect_saved.dart';
import 'store_follwing.dart';

// ignore: camel_case_types
class OrderProdectHome extends StatefulWidget {
  const OrderProdectHome({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _sub_catagoryState createState() => _sub_catagoryState();
}

// ignore: camel_case_types
class _sub_catagoryState extends State<OrderProdectHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Center(
                        child: Text(
                          "عند وصول الاوردر يمكنك ترك مراجعه وتعليق على المنتج ليستفيد غيرك بتجربتك",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: "طلبات منتظره",
                    ),
                    Tab(
                      text: "طلبات تم توصيلها",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListProdectV(),
                    ListProdectV(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // //....................................................................................

  _mBottomSheet7(var context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: radiusOnly(topLeft: 32, topRight: 32)),
      context: context,
      builder: (builder) {
        return const Filter();
      },
    );
  }

// //....................................................................................

}

AppBar homeAppBar(context) {
  return AppBar(
    leading: const BackButton(color: Colors.black),
    // automaticallyImplyLeading: false,
    backgroundColor: const Color(0xFFEDF0F6),
    elevation: 0.0,
    titleSpacing: 20.0,
    title: Center(
      child: Row(
        children: const [
          ////////////////////////////
          SizedBox(
            width: 15.0,
          ),
          Text(
            'الطلبات',
            style: TextStyle(
              color: Color.fromARGB(255, 37, 36, 36),
            ),
          ),
        ],
      ),
    ),
  );
}

  // //....................................................................................

