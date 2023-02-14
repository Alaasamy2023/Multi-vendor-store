import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: camel_case_types
class comment extends StatefulWidget {
  const comment({
    Key? key,
    required this.data,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final data;

  @override
  State<comment> createState() => _commentState();
}

// ignore: camel_case_types
class _commentState extends State<comment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.data['username'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    subtitle: Text(
                      widget.data['comment'].toString(),
                    ),
                    trailing: RatingBar.builder(
                      initialRating:
                          double.parse(widget.data['rate'].toString()),
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemSize: 15,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // ignore: avoid_print
                        print(rating);
                      },
                    ),
                  ),
//..............................................................

                  widget.data['answer'].toString().isEmpty
                      ? const SizedBox(
                          height: 10,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              const Text(
                                " الرد من البائع" + " : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              /////////////////////////////////////
                              Text(
                                widget.data['answer'].toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
//..............................................................
                ],
              ),
//..............................................................

//..............................................................
              //  IconButton(
              //   icon: const Icon(
              //     Icons.favorite_border,
              //   ),
              //   color: Colors.grey,
              //   onPressed: () => print('Like comment'),
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
