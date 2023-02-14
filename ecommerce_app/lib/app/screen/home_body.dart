import 'package:flutter/material.dart';

import '../../constant/constants.dart';
// import '../../screens/details_screen.dart';

import '../../componnt/widgets/search_form.dart';
import '../lists/categories.dart';
import '../lists/list_prodect_v_home.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

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

                  list_prodect_v_home(),

                  // ListView.builder(
                  //     itemCount: products.length,
                  //     itemBuilder: (context, index) {
                  //       if (index == 0) {
                  //         return const SearchForm();
                  //       } else if (index == 1) {
                  //         return const prodect_h();
                  //       } else if (index % 5 == 1) {
                  //         return const prodect_h();
                  //       } else {
                  //         return ProductCard(
                  //           itemIndex: index,
                  //           product: products[index],
                  //           press: () {},
                  //         );
                  //       }
                  //     }),
                ],
              ),
            ),
          ],
        ),
      ),

      //..........................................................................................

      //........................................................
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 95.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -2),
                blurRadius: 6.0,
              ),
            ],
            color: Colors.white,
          ),
          child:
              //...........................................
              const Categories(),
        ),
      ),
    );
  }
}
