import 'dart:convert';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../componnt/widgets/store_card.dart';
import '../../constant/constants.dart';

// ignore: camel_case_types
class store_list_v extends StatefulWidget {
  final id_catag;
  const store_list_v({
    Key? key,
    this.id_catag,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _store_list_vState createState() => _store_list_vState();
}

// ignore: camel_case_types
class _store_list_vState extends State<store_list_v> {
//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................

  int pageNo = 1;

  // ignore: prefer_final_fields
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;
// ignore: deprecated_member_use, non_constant_identifier_names
  List list_catagory = [];

  static var id_catag;

  void _fetchData() async {
    // ignore: prefer_typing_uninitialized_variables
    var apiUrl;
    if (pageNo == 1) {
      // ignore: prefer_interpolation_to_compose_strings
      apiUrl = Uri.parse('${view_store}page=1&per_page=5&catagory_store_id=' +
          widget.id_catag.toString());
    } else {
      apiUrl = Uri.parse(
          // ignore: prefer_interpolation_to_compose_strings
          '${view_store}page=$pageNo&per_page=5&catagory_store_id=' +
              widget.id_catag.toString());
    }

    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        List albumList = [];
        var resultBody;

        pageNo++; // resetting and incrementing page
        apiUrl = Uri.parse(
            '${view_store}page=$pageNo&per_page=5&catagory_store_id=' +
                widget.id_catag.toString());

        resultBody = jsonDecode(response.body);
        for (int i = 0; i < resultBody.length; i++) {
          albumList.add(resultBody[i]);
        }
        setState(() {
          isLoading = false;
          list_catagory.addAll(albumList);
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildList() {
    return list_catagory.length < 1
        ? Center(
            child: Container(
              child: const CircularProgressIndicator(),
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list_catagory.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == list_catagory.length) {
                return _buildProgressIndicator();
              } else {
                return store_card(
                  itemIndex: index,
                  product: list_catagory[index],
                  press: () {},
                );
              }
            },
            controller: _scrollController,
          );
  }

//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................

  @override
  Widget build(BuildContext context) {
    return _buildList();

    //  Scaffold(
    //   body: ListView.builder(
    //       itemCount: products.length,
    //       itemBuilder: (context, index) {
    //         return store_card(
    //           itemIndex: index,
    //           product: products[index],
    //           press: () {},
    //         );
    //       }),
    // );
  }
}
