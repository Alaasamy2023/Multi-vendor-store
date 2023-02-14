import 'package:nb_utils/nb_utils.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constant/constants.dart';
import '../../error_layout/NoResultFoundScreen.dart';

class ProdectMainBody extends StatefulWidget {
  final id_prodect;
  final product_data;
  const ProdectMainBody({
    Key? key,
    this.id_prodect,
    this.product_data,
  }) : super(key: key);

  @override
  _ProdectMainBodyState createState() => _ProdectMainBodyState();
}

class _ProdectMainBodyState extends State<ProdectMainBody> {
  static var id_prodect;
//widget.id_prodect.toString()
//widget.product_data['title'].toString()
  @override
  Widget build(BuildContext context) {
    double offer_price = int.parse(widget.product_data['price'].toString()) -
        (int.parse(widget.product_data['price'].toString()) *
            (int.parse(widget.product_data['if_offer_nsba'].toString()) / 100));

    return ListView(
      children: [
        slider_img(),
        //...............................................................................
        part_one(),
        //..............................................................
        store_part(),
        //..............................................................

        cards("سعر المنتج ",
            "${widget.product_data['price'].toString()}       جنيه   "),

        //..............................................................

        int.parse(widget.product_data['if_offer_product'].toString()) == 1
            ? cards("سعر المنتج بعد الخصم ", "${offer_price}       جنيه   ")
            : const SizedBox(
                height: 10,
              ),

        int.parse(widget.product_data['if_offer_product'].toString()) == 1
            // widget.product_data['if_offer_product'] == 1
            ? cards(
                "خصم على المنتج ",
                "  خصم   " +
                    widget.product_data['if_offer_nsba'].toString() +
                    '%',
              )
            : cards("خصم على المنتج ", "لا يوجد"),

        cards("سياسه الارجاع", "يوجد ارجاع حتى 14 يوم"),
        // cards("المنتج قابل للارجاع ", "يوجد ارجاع حتى 14 يوم"),

        const SizedBox(
          height: 100,
        ),
      ],
    );
  }

// ignore: non_constant_identifier_names
  Widget slider_img() {
    return ImageSlideshow(
      /// Width of the [ImageSlideshow].
      width: double.infinity,

      /// Height of the [ImageSlideshow].
      height: 200,

      /// The page to show when first creating the [ImageSlideshow].
      initialPage: 0,

      /// The color to paint the indicator.
      indicatorColor: Colors.blue,

      /// The color to paint behind th indicator.
      indicatorBackgroundColor: Colors.grey,

      /// The widgets to display in the [ImageSlideshow].
      /// Add the sample image file into the images folder
      children: [
        Image.network(
          link_api_folder_img + '1.png',
          fit: BoxFit.cover,
        ),
        Image.network(
          link_api_folder_img + '2.png',
          fit: BoxFit.cover,
        ),
        Image.network(
          link_api_folder_img + '3.png',
          fit: BoxFit.cover,
        ),
      ],

      /// Called whenever the page in the center of the viewport changes.
      // onPageChanged: (value) {
      //   print('Page changed: $value');
      // },

      /// Auto scroll interval.
      /// Do not auto scroll with null or 0.
      autoPlayInterval: 8000,

      /// Loops back to first slide.
      isLoop: true,
    );
  }

// ignore: non_constant_identifier_names
  Widget store_part() {
    return Padding(
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
                      widget.product_data['store_photo'].toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          widget.product_data['store_name'].toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: RatingBar.builder(
          // initialRating: product['avg_rate'],
          initialRating:
              double.parse(widget.product_data['store_rate'].toString()),
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
        // trailing: IconButton(
        //   icon: const Icon(
        //     Icons.favorite_border,
        //   ),
        //   color: Colors.grey,
        //   onPressed: () => print('Like comment'),
        // ),
      ),
    );
  }

