import 'package:carousel_slider/carousel_slider.dart';
import '../views/detail_page.dart';
import '../API/app_constants.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
          height: 250,
          autoPlay: true,
          viewportFraction: 0.5,
          enlargeCenterPage: true,
          enlargeFactor: 0.14,
          pageSnapping: true,
          autoPlayCurve: Curves.linearToEaseOut,
          autoPlayAnimationDuration: Duration(seconds: 3),
        ),
        itemBuilder: (context, index, realIndex) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  movie: snapshot.data[index],
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                Container(
                  width: 170,
                  child: Image.network(
                    '${AppConstant.imageUrlW500}${snapshot.data![index].posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 170,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      left: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            snapshot.data![index].releaseDate,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
