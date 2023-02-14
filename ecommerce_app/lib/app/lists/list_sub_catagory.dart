import 'dart:convert';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';

import '../../componnt/widgets/Sub_CategoryCard.dart';
import '../../constant/constants.dart';
import '../screen/prodect_subcatagory.dart';

// ignore: camel_case_types
class list_sub_catagory extends StatefulWidget {
  final id_catag;
  final name_catag;
  const list_sub_catagory({
    this.id_catag,
    this.name_catag,
    Key? key,
  }) : super(key: key);

  @override
  State<list_sub_catagory> createState() => _CategoriesState();
}

class _CategoriesState extends State<list_sub_catagory> {
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
  static var name_catag;
  void _fetchData() async {
    // ignore: prefer_typing_uninitialized_variables
    var apiUrl;
    if (pageNo == 1) {
      // ignore: prefer_interpolation_to_compose_strings
      apiUrl = Uri.parse('${view_sub_catagory}page=1&per_page=5&catagory_id=' +
          widget.id_catag.toString());
    } else {
      apiUrl = Uri.parse(
          // ignore: prefer_interpolation_to_compose_strings
          '${view_sub_catagory}page=$pageNo&per_page=5&catagory_id=' +
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
            // ignore: prefer_interpolation_to_compose_strings
            '${view_sub_catagory}page=$pageNo&per_page=5&catagory_id=' +
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
    // ignore: prefer_is_empty
    return list_catagory.length < 1
        ? Center(
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
                return Sub_CategoryCard(
                  icon: link_api_folder_icon + list_catagory[index]['photo'],
                  // icon:
                  //     "http://192.168.1.5/ecommerce_app/uplode/icon/dress.svg",
                  title: list_catagory[index]['title'],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => prodect_subcatagory(
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
      height: 40,
      child: _buildList(),
    );
  }
}
