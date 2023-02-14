import 'dart:convert';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../../componnt/widgets/comment.dart';
import '../../../constant/constants.dart';

// ignore: camel_case_types
class list_desc_prodect extends StatefulWidget {
  // final String post;
  final id_prodect;
  final table;
  const list_desc_prodect({
    Key? key,
    this.id_prodect,
    this.table,
    //  required this.post,
  }) : super(key: key);

  @override
  State<list_desc_prodect> createState() => _list_desc_prodectState();
}

// ignore: camel_case_types
class _list_desc_prodectState extends State<list_desc_prodect> {
  static var id_prodect;
  static var table;
//......................... static var id_prodect;................................
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
      // ignore: prefer_interpolation_to_compose_strings
      apiUrl = Uri.parse('${view_product_desc}page=1&per_page=5&table=' +
          widget.table.toString() +
          '&prodect_id=' +
          widget.id_prodect.toString());
    } else {
      apiUrl = Uri.parse(
          // ignore: prefer_interpolation_to_compose_strings
          '${view_product_desc}page=$pageNo&per_page=5&table=' +
              widget.table.toString() +
              '&prodect_id=' +
              widget.id_prodect.toString());
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
        apiUrl = Uri.parse(
            // ignore: prefer_interpolation_to_compose_strings
            '${view_product_desc}page=$pageNo&per_page=10&table=' +
                widget.table.toString() +
                '&prodect_id=' +
                widget.id_prodect.toString());
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
                return bodys(albums[index]);
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
  }
}

Widget bodys(var data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      data['photo'].toString().isEmpty
          ? const SizedBox(
              height: 20,
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 160.0,
                width: double.infinity,
                child: Image.network(
                  link_api_folder_img + data['photo'].toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
//.................................................................................

      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          data['description'].toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),

//.................................................................................
    ],
  );
}
