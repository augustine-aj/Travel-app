import 'package:flutter/material.dart';

Widget buildImageBackground() {
  final imageUrl =
      'https://bing.com/th?id=OSGI.985982F9D30D7810EBD6CFC3DA981FF1&h=1000&w=1920&c=1&rs=1';
  return Image.network(
    imageUrl,
    height: double.infinity,
    width: double.infinity,
    fit: BoxFit.fill,
  );
}
