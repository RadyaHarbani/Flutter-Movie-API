import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/widget/other_widget.dart';
import '../widget/bottomNav/bottom_nav_array.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> widgets = [
  BottomPage1(),
  BottomPage2(),
];

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

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
