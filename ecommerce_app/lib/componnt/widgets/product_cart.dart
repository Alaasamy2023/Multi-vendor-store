import 'dart:io';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:http/http.dart' as http;
import '../../app/error_layout/NoResultFoundScreen.dart';
import '../../app/lists/list_comments.dart';
import '../../app/screen/prodect/prodect_main.dart';

import '../../constant/constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.itemIndex,
    required this.product_data,
  }) : super(key: key);

  final int itemIndex;
  final product_data;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

//  int.parse(widget.product_data['if_offer_product'])

    // ignore: non_constant_identifier_names
    var offer_price = int.parse(widget.product_data['price']) -
        (int.parse(widget.product_data['price']) *
            (int.parse(widget.product_data['if_offer_nsba'].toString()) / 100));

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      height: 190.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProdectMain(
                        id_prodect: widget.product_data['id'].toString(),
                        product_data: widget.product_data,
                      )));
        },
        onLongPress: () {
          _mBottomSheet_list_comments(context);
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 166.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 25,
                      color: Colors.black12),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 160.0,
                width: 200.0,
                child: Image.network(
                  link_api_folder_img +
                      widget.product_data['main_photo'].toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 0.0,
                left: 0.0,
                child: Row(
                  children: <Widget>[
                    // IconButton(
                    //   icon: const Icon(Icons.favorite_border),
                    //   iconSize: 30.0,
                    //   // ignore: avoid_print
                    //   onPressed: () => print('Save post'),
                    // ),

                    like(),
                  ],
                )),
            int.parse(widget.product_data['if_offer_product'].toString()) == 1
                // widget.product_data['if_offer_product'] == 1
                ? Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: int.parse(widget.product_data['if_offer_product']
                                .toString()) ==
                            1
                        // widget.product_data['if_offer_product'] == 1
                        ? Row(
                            children: [
                              //offer

                              // Text('\$8.99',
                              //     style: TextStyle(
                              //         decoration: TextDecoration.lineThrough)),

                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        kDefaultPadding * 1, // 30 px padding
                                    vertical:
                                        kDefaultPadding / 5, // 5 px padding
                                  ),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Text(
                                    "خصم" +
                                        widget.product_data['if_offer_nsba']
                                            .toString() +
                                        '%',
                                    style: TextStyle(
                                      color: bgColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: const [],
                          ))
                : SizedBox(),

//.............................................................

            int.parse(widget.product_data['if_Delivery_product'].toString()) ==
                    1
                // widget.product_data['if_offer_product'] == 1
                ? Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: int.parse(widget.product_data['if_Delivery_product']
                                .toString()) ==
                            1
                        // widget.product_data['if_offer_product'] == 1
                        ? Row(
                            children: [
                              //offer

                              // Text('\$8.99',
                              //     style: TextStyle(
                              //         decoration: TextDecoration.lineThrough)),

                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        kDefaultPadding * 1, // 30 px padding
                                    vertical:
                                        kDefaultPadding / 5, // 5 px padding
                                  ),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Text(
                                    "توصيل مجانى",
                                    style: TextStyle(
                                      color: bgColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: const [],
                          ))
                : SizedBox(),

//.............................................................
            Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.product_data['avg_rate_product'].toString(),
                          // "${int.parse(widget.product_data['avg_rate_product'])}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.star_rate,
                          size: 20,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    // IconButton(
                    //   icon: const Icon(Icons.bookmark_border),
                    //   iconSize: 30.0,
                    //   // ignore: avoid_print
                    //   onPressed: () => print('Save post'),
                    // ),

                    save(),
                  ],
                )),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: SizedBox(
                height: 136.0,
                // Because oure image is 200 width, then: width - 200
                width: size.width - 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        widget.product_data['title'].toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        widget.product_data['sub_title'].toString(),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 8, bottom: 8),
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child:

//..................................................

                            int.parse(widget.product_data['if_offer_product']
                                        .toString()) ==
                                    1
                                ? Row(
                                    children: [
                                      Text(
                                        'السعر: \$${widget.product_data['price'].toString()}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        ' ${offer_price}\$',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  )
                                : Text(
                                    'السعر: \$${widget.product_data['price'].toString()}'),

//..................................................
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //.............................................................

            // Positioned(
            //   top: 0.0,
            //   right: 0.0,
            //   child: SizedBox(
            //     height: 136.0,
            //     // Because oure image is 200 width, then: width - 200
            //     width: size.width - 180,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Spacer(),
            //         Padding(
            //           padding: const EdgeInsets.all(kDefaultPadding),
            //           child: Container(
            //             padding: EdgeInsets.symmetric(
            //               horizontal: kDefaultPadding * 1.5, // 30 px padding
            //               vertical: kDefaultPadding / 5, // 5 px padding
            //             ),
            //             decoration: BoxDecoration(
            //               color: kSecondaryColor,
            //               borderRadius: BorderRadius.circular(22),
            //             ),
            //             child: Text('السعر: \$${product.price}'),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
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

// ignore: non_constant_identifier_names
  _mBottomSheet_list_comments(context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: radiusOnly(topLeft: 32, topRight: 32)),
      context: context,
      builder: (builder) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return const SizedBox(
                height: 500,
                child: list_comments(
                  id_prodect: 1,
                ));
          },
        );
      },
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

}
