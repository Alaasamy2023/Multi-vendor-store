import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../componnt/widgets/filter.dart';
import '../../../constant/constants.dart';
import '../order_prodect_home.dart';
import '../prodect_saved.dart';
import '../store_follwing.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: homeAppBar(context),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const Text(
            "احصائيات عامه",
          ),
          const SizedBox(height: 16.0),
          Row(
            children: <Widget>[
//....................................................................................

              Expanded(
                child: _buildWikiCategory(
                    Icons.favorite,
                    "متابع لمتاجر" + "\n" + "1000",
                    Colors.deepOrange.withOpacity(0.7)),
              ),
//....................................................................................
              const SizedBox(width: 16.0),
              Expanded(
                child: _buildWikiCategory(
                    Icons.store,
                    " المنتجات المحفوظه" + "\n" + "1521",
                    Colors.blue.withOpacity(0.6)),
              ),
//....................................................................................

//....................................................................................
            ],
          ),

          const SizedBox(height: 16.0),
          Row(
            children: <Widget>[
//....................................................................................

              Expanded(
                child: _buildWikiCategory(Icons.add_shopping_cart,
                    " الطلبات" + "\n" + "500", Colors.indigo.withOpacity(0.7)),
              ),
//....................................................................................
              const SizedBox(width: 16.0),
              Expanded(
                child: _buildWikiCategory(Icons.favorite_outline,
                    " منتجات اعجبتك" + "\n" + "2516", Colors.greenAccent),
              ),
//....................................................................................
            ],
          ),

//....................................................................................

          const SizedBox(height: 16.0),

          part("الاسم", "علاء سامى "),
          const SizedBox(height: 16.0),

          part("الايميل", "alaa.alaa@mail"),
          const SizedBox(height: 16.0),
          part("رقم الهاتف", "01010236548"),
          const SizedBox(height: 16.0),
          part("العنوان", "القناطر الخيريه - القليوبيه"),
          const SizedBox(height: 16.0),
          part("البلد", "مصر"),
          const SizedBox(height: 16.0),
          part("اللغه", "العربيه"),
          const SizedBox(height: 16.0),
          part("تسجيل  خروج من حسابك", ""),
          const SizedBox(height: 16.0),
          // part("الايميل", "alaa.alaa@mail"),
          // const SizedBox(height: 16.0),

          //..............................................
        ],
      ),
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const User()));
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Store_follwing()));

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
