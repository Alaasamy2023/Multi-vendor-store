import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/constants.dart';
import '../../error_layout/NoResultFoundScreen.dart';
import '../../lists/list_comments.dart';
import '../../lists/list_prodect_v.dart';

import 'package:http/http.dart' as http;
import '../../lists/prodect_list/ProdectMain_body.dart';
import '../../lists/prodect_list/list_desc_prodect.dart';
import '../../lists/prodect_list/list_questions.dart';
import '../../lists/store_profile_from_user/general.dart';

// ignore: camel_case_types
class store_profile_from_user extends StatefulWidget {
  final id_store;
  final product;
  const store_profile_from_user({
    Key? key,
    this.id_store,
    required this.product,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _store_profile_from_userMainState createState() =>
      _store_profile_from_userMainState();
}

// ignore: camel_case_types
class _store_profile_from_userMainState extends State<store_profile_from_user> {
  static var id_store;
  static var product;
//widget.id_prodect.toString()
//......................................................................

  add_visit(String link, String user_id, String store_id, String table) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');

        var url = link;

        http.post(Uri.parse(url), body: {
          "user_id": user_id,
          "store_id": store_id,
          "table": table,
        });

        toasty(context, 'تم ');
      }
    } on SocketException catch (_) {
      // ignore: avoid_print
      print('not connected');
      toasty(context, 'not connected');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoResultFoundScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    add_visit(linkadd_follow, "3", "3", "visit_store");
  }

//......................................................................
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
                  [],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: "عام  ",
                    ),
                    Tab(
                      text: "منتجاتنا",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    General(product: widget.product),
                    ListProdectV(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //........................................................
    );
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
          children: [
            ////////////////////////////
            const SizedBox(
              width: 15.0,
            ),
            Text(
              widget.product['store_name'].toString(),
              style: const TextStyle(
                color: Color.fromARGB(255, 37, 36, 36),
              ),
            ),
          ],
        ),
      ),
      actions: [
        like(),
        IconButton(
          icon: const Icon(
            Icons.comment,
            size: 26,
            color: Colors.grey,
          ),
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const Prodect_saved()));
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.share,
            size: 26,
            color: Color.fromARGB(255, 22, 25, 27),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

// //....................................................................................
//.........................................................
//.........................................................//.........................................................
  Widget like() {
    if (widget.product['following'] == "1") {
      return LikeButton(
        onTap: onLikeButtonTapped,
        size: 30,
        circleColor:
            CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
        bubblesColor: BubblesColor(
          dotPrimaryColor: Color(0xff33b5e5),
          dotSecondaryColor: Color(0xff0099cc),
        ),
        likeBuilder: (isLikeds) {
          return Icon(
            Icons.favorite,
            color: isLikeds ? Colors.grey : Color.fromARGB(255, 245, 3, 35),
            size: 30,
          );
        },
      );
    } else {
      return LikeButton(
        onTap: onLikeButtonTapped,
        size: 30,
        circleColor: CircleColor(
            start: Color.fromARGB(255, 230, 16, 62),
            end: Color.fromARGB(255, 226, 19, 19)),
        bubblesColor: BubblesColor(
          dotPrimaryColor: Color(0xff33b5e5),
          dotSecondaryColor: Color(0xff0099cc),
        ),
        likeBuilder: (isLikeds) {
          return Icon(
            Icons.favorite,
            color: isLikeds ? Color.fromARGB(255, 245, 3, 35) : Colors.grey,
            size: 30,
          );
        },
      );
    }
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    if (isLiked == true) {
      toasty(context, "true");

      add_like(linkdelet_follow, "3", "3", "follow");

      //   "product_id": "1",
      // "user_id": "2",
      //  "table": "like_product",

    }

    if (isLiked == false) {
      toasty(context, "false");
      add_like(linkadd_follow, "3", "3", "follow");
    }

    return !isLiked;
  }

//..............................................................................

  add_like(String link, String user_id, String store_id, String table) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');

        var url = link;

        http.post(Uri.parse(url), body: {
          "user_id": user_id,
          "store_id": store_id,
          "table": table,

          //   "product_id": "1",
          // "user_id": "2",
          //  "table": "like_product",
        });

        // ignore: use_build_context_synchronously
        toasty(context, 'تم ');

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Login()));
      }
    } on SocketException catch (_) {
      // ignore: avoid_print
      print('not connected');
      toasty(context, 'not connected');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoResultFoundScreen()),
      );
    }
  }

//..............................................................................

//.........................................................
//.........................................................

}
