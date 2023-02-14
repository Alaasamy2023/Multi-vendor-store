// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import '../../constant/constants.dart';
// import '../../screens/details_screen.dart';

import '../../componnt/widgets/search_form.dart';
import '../lists/categories.dart';
import '../lists/list_prodect_v.dart';
import '../lists/list_prodect_v_home.dart';

// ignore: camel_case_types
class Prodect_see_all extends StatelessWidget {
  const Prodect_see_all({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: kDefaultPadding / 2),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: const BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  ListProdectV(),
                ],
              ),
            ),
          ],
        ),
      ),

      //..........................................................................................
    );
  }
}