  Widget part_one() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product_data['title'].toString(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    // "${int.parse(widget.product_data['avg_rate_product'])}",

                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      widget.product_data['COUNT_rate_product'].toString(),
                      // "${int.parse(widget.product_data['avg_rate_product'])}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: RatingBar.builder(
                      // initialRating: product['avg_rate'],
                      initialRating:
                          double.parse(widget.product_data['avg_rate_product']),
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemSize: 20,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cards(String txt1, String txt2) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                child: Text(
                  txt1 + "   :  " + txt2,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  // "${int.parse(widget.product_data['avg_rate_product'])}",

                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
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

// //.........................................................
// //.........................................................
// //.........................................................//.........................................................
//   Widget like() {
//     if (widget.product['following'] == "1") {
//       return LikeButton(
//         onTap: onLikeButtonTapped,
//         size: 30,
//         circleColor:
//             CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
//         bubblesColor: BubblesColor(
//           dotPrimaryColor: Color(0xff33b5e5),
//           dotSecondaryColor: Color(0xff0099cc),
//         ),
//         likeBuilder: (isLikeds) {
//           return Icon(
//             Icons.favorite,
//             color: isLikeds ? Colors.grey : Color.fromARGB(255, 245, 3, 35),
//             size: 30,
//           );
//         },
//       );
//     } else {
//       return LikeButton(
//         onTap: onLikeButtonTapped,
//         size: 30,
//         circleColor: CircleColor(
//             start: Color.fromARGB(255, 230, 16, 62),
//             end: Color.fromARGB(255, 226, 19, 19)),
//         bubblesColor: BubblesColor(
//           dotPrimaryColor: Color(0xff33b5e5),
//           dotSecondaryColor: Color(0xff0099cc),
//         ),
//         likeBuilder: (isLikeds) {
//           return Icon(
//             Icons.favorite,
//             color: isLikeds ? Color.fromARGB(255, 245, 3, 35) : Colors.grey,
//             size: 30,
//           );
//         },
//       );
//     }
//   }

//   Future<bool> onLikeButtonTapped(bool isLiked) async {
//     if (isLiked == true) {
//       toasty(context, "true");

//       add_like(linkdelet_follow, "3", "3", "follow");

//       //   "product_id": "1",
//       // "user_id": "2",
//       //  "table": "like_product",

//     }

//     if (isLiked == false) {
//       toasty(context, "false");
//       add_like(linkadd_follow, "3", "3", "follow");
//     }

//     return !isLiked;
//   }

//.........................................................
//.........................................................//.........................................................
  // Widget like() {
  //   if (widget.product_data['following'] == "1") {
  //     return LikeButton(
  //       onTap: onLikeButtonTapped,
  //       size: 30,
  //       circleColor:
  //           CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
  //       bubblesColor: BubblesColor(
  //         dotPrimaryColor: Color(0xff33b5e5),
  //         dotSecondaryColor: Color(0xff0099cc),
  //       ),
  //       likeBuilder: (isLikeds) {
  //         return Icon(
  //           Icons.favorite,
  //           color: isLikeds ? Colors.grey : Color.fromARGB(255, 245, 3, 35),
  //           size: 30,
  //         );
  //       },
  //     );
  //   } else {
  //     return LikeButton(
  //       onTap: onLikeButtonTapped,
  //       size: 30,
  //       circleColor: CircleColor(
  //           start: Color.fromARGB(255, 230, 16, 62),
  //           end: Color.fromARGB(255, 226, 19, 19)),
  //       bubblesColor: BubblesColor(
  //         dotPrimaryColor: Color(0xff33b5e5),
  //         dotSecondaryColor: Color(0xff0099cc),
  //       ),
  //       likeBuilder: (isLikeds) {
  //         return Icon(
  //           Icons.favorite,
  //           color: isLikeds ? Color.fromARGB(255, 245, 3, 35) : Colors.grey,
  //           size: 30,
  //         );
  //       },
  //     );
  //   }
  // }

  // Future<bool> onLikeButtonTapped(bool isLiked) async {
  //   if (isLiked == true) {
  //     toasty(context, "true");

  //     add_like(linkdelet_follow, "3", "3", "follow");

  //     //   "product_id": "1",
  //     // "user_id": "2",
  //     //  "table": "like_product",

  //   }

  //   if (isLiked == false) {
  //     toasty(context, "false");
  //     add_like(linkadd_follow, "3", "3", "follow");
  //   }

  //   return !isLiked;
  // }

//.........................................................
//.........................................................

}
