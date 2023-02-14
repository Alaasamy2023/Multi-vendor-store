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
class sub_catagory extends StatefulWidget {
  final id_catag;
  final name_catag;
  const sub_catagory({
    Key? key,
    this.id_catag,
    this.name_catag,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _sub_catagoryState createState() => _sub_catagoryState();
}

// ignore: camel_case_types
class _sub_catagoryState extends State<sub_catagory> {
  static var id_catag;
  static var name_catag;
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
                    list_sub_catagory(
                      id_catag: widget.id_catag.toString(),
                      name_catag: widget.name_catag,
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
                      icon: Icon(
                        Icons.grid_on_sharp,
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.local_convenience_store_rounded,
                        color: Color.fromARGB(255, 104, 100, 100),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListProdectV(),
                    store_list_v(
                      id_catag: widget.id_catag.toString(),
                    ),
                  ],
                ),
              ),
            ],
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
      actions: [
        IconButton(
          icon: const Icon(
            CupertinoIcons.search,
            size: 26,
            color: Color.fromARGB(255, 22, 25, 27),
          ),
          onPressed: () {
            // sharedPref.clear();
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Singin()));
            _mBottomSheet7(context);
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.bookmark,
            size: 26,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Prodect_saved()));
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.local_convenience_store_rounded,
            size: 26,
            color: primaryColor,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Store_follwing()));

            // sharedPref.clear();
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Singin()));
            // b_sheet_notvigation(context);
            // _mBottomSheet_save_people(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => Addimg()),
            // );
          },
        ),
      ],
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
