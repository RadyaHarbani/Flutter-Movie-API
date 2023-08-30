import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movie_app/widget/other_widget.dart';
import '../../API/fetch_api.dart';
import '../../model/movie_model.dart';
import '../../widget/upcoming_slider.dart';
import '../../widget/top_rated_slider.dart';
import '../../widget/trending_slider.dart';

class BottomPage1 extends StatefulWidget {
  const BottomPage1({
    super.key,
  });

  @override
  State<BottomPage1> createState() => _BottomPage1State();
}

late Future<List<Results>> trendingMovies;
late Future<List<Results>> topRatedMovies;
late Future<List<Results>> upcomingMovies;

class _BottomPage1State extends State<BottomPage1> {

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 38,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Icon(
                        Icons.location_on_sharp,
                        color: Colors.black54,
                        size: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Batam, Indonesia',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Batas Batam, Indonesia
          Container(
            width: double.infinity,
            height: 123,
            child: Image.asset(
              'assets/images/carosoul_gimmick.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          // Batas Iklan
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ContentTitle(
                title: "Film Trending",
                subtitle: "Berikut Film - Film Yang Sedang Trending"),
          ),
          // Batas Film Trending Text
          Padding(
            padding: const EdgeInsets.only(top: 23),
            child: SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return TrendingSlider(
                      snapshot: snapshot,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          // Batas Film Trending
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Center(
              child: Text(
                "Sedang Tayang",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Batas Sedang Tayang Text
          Divider(
            color: Colors.grey[400],
          ),
          // Batas Divider
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
            child: Row(
              children: [
                Text(
                  "TIX Clone",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.local_offer_rounded,
                    size: 18, color: Colors.yellow[700]),
              ],
            ),
          ),
          // Batas TIX Clone Text
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nonton lebih asik dengan teman - temanmu",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "hanya di tmdb TIX clone, Aplikasi favorit.",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          // Batas Nonton lebih asik dengan teman - temanmu
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: Center(
              child: Container(
                width: 320,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/carosoul_gimmick_dua.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // Batas Iklan Clone
          Divider(
            color: Colors.grey[400],
          ),
          // Batas Divider
          Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 15),
            child: ContentTitle(
                title: "Film Terbaik",
                subtitle: "Berikut Film - Film Terbaik Dari Rating Penonton"),
          ),
          // Batas Film Terbaik Text
          SizedBox(
            child: FutureBuilder(
              future: topRatedMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return TopRatedSlider(
                    snapshot: snapshot,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          // Batas Film Terbaik
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Divider(
              color: Colors.grey[400],
            ),
          ),
          // Batas Divider
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 25),
            child: ContentTitle(
                title: "Film Akan Tayang",
                subtitle: "Berikut Film - Film Yang Akan Tayang di TMDB"),
          ),
          // Batas Film Akan Tayang Text
          SizedBox(
            child: FutureBuilder(
              future: upcomingMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return UpcomingSlider(
                    snapshot: snapshot,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          // Batas Film Akan Tayang
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Divider(
              color: Colors.grey[400],
            ),
          ),
          // Batas Divider
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Center(
              child: Column(
                children: [
                  Transform.rotate(
                    angle: pi / 5,
                    child: Icon(Icons.local_movies_rounded,
                        size: 35, color: Colors.yellow[700]),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Dan... Cut! Yuks Coba Lihat Lagi",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "dari paling atas.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}