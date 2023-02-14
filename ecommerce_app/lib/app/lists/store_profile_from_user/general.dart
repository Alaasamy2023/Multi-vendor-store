import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constant/constants.dart';

class General extends StatefulWidget {
  final product;
  const General({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  static var product;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        const Text(
          "احصائيات عامه",
        ),
        const SizedBox(height: 16.0),
        Row(
          children: <Widget>[
            Expanded(
              child: _buildWikiCategory(
                  Icons.favorite,
                  "عدد المتابعين" + "\n" + "14450",
                  Colors.deepOrange.withOpacity(0.7)),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: _buildWikiCategory(
                  Icons.store,
                  "عدد المنتجات" + "\n" + "14450",
                  Colors.blue.withOpacity(0.6)),
            ),
          ],
        ),
        // const SizedBox(height: 16.0),
        // Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: _buildWikiCategory(Icons.bookmark, "Bookmarked wikis",
        //           Colors.indigo.withOpacity(0.7)),
        //     ),
        //     const SizedBox(width: 16.0),
        //     Expanded(
        //       child: _buildWikiCategory(
        //           Icons.file_copy, "Templates", Colors.greenAccent),
        //     ),
        //   ],
        // ),
        const SizedBox(height: 16.0),

        Card(
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Expanded(
                child: Text(
                  "التقيم العام",
                  // "${int.parse(widget.product_data['avg_rate_product'])}",
                  style: TextStyle(
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
                  initialRating: 4,
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
//..............................................
        const SizedBox(height: 16.0),

        part("متجرنا متخصص", widget.product['store_name'].toString()),
        const SizedBox(height: 16.0),

        part("اسم مؤسس المتجر", "احمد ابراهيم عادل"),
        const SizedBox(height: 16.0),

        part("عنوان المتجر", "  شارع المعرص"),
        const SizedBox(height: 16.0),

        part("عنا", "نحن متجر متحصص فى المرقعه "),
        const SizedBox(height: 16.0),

        part("سياسه الارجاع", "اكتب هنا سياسه الارجاع"),
        const SizedBox(height: 16.0),

        part("اقصي مده لتوصيل المنتج", "7 ايام"),

//..............................................
      ],
    );
  }
}

Widget part(String txt1, txt2) {
  return SizedBox(
    height: 50,
    child: Card(
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              // ignore: prefer_interpolation_to_compose_strings
              txt1 + "  :  " + txt2,
              // "${int.parse(widget.product_data['avg_rate_product'])}",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Color.fromARGB(255, 129, 127, 127),
          )
        ],
      ),
    ),
  );
}

Stack _buildWikiCategory(IconData icon, String label, Color color) {
  return Stack(
    children: <Widget>[
      Container(
        padding: const EdgeInsets.all(26.0),
        alignment: Alignment.centerRight,
        child: Opacity(
            opacity: 0.3,
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            )),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(height: 16.0),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      )
    ],
  );
}
