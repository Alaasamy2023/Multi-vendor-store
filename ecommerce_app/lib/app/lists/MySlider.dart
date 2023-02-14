// import 'package:flutter/material.dart';

// class MySlider extends StatefulWidget {
//   @override
//   _MySliderState createState() => _MySliderState();
// }

// class _MySliderState extends State<MySlider> {
//   late PageController _pageController;

//   List<String> images = [
//     "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg",
//     "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg",
//     "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg",
//   ];

//   int activePage = 1;
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: 200,
//           child: PageView.builder(
//               itemCount: images.length,
//               pageSnapping: true,
//               controller: _pageController,
//               onPageChanged: (page) {
//                 setState(() {
//                   activePage = page;
//                 });
//               },
//               itemBuilder: (context, pagePosition) {
//                 bool active = pagePosition == activePage;
//                 return slider(images, pagePosition, active);
//               }),
//         ),
//         Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: indicators(images.length, activePage))
//       ],
//     );
//   }
// }

// AnimatedContainer slider(images, pagePosition, active) {
//   double margin = active ? 10 : 20;

//   return AnimatedContainer(
//     duration: Duration(milliseconds: 500),
//     curve: Curves.easeInOutCubic,
//     margin: EdgeInsets.all(margin),
//     decoration: BoxDecoration(
//         image: DecorationImage(image: NetworkImage(images[pagePosition]))),
//   );
// }

// imageAnimation(PageController animation, images, pagePosition) {
//   return AnimatedBuilder(
//     animation: animation,
//     builder: (context, widget) {
//       print(pagePosition);

//       return SizedBox(
//         width: 200,
//         height: 200,
//         child: widget,
//       );
//     },
//     child: Container(
//       margin: EdgeInsets.all(10),
//       child: Image.network(images[pagePosition]),
//     ),
//   );
// }

// List<Widget> indicators(imagesLength, currentIndex) {
//   return List<Widget>.generate(imagesLength, (index) {
//     return Container(
//       margin: EdgeInsets.all(3),
//       width: 10,
//       height: 10,
//       decoration: BoxDecoration(
//           color: currentIndex == index ? Colors.black : Colors.black26,
//           shape: BoxShape.circle),
//     );
//   });
// }
