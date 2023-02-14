import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/constants.dart';
import '../../error_layout/NoResultFoundScreen.dart';
import '../../lists/list_comments.dart';
import '../../lists/list_prodect_v.dart';

import '../../lists/prodect_list/ProdectMain_body.dart';
import '../../lists/prodect_list/list_desc_prodect.dart';
import '../../lists/prodect_list/list_questions.dart';

import 'package:http/http.dart' as http;

class ProdectMain extends StatefulWidget {
  final id_prodect;
  final product_data;
  const ProdectMain({
    Key? key,
    this.id_prodect,
    this.product_data,
  }) : super(key: key);

  @override
  _ProdectMainState createState() => _ProdectMainState();
}

class _ProdectMainState extends State<ProdectMain> {
  static var id_prodect;
//widget.id_prodect.toString()
//............................................................................
//..............................................................................

  add_like(String link, String product_id, String user_id, String table) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');

        var url = link;

        http.post(Uri.parse(url), body: {
          "product_id": product_id,
          "user_id": user_id,
          "table": table,

          //   "product_id": "1",
          // "user_id": "2",
          //  "table": "like_product",
        });

        toasty(context, 'تم ');

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Login()));
      }
    } on SocketException catch (_) {
      print('not connected');
      toasty(context, 'not connected');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoResultFoundScreen()),
      );
    }
  }

//..............................................................................
//......................................................................

  add_visit(
      String link, String user_id, String product_id, String table) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');

        var url = link;

        http.post(Uri.parse(url), body: {
          "user_id": user_id,
          "product_id": product_id,
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
    add_visit(add_visit_product, "3", "3", "visit_product");
  }

//......................................................................
//............................................................................

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),

      body: DefaultTabController(
        length: 6,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.all(kDefaultPadding),
                    //   child: Center(
                    //     child: Text(
                    //       "عند وصول الاوردر يمكنك ترك مراجعه وتعليق على المنتج ليستفيد غيرك بتجربتك",
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 19,
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: "نظره عامه ",
                    ),
                    Tab(
                      text: "وصف المنتج",
                    ),
                    Tab(
                      text: "معلومات عن المنتج",
                    ),
                    Tab(
                      text: "مراجعات ",
                    ),
                    Tab(
                      text: "اساله ",
                    ),
                    Tab(
                      text: "منتجات مشابهه ",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ProdectMainBody(
                        id_prodect: widget.id_prodect.toString(),
                        product_data: widget.product_data),
                    list_desc_prodect(
                        id_prodect: 1, table: "description_product"),
                    list_desc_prodect(
                        id_prodect: 1, table: "information_product"),
                    const list_comments(
                      id_prodect: 1,
                    ),
                    const list_questions(
                      id_prodect: 1,
                    ),
                    ListProdectV(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //........................................................
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 40.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -2),
                blurRadius: 6.0,
              ),
            ],
            color: Colors.white,
          ),
          child:
              //...........................................
              TextButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => botton1()),
              // );
              toasty(context, 'طلب المنتج');
            },
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF8998FF),
              primary: Color(0xFF8998FF),
            ),
            child: Text(
              "طلب المنتج",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
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
          children: const [
            ////////////////////////////
            SizedBox(
              width: 15.0,
            ),
            Text(
              '',
              style: TextStyle(
                color: Color.fromARGB(255, 37, 36, 36),
              ),
            ),
          ],
        ),
      ),
      actions: [
        like(),
        const SizedBox(
          width: 10,
        ),
        save(),
        const SizedBox(
          width: 10,
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

//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................
  Widget like() {
    if (widget.product_data['if_like'] == "1") {
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

      add_like(linkdelet_like, "1", "2", "like_product");

      //   "product_id": "1",
      // "user_id": "2",
      //  "table": "like_product",

    }

    if (isLiked == false) {
      toasty(context, "false");
      add_like(linkadd_like, "1", "2", "like_product");
    }

    return !isLiked;
  }

//.........................................................//.........................................................

//.........................................................//.........................................................

  Widget save() {
    if (widget.product_data['if_save'] == "1") {
      return LikeButton(
        onTap: onLikeButtonTapped_save,
        size: 30,
        circleColor:
            CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
        bubblesColor: BubblesColor(
          dotPrimaryColor: Color(0xff33b5e5),
          dotSecondaryColor: Color(0xff0099cc),
        ),
        likeBuilder: (isLikeds) {
          return Icon(
            Icons.bookmark_border,
            color: isLikeds ? Colors.grey : Color.fromARGB(255, 245, 3, 35),
            size: 30,
          );
        },
      );
    } else {
      return LikeButton(
        onTap: onLikeButtonTapped_save,
        size: 30,
        circleColor: const CircleColor(
            start: Color.fromARGB(255, 230, 16, 62),
            end: Color.fromARGB(255, 226, 19, 19)),
        bubblesColor: BubblesColor(
          dotPrimaryColor: Color(0xff33b5e5),
          dotSecondaryColor: Color(0xff0099cc),
        ),
        likeBuilder: (isLikeds) {
          return Icon(
            Icons.bookmark_border,
            color: isLikeds ? Color.fromARGB(255, 245, 3, 35) : Colors.grey,
            size: 30,
          );
        },
      );
    }
  }

  Future<bool> onLikeButtonTapped_save(bool isLiked) async {
    if (isLiked == true) {
      toasty(context, "true");

      add_like(linkdelet_like, "1", "2", "save_product");
    }

    if (isLiked == false) {
      toasty(context, "false");
      add_like(linkadd_like, "1", "2", "save_product");
    }

    return !isLiked;
  }

//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................

// //....................................................................................
}
