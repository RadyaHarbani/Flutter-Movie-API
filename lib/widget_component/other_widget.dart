import 'package:flutter/material.dart';

class AppbarIcons extends StatelessWidget {
  const AppbarIcons({
    super.key,
    required this.content,
    required this.icon,
  });

  final String content;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(content),
            ),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            padding: EdgeInsets.all(5),
            duration: Duration(seconds: 2),
          ),
        );
      },
      icon: icon,
    );
  }
}

class ContentTitle extends StatelessWidget {
  const ContentTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  subtitle,
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Belum Tersedia"),
                      ),
                      action: SnackBarAction(
                        label: 'Close',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      padding: EdgeInsets.all(5),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text("Lainnya"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Icon(Icons.arrow_forward_ios_rounded,
                    size: 12, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
