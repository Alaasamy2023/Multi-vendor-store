import 'dart:convert';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';

import '../../componnt/widgets/CategoryCard.dart';
import '../../constant/constants.dart';
import '../screen/sub_catagory.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................

  int pageNo = 1;

  var apiUrl = Uri.parse('${view_catagory}page=1&per_page=10');
  // ignore: prefer_final_fields
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;
// ignore: deprecated_member_use, non_constant_identifier_names
  List list_catagory = [];
  void _fetchData() async {
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
        apiUrl = Uri.parse('${view_catagory}page=$pageNo&per_page=10');
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
    // ignore: prefer_is_empty
    return list_catagory.length < 1
        ? Center(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: const CircularProgressIndicator(),
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list_catagory.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == list_catagory.length) {
                return _buildProgressIndicator();
              } else {
                return CategoryCard(
                  icon: link_api_folder_icon + list_catagory[index]['photo'],
                  // icon:
                  //     "http://192.168.1.5/ecommerce_app/uplode/icon/dress.svg",
                  title: list_catagory[index]['title'],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => sub_catagory(
                                id_catag: list_catagory[index]['id'],
                                name_catag: list_catagory[index]['title'],
                              )),
                    );
                  },
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
    return SizedBox(
      height: 84,
      child: _buildList(),
    );
  }
}
