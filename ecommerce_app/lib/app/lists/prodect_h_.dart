import 'dart:convert';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../componnt/widgets/product_card_h.dart';
// ignore: unused_import
import '../../componnt/widgets/search_form.dart';
import '../../constant/constants.dart';
import '../screen/Prodect_see_all.dart';

// ignore: camel_case_types
class prodect_h_ extends StatefulWidget {
  // final String post;
  // ignore: prefer_typing_uninitialized_variables
  final link;
  // ignore: prefer_typing_uninitialized_variables
  final title;
  const prodect_h_({
    Key? key,
    this.link,
    this.title,
    //  required this.post,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ListProdectVState createState() => _ListProdectVState();
}

class _ListProdectVState extends State<prodect_h_> {
  // static var link;
  // static var title;
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
        : ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: albums.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == albums.length) {
                return _buildProgressIndicator();
              } else {
                return product_card_h(
                  product_data: albums[index],
                );

                // comment(data: albums[index]);
              }
            },
            controller: _scrollController,
            separatorBuilder: (context, index) =>
                const SizedBox(width: defaultPadding),
          );
  }

//.........................................................
//.........................................................
//.........................................................
//.........................................................
//.........................................................

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title.toString(),
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Prodect_see_all()));
                },
                child: const Text(
                  "See All",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: _buildList(),
        )
      ],
    );
  }
}
