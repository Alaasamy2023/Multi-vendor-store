import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../app/lists/list_comments.dart';
import '../../app/screen/prodect/prodect_main.dart';

import '../../constant/constants.dart';

// ignore: camel_case_types
class product_card_h extends StatefulWidget {
  const product_card_h({
    Key? key,
    required this.product_data,
  }) : super(key: key);
  final product_data;

  @override
  State<product_card_h> createState() => _product_card_hState();
}

// ignore: camel_case_types
class _product_card_hState extends State<product_card_h> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: bgColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultBorderRadius)),
              ),
              child: Image.network(
                link_api_folder_img +
                    widget.product_data['main_photo'].toString(),
                height: 132,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product_data['title'].toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 4),
            Text(
              // ignore: prefer_interpolation_to_compose_strings
              widget.product_data['price'].toString().toString() + "   جنيه ",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
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
