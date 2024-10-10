import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stanch_flutter_task/common/custom_text.dart';
import 'package:stanch_flutter_task/common/custom_textfield.dart';
import 'package:stanch_flutter_task/views/description_screen.dart';

class MeetUpScreen extends StatefulWidget {
  const MeetUpScreen({super.key});

  @override
  State<MeetUpScreen> createState() => _MeetUpScreenState();
}

class _MeetUpScreenState extends State<MeetUpScreen> {
  final TextEditingController searchCon = TextEditingController();
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
        title: const CustomText(text: "Individual Meetup"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45,
                child: CustomTextField(
                  controller: searchCon,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.mic),
                  hintText: "Search",
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                           aspectRatio: 338 / 140,
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
                                    borderRadius: BorderRadius.circular(6),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          imageUrl,
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: CustomText(text: "Popular Meetups \nin India",color: Colors.white,fontWeight: FontWeight.w700,)),
                                ),

                              ],
                            );
                          },
                        );
                      }).toList(),
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
                              borderRadius: BorderRadius.circular(10),
                              color: carouselIndex == index
                                  ? Colors.black
                                  : const Color.fromRGBO(112, 112, 112, .3),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomText(text: "Trending Popular People"),
              const SizedBox(height: 4),
              SizedBox(
                height: 160,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: popularPeopleContainer(),
                      );
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomText(text: "Top Trending Meetups"),
              const SizedBox(height: 4),
              SizedBox(
                height: 220,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DescriptionScreen()));
                            },
                            child: topTrendingMeetupContainer()),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

}

Widget popularPeopleContainer() {
  return Container(
    width: 300,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 1.2)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1.5)),
              child: const Icon(Icons.energy_savings_leaf_rounded),
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Author"),
                CustomText(
                  text: "1,028 Meetups",
                  color: Colors.grey,
                  fontSize: 14,
                )
              ],
            )
          ],
        ),
        const Divider(
          thickness: 1.5,
        ),
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              imageContainer("asset/image_1.jpg"),
              Positioned(left: 25, child: imageContainer("asset/image_2.jpg")),
              Positioned(left: 50, child: imageContainer("asset/image_3.jpg")),
              Positioned(left: 75, child: imageContainer("asset/image_1.jpg")),
              Positioned(left: 100, child: imageContainer("asset/image_2.jpg"))
            ],
          ),
        ),
        Align(alignment: Alignment.bottomRight, child: seeMoreButton())
      ],
    ),
  );
}

Widget topTrendingMeetupContainer() {
  return Container(
    width: 170,
    decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage("asset/meetup_imge.jpg"), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(15)),
  );
}

Widget imageContainer(String img) {
  return Container(
    height: 40,
    width: 40,
    decoration:  BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage(img), fit: BoxFit.cover)),
  );
}

Widget seeMoreButton() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(6)),
    child: const CustomText(
      text: "See More",
      color: Colors.white,
    ),
  );
}
