import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/API/fetch_api.dart';
import 'package:movie_app/widget/widget.dart';
import '../widget/upcoming_slider.dart';
import '../widget/top_rated_slider.dart';
import '../widget/trending_slider.dart';
import '../model/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> widgets = [
  SingleChildScrollView(
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
                  SizedBox(width: 20),
                  Icon(
                    Icons.location_on_sharp,
                    color: Colors.black54,
                    size: 18,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Batam, Indonesia',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
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
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 123,
          child: Image.asset(
            'assets/images/carosoul_gimmick.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 20),
        ContentTitle(
            title: "Film Trending",
            subtitle: "Berikut Film - Film Yang Sedang Trending"),
        SizedBox(height: 23),
        SizedBox(
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
        SizedBox(height: 15),
        Center(
          child: Text(
            "Sedang Tayang",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 15),
        Divider(
          color: Colors.grey[400],
        ),
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
        SizedBox(height: 20),
        Center(
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
        SizedBox(height: 30),
        Divider(
          color: Colors.grey[400],
        ),
        SizedBox(height: 18),
        ContentTitle(
            title: "Film Terbaik",
            subtitle: "Berikut Film - Film Terbaik Dari Rating Penonton"),
        SizedBox(height: 15),
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
        SizedBox(height: 20),
        Divider(
          color: Colors.grey[400],
        ),
        SizedBox(height: 20),
        ContentTitle(
            title: "Film Akan Tayang",
            subtitle: "Berikut Film - Film Yang Akan Tayang di TMDB"),
        SizedBox(height: 25),
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
        SizedBox(height: 30),
        Divider(
          color: Colors.grey[400],
        ),
        SizedBox(height: 20),
        Center(
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
        SizedBox(height: 40),
      ],
    ),
  ),
  Center(
    child: Text(
      "Belum Ada Riwayat",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
];

late Future<List<Results>> trendingMovies;
late Future<List<Results>> topRatedMovies;
late Future<List<Results>> upcomingMovies;

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.3,
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: AppbarIcons(
              content: 'Belum Ada Halaman Profil',
              icon: Icon(
                Icons.person,
                color: Colors.black54,
                size: 20,
              ),
            ),
          ),
          title: Image.asset(
            'assets/images/logo_app.png',
            width: 115,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: AppbarIcons(
                content: 'Belum Ada Halaman Notifikasi',
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black54,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: widgets[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 8),
            child: GNav(
              backgroundColor: Colors.transparent,
              tabBorderRadius: 20,
              color: Colors.black54,
              activeColor: Colors.white,
              tabBackgroundColor: Color.fromARGB(255, 0, 139, 128),
              padding: EdgeInsets.all(5),
              gap: 8,
              onTabChange: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              tabs: const [
                GButton(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                  icon: Icons.home_rounded,
                  text: 'Beranda',
                ),
                GButton(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                  icon: Icons.history_edu_rounded,
                  text: 'Riwayat',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
