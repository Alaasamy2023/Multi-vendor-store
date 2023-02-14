// ignore_for_file: non_constant_identifier_names

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../app/error_layout/NoResultFoundScreen.dart';
import '../../app/lists/list_comments.dart';
import '../../app/screen/store_profile_from_user/store_profile_from_user.dart';
import '../../constant/constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:http/http.dart' as http;

class store_card extends StatefulWidget {
  const store_card({
    Key? key,
    required this.itemIndex,
    required this.product,
    required this.press,
  }) : super(key: key);

  final int itemIndex;
  final product;
  final VoidCallback press;

  @override
  State<store_card> createState() => _store_cardState();
}

// ignore: camel_case_types
class _store_cardState extends State<store_card> {
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

  static var product;
//..............................................................................

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return store_part();

//     Container(
//       margin: const EdgeInsets.symmetric(
//         horizontal: kDefaultPadding,
//         vertical: kDefaultPadding / 2,
//       ),
//       height: 140.0,
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => store_profile_from_user()),
//           );
//         },
//         onLongPress: () {
//           _mBottomSheet_list_comments(context);
//         },
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Container(
//               height: 166.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(22),
//                 color: Colors.white,
//                 boxShadow: const [
//                   BoxShadow(
//                       offset: Offset(0, 15),
//                       blurRadius: 25,
//                       color: Colors.black12),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 0.0,
//               left: 0.0,
//               child: Container(
//                 padding: const EdgeInsets.only(top: 15),
//                 height: 120.0,
//                 width: 120.0,
//                 child: CircleAvatar(
//                   child: ClipOval(
//                     child: Image(
//                       height: 100.0,
//                       width: 100.0,
//                       image: NetworkImage(link_api_folder_img +
//                           widget.product['store_photo'].toString()),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),

//                 //  Image.network(
//                 //   product.image,
//                 //   fit: BoxFit.cover,
//                 // ),
//               ),
//             ),
//             // Positioned(
//             //     top: 0.0,
//             //     left: 0.0,
//             //     child: Row(
//             //       children: [
//             //         IconButton(
//             //           icon: const Icon(Icons.favorite_border),
//             //           iconSize: 30.0,
//             //           // ignore: avoid_print
//             //           onPressed: () => print('Save post'),
//             //         ),
//             //       ],
//             //     )),

//             // Positioned(
//             //     top: 0.0,
//             //     right: 0.0,
//             //     child: Row(
//             //       children: [
//             //         //offer
//             //         Padding(
//             //           padding: const EdgeInsets.all(kDefaultPadding),
//             //           child: Container(
//             //             padding: const EdgeInsets.symmetric(
//             //               horizontal: kDefaultPadding * 1, // 30 px padding
//             //               vertical: kDefaultPadding / 5, // 5 px padding
//             //             ),
//             //             decoration: BoxDecoration(
//             //               color: primaryColor,
//             //               borderRadius: BorderRadius.circular(22),
//             //             ),
//             //             child: const Text(
//             //               "خصم" + '5%',
//             //               style: TextStyle(
//             //                 color: bgColor,
//             //                 fontSize: 20,
//             //               ),
//             //             ),
//             //           ),
//             //         ),
//             //       ],
//             //     )),

//             Positioned(
//                 bottom: 0.0,
//                 right: 0.0,
//                 child: Row(
//                   children: [
//                     // Row(
//                     //   children: const [
//                     //     SizedBox(
//                     //       width: 20,
//                     //     ),
//                     //     Text(
//                     //       "2",
//                     //       style: TextStyle(fontWeight: FontWeight.w500),
//                     //     ),
//                     //     SizedBox(
//                     //       width: 5,
//                     //     ),
//                     //     Icon(
//                     //       Icons.star_rate,
//                     //       size: 20,
//                     //       color: primaryColor,
//                     //     ),
//                     //   ],
//                     // ),
//                     // IconButton(
//                     //   icon: const Icon(Icons.favorite_border_outlined),
//                     //   iconSize: 30.0,
//                     //   // ignore: avoid_print
//                     //   onPressed: () => print('Save post'),
//                     // ),
//                     Padding(
//                         padding: const EdgeInsets.only(left: 15, right: 15),
//                         child: like()),
//                     IconButton(
//                       icon: const Icon(Icons.comment_sharp),
//                       iconSize: 30.0,
//                       // ignore: avoid_print
//                       onPressed: () => print('Save post'),
//                     ),
//                   ],
//                 )),
//             Positioned(
//               bottom: 0.0,
//               right: 0.0,
//               child: SizedBox(
//                 height: 136.0,
//                 // Because oure image is 200 width, then: width - 200
//                 width: size.width - 180,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Spacer(),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                       child: Text(
//                         widget.product['store_name'].toString()
//                         // product.title
//                         ,
//                         style:
//                             // Theme.of(context).textTheme.bodyText1
//                             TextStyle(
//                           fontSize: 16.0,
//                           color: Color.fromARGB(242, 0, 0, 0),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     // const Spacer(),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                       child: Text(
//                         widget.product['information'].toString()
//                         // product.subTitle
//                         ,
//                         style:
//                             //  Theme.of(context).textTheme.caption,
//                             TextStyle(
//                           color: Color.fromARGB(115, 83, 82, 82),
//                           fontSize: 14.0,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),

// //...........................................................................

//                     Padding(
//                       padding: const EdgeInsets.only(left: 10, right: 10),
//                       child: Row(
//                         children: [
//                           //...............................................

//                           Padding(
//                             padding: const EdgeInsets.all(10),
//                             child: RatingBar.builder(
//                               // initialRating: product['avg_rate'],
//                               initialRating:
//                                   double.parse(widget.product['avg_rate']),
//                               minRating: 1,
//                               direction: Axis.horizontal,
//                               itemSize: 20,
//                               allowHalfRating: true,
//                               itemCount: 5,
//                               itemPadding:
//                                   const EdgeInsets.symmetric(horizontal: 1.0),
//                               itemBuilder: (context, _) => const Icon(
//                                 Icons.star,
//                                 color: primaryColor,
//                               ),
//                               onRatingUpdate: (rating) {
//                                 // ignore: avoid_print

//                                 print(rating);
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

// //...........................................................................

//                     const Spacer(),

//                     // Padding(
//                     //   padding: const EdgeInsets.all(kDefaultPadding),
//                     //   child: Row(
//                     //     children: [
//                     //       IconButton(
//                     //         icon: const Icon(Icons.bookmark_border),

//                     //         iconSize: 30.0,

//                     //         // ignore: avoid_print

//                     //         onPressed: () => print('Save post'),
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),

//                     // Padding(
//                     //   padding: const EdgeInsets.all(kDefaultPadding),
//                     //   child: Container(
//                     //     padding: const EdgeInsets.symmetric(
//                     //       horizontal: kDefaultPadding * 1.5, // 30 px padding
//                     //       vertical: kDefaultPadding / 5, // 5 px padding
//                     //     ),
//                     //     decoration: BoxDecoration(
//                     //       color: kSecondaryColor,
//                     //       borderRadius: BorderRadius.circular(22),
//                     //     ),
//                     //     child: Text('السعر: \$${product.price}'),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),

//             //.............................................................

//             // Positioned(
//             //   top: 0.0,
//             //   right: 0.0,
//             //   child: SizedBox(
//             //     height: 136.0,
//             //     // Because oure image is 200 width, then: width - 200
//             //     width: size.width - 150,
//             //     child: Column(
//             //       crossAxisAlignment: CrossAxisAlignment.start,
//             //       children: [
//             //         Spacer(),
//             //         Padding(
//             //           padding: const EdgeInsets.all(kDefaultPadding),
//             //           child: Container(
//             //             padding: EdgeInsets.symmetric(
//             //               horizontal: kDefaultPadding * 1.5, // 30 px padding
//             //               vertical: kDefaultPadding / 5, // 5 px padding
//             //             ),
//             //             decoration: BoxDecoration(
//             //               // color: kSecondaryColor,
//             //               borderRadius: BorderRadius.circular(22),
//             //             ),
//             //             child: Row(
//             //               children: [
//             //                 IconButton(
//             //                   icon: const Icon(Icons.bookmark_border),

//             //                   iconSize: 30.0,

//             //                   // ignore: avoid_print

//             //                   onPressed: () => print('Save post'),
//             //                 ),
//             //               ],
//             //             ),
//             //           ),
//             //         ),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
  }

// ignore: non_constant_identifier_names
  Widget store_part() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => store_profile_from_user(
                    product: widget.product,
                  )),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          leading: Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: CircleAvatar(
              child: ClipOval(
                child: Image(
                  height: 50.0,
                  width: 50.0,
                  image: NetworkImage(
                    link_api_folder_img +
                        widget.product['store_photo'].toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Text(
            widget.product['store_name'].toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: RatingBar.builder(
            // initialRating: product['avg_rate'],
            initialRating: double.parse(widget.product['avg_rate'].toString()),
            minRating: 1,
            direction: Axis.horizontal,
            itemSize: 15,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: primaryColor,
            ),
            onRatingUpdate: (rating) {
              // ignore: avoid_print

              print(rating);
            },
          ),
          trailing: SizedBox(height: 40, width: 40, child: like()),

          // IconButton(
          //   icon: const Icon(
          //     Icons.favorite_border,
          //   ),
          //   color: Colors.grey,
          //   onPressed: () => print('Like comment'),
          // ),
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
//.........................................................
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
