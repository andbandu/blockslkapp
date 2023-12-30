import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarInside extends StatelessWidget implements PreferredSizeWidget {
  const AppBarInside({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.webp',
            width: 130,
            height: 50,
          )
        ],
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        PopupMenuButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30.0,
          ),
          offset: const Offset(0, 55),
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry>[
              buildPopupMenuItem('About', 'https://www.blocks.lk/about/'),
              buildPopupMenuItem(
                  'Disclaimer', 'https://www.blocks.lk/disclaimer/'),
              buildPopupMenuItem(
                  'Privacy Policy', 'https://www.blocks.lk/privacy-policy/'),
              buildPopupMenuItem('Terms & Conditions',
                  'https://www.blocks.lk/terms-and-conditions/'),
              buildPopupMenuItem(
                  'Advertise', 'https://www.blocks.lk/advertise/'),
              buildPopupMenuItem(
                  'Contact', 'https://www.blocks.lk/contact-us/'),
            ];
          },
          onSelected: (dynamic value) {
            // ignore: deprecated_member_use
            launch(value);
          },
        ),
      ],
    );
  }

  PopupMenuItem<String> buildPopupMenuItem(String title, String url) {
    return PopupMenuItem(
      value: url,
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }
}
