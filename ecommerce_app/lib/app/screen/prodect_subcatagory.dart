// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/constants.dart';
// import '../../screens/details_screen.dart';

import '../../componnt/widgets/search_form.dart';
import '../lists/categories.dart';
import '../lists/list_prodect_v.dart';
import '../lists/list_prodect_v_home.dart';

// ignore: camel_case_types
class prodect_subcatagory extends StatefulWidget {
  final id_catag;
  final name_catag;
  const prodect_subcatagory({
    Key? key,
    this.id_catag,
    this.name_catag,
  }) : super(key: key);

  @override
  State<prodect_subcatagory> createState() => _prodect_subcatagoryState();
}

class _prodect_subcatagoryState extends State<prodect_subcatagory> {
  static var id_catag;
  static var name_catag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
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
              widget.name_catag.toString(),
              style: const TextStyle(
                color: Color.fromARGB(255, 37, 36, 36),
              ),
            ),
          ],
        ),
      ),
      // actions: [
      //   IconButton(
      //     icon: const Icon(
      //       CupertinoIcons.search,
      //       size: 26,
      //       color: Color.fromARGB(255, 22, 25, 27),
      //     ),
      //     onPressed: () {
      //       // sharedPref.clear();
      //       // Navigator.push(
      //       //     context, MaterialPageRoute(builder: (context) => Singin()));
      //       // _mBottomSheet7(context);
      //     },
      //   ),
      //   IconButton(
      //     icon: const Icon(
      //       Icons.bookmark,
      //       size: 26,
      //       color: Colors.grey,
      //     ),
      //     onPressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => const Prodect_saved()));
      //     },
      //   ),
      //   IconButton(
      //     icon: const Icon(
      //       Icons.local_convenience_store_rounded,
      //       size: 26,
      //       color: primaryColor,
      //     ),
      //     onPressed: () {
      //       // Navigator.push(
      //       //     context,
      //       //     MaterialPageRoute(
      //       //         builder: (context) => const Store_follwing()));

      //       // sharedPref.clear();
      //       // Navigator.push(
      //       //     context, MaterialPageRoute(builder: (context) => Singin()));
      //       // b_sheet_notvigation(context);
      //       // _mBottomSheet_save_people(context);
      //       // Navigator.push(
      //       //   context,
      //       //   MaterialPageRoute(builder: (context) => Addimg()),
      //       // );
      //     },
      //   ),
      // ],
    );
  }

  // //....................................................................................
}
