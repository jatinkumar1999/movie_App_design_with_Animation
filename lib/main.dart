import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_design/BackGroundImage.dart';
import 'package:movie_app_design/data.dart';
import 'package:movie_app_design/modal/movies.dart';
import 'package:movie_app_design/modal/widget/BuyButton.dart';
import 'package:movie_app_design/modal/widget/MovieCartWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageConroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const Icon(Icons.cancel),
        actions: const [
          Icon(
            Icons.person_add_outlined,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Stack(
        children: [
          BackGroundImage(
            pageController: pageConroller,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: CarouselSlider(
                    items: movies
                        .map((e) => MovieCardWidget(
                              movies: e,
                            ))
                        .toList(),
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 0.75,
                      enlargeCenterPage: true,
                      height: MediaQuery.of(context).size.height * 0.65,
                      onPageChanged: (index, _) => pageConroller.animateToPage(
                        index,
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease,
                      ),
                    )),
              ),
              BuyButton(),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
