import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stanch_flutter_task/common/custom_text.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  int carouselIndex = 0;
  List<String> imageList = [
    "asset/image_1.jpg",
    "asset/image_2.jpg",
    "asset/image_3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Description"),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              descriptionImageContainer(),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.bookmark_outline_rounded,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  const CustomText(
                    text: "1034",
                    fontSize: 12,
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.favorite_border,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  const CustomText(
                    text: "1034",
                    fontSize: 12,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ratingContainer(),
                  const SizedBox(width: 6),
                  const CustomText(
                    text: "3.2",
                    fontSize: 12,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const CustomText(text: "Actor Name"),
              const CustomText(
                text: "Indian Actress",
                fontSize: 12,
                color: Colors.grey,
              ),
              const SizedBox(height: 6),
              const Row(
                children: [
                  Icon(
                    Icons.alarm,
                    color: Colors.grey,
                    size: 14,
                  ),
                  SizedBox(width: 4),
                  CustomText(
                    text: "Duration 20 Mins",
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Row(
                children: [
                  Icon(
                    Icons.padding_rounded,
                    color: Colors.grey,
                    size: 14,
                  ),
                  SizedBox(width: 4),
                  CustomText(
                    text: "Total Average Fees ₹9,999",
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const CustomText(text: "About"),
              const SizedBox(height: 10),
              const CustomText(
                text:
                    "The issue with the Positioned widget displaying only half"
                    " of the widget could be due to the parent Stack not providing enough "
                    " space for the Positioned widget to render fully. To fix this, you can use"
                    " constraints, padding, or ensure that the Stack has enough space.",
                color: Colors.grey,
                fontSize: 14,

              ),
              const Align(
                alignment: Alignment.centerRight,
                  child: CustomText(text: "see more"))
            ],
          ),
        ),
      ),
    );
  }

  Widget descriptionImageContainer() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 450 / 450,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                autoPlayCurve: Curves.easeInExpo,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) => setState(() {
                      carouselIndex = index;
                    })),
            items: imageList.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                          image: AssetImage(
                            imageUrl,
                          ),
                          fit: BoxFit.cover,
                        )),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(imageList.length, (index) {
                            return Container(
                              width: 7.0,
                              height: 7.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: carouselIndex == index
                                    ? Colors.white
                                    : const Color.fromRGBO(112, 112, 112, .3),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.save_alt),
                const Icon(Icons.bookmark),
                const Icon(Icons.favorite),
                const Icon(Icons.settings_overscan_sharp),
                const Icon(Icons.star),
                GestureDetector(
                  onTap: () {
                    Share.share('Check out this awesome content!');
                  },
                  child: const Icon(Icons.share),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget ratingContainer() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          color: Colors.blue,
          size: 10,
        ),
        const Icon(
          Icons.star,
          color: Colors.blue,
          size: 10,
        ),
        const Icon(
          Icons.star,
          color: Colors.blue,
          size: 10,
        ),
        Icon(
          Icons.star,
          color: Colors.blue.withOpacity(0.4),
          size: 10,
        ),
        const Icon(
          Icons.star,
          color: Colors.white,
          size: 10,
        ),
      ],
    ),
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(10)),
  );
}
