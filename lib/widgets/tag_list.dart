import 'package:blockslk/models/tag.dart';
import 'package:blockslk/tag.dart';
import 'package:flutter/material.dart';

Widget tagList(List<Tag> tags) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: tags.length,
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TagPage(tag: tags[index]),
              ),
            );
          },
          child: Chip(
            label: Text(
              tags[index].name,
              style: TextStyle(
                fontSize: 13.0,
                color: Color(int.parse('0xFF${tags[index].accentColor}')),
              ),
            ),
            backgroundColor: const Color(0XFFffffff),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(32.0),
            ),
            visualDensity: VisualDensity.compact,
          ),
        ),
      );
    },
  );
}
