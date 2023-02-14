import 'package:ecommerce_app/app/screen/user/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../componnt/widgets/filter.dart';
import '../../constant/constants.dart';
import '../lists/store_list_v.dart';
import 'home_body.dart';
import 'order_prodect_home.dart';
import 'prodect_saved.dart';
import 'store_follwing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int currentIndex2 = 0;
  // final example2 = [
  //   Text('Example 2',
  //       style: TextStyle(color: Color.fromARGB(255, 12, 9, 9), fontSize: 24)),
  //   Text('Reels',
  //       style: TextStyle(color: Color.fromARGB(255, 27, 26, 26), fontSize: 24)),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: homeAppBar(context),
      body: HomeBody(),

// //.....................................................................................

//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (int index) {
//           setState(() {
//             currentIndex2 = index;
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         unselectedItemColor: Color(0xFFA8ABAD),
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         currentIndex: currentIndex2,
//         items: [
//           //1
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border, color: Color(0xFFA8ABAD)),
//             activeIcon: Icon(Icons.favorite, color: Color(0xFF212121)),
//             label: 'Home',
//             backgroundColor: Colors.white,
//           ),
//           //2
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border, color: Color(0xFFA8ABAD)),
//             activeIcon: Icon(Icons.favorite, color: Color(0xFF212121)),
//             label: 'Home',
//             backgroundColor: Colors.white,
//           ),
//         ],
//       ),
// //.....................................................................................
    );
  }

  AppBar homeAppBar(context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFFEDF0F6),
      elevation: 0.0,
      titleSpacing: 20.0,
      title: Row(
        children: [
          ////////////////////////////
          const SizedBox(
            width: 15.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const User()));
            },
            child: const Text(
              'alaa samy',
              style: TextStyle(
                color: Color.fromARGB(255, 37, 36, 36),
              ),
            ),
          ),
        ],
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
            Icons.add_shopping_cart,
            size: 26,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OrderProdectHome()));
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
