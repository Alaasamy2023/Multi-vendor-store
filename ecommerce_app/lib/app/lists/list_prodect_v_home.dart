import 'dart:convert';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../componnt/widgets/product_cart.dart';
import '../../componnt/widgets/search_form.dart';
import '../../constant/constants.dart';

import 'prodect_h_.dart';

// ignore: camel_case_types
class list_prodect_v_home extends StatefulWidget {
  // final String post;
  final link;

  // ignore: prefer_const_constructors_in_immutables
  list_prodect_v_home({
    Key? key,
    this.link,

    //  required this.post,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ListProdectVState createState() => _ListProdectVState();
}

class _ListProdectVState extends State<list_prodect_v_home> {
  static var link;

//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................

  // var apiUrl =Uri.parse('https://jsonplaceholder.typicode.com/albums/1/photos');
  int pageNo = 1;

  // ignore: prefer_final_fields
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;
// ignore: deprecated_member_use
  List albums = [];
  void _fetchData() async {
    // ignore: prefer_typing_uninitialized_variables
    var apiUrl;
    if (pageNo == 1) {
      apiUrl = Uri.parse('${view_product}page=1&per_page=5&product_id=');
    } else {
      apiUrl = Uri.parse('${view_product}page=$pageNo&per_page=5&product_id=');
    }

    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        List albumList = [];
        // ignore: prefer_typing_uninitialized_variables
        var resultBody;
        pageNo++; // resetting and incrementing page
        apiUrl =
            Uri.parse('${view_product}page=$pageNo&per_page=10&product_id=');
        resultBody = jsonDecode(response.body);
        for (int i = 0; i < resultBody.length; i++) {
          albumList.add(resultBody[i]);
        }
        setState(() {
          isLoading = false;
          albums.addAll(albumList);
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

  // ignore: unused_element
  Widget _buildList() {
    // ignore: prefer_is_empty
    return albums.length < 1
        ? Center(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: const Text(
                'No data',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        : ListView.builder(
            itemCount: albums.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == albums.length) {
                return _buildProgressIndicator();
              } else {
                return ProductCard(
                  itemIndex: index,
                  product_data: albums[index],
                );

                // comment(data: albums[index]);
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
    return Scaffold(
      body: _buildList_home(),
    );
  }

  // ignore: non_constant_identifier_names
  _buildList_home() {
    // ignore: prefer_is_empty
    return albums.length < 1
        ? Center(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: const Text(
                'No data',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        : ListView.builder(
            itemCount: albums.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == albums.length) {
                return _buildProgressIndicator();
              } else if (index == 0) {
                return const SearchForm();
              } else if (index == 1) {
                return const prodect_h_(
                  title: "خصومات",
                );
              } else if (index % 5 == 1) {
                return const prodect_h_(
                  title: "الاعلى تقيما",
                );
              } else {
                return ProductCard(
                  itemIndex: index,
                  product_data: albums[index],
                );

                // comment(data: albums[index]);
              }
            },
            controller: _scrollController,
          );
  }
}
