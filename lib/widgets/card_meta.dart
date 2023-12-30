import 'package:flutter/material.dart';

class CardMeta extends StatelessWidget {
  final String authorName;
  final DateTime publishDate;

  const CardMeta(
      {super.key, required this.authorName, required this.publishDate});

  @override
  Widget build(BuildContext context) {
    return Text(
      'By $authorName - ${_formattedDate(publishDate)}',
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }

  String _formattedDate(DateTime date) {
    // Customize the date format as needed
    return '${_getMonthName(date.month)} ${date.day}, ${date.year}';
  }

  String _getMonthName(int month) {
    // Customize month names as needed
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';

      default:
        return '';
    }
  }
}
