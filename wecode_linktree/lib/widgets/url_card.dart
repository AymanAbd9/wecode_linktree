import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlCard extends StatelessWidget {
  const UrlCard({Key? key, required this.title, required this.url}) : super(key: key);
  final String title;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: TextButton(
        style: TextButton.styleFrom(primary: Colors.white),
        onPressed: () async {
          await launch(url);
        },
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
