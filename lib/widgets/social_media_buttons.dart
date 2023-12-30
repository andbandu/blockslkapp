// bottom_buttons.dart
import 'package:blockslk/widgets/build_button.dart';
import 'package:blockslk/widgets/facebook_icon.dart';
import 'package:blockslk/widgets/linkedin_icon.dart';
import 'package:blockslk/widgets/telegram_icon.dart';
import 'package:blockslk/widgets/twitter_icon.dart';
import 'package:blockslk/widgets/whatsapp_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBar extends StatelessWidget {
  final String title;
  final String url;

  const BottomBar({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildButton(
                color: const Color(0xFF1877f2),
                icon: const FacebookIcon(),
                onPressed: () {
                  _launchFacebook(title, url);
                },
              ),
              BuildButton(
                color: const Color(0xFF25D366),
                icon: const WhatsappIcon(),
                onPressed: () {
                  _launchWhatsapp(title, url);
                },
              ),
              BuildButton(
                color: const Color(0xFF2867B2),
                icon: const LinkedinIcon(),
                onPressed: () {
                  _launchLinkedIn(title, url);
                },
              ),
              BuildButton(
                color: const Color(0xFF000000),
                icon: const TwitterIcon(),
                onPressed: () {
                  _launchTwitter(title, url);
                },
              ),
              BuildButton(
                color: const Color(0xFF0088CC),
                icon: const TelegramIcon(),
                onPressed: () {
                  _launchTelegram(title, url);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchFacebook(String message, String postUrl) async {
    String facebookUrl =
        'https://www.facebook.com/sharer/sharer.php?u=$postUrl';

    // ignore: deprecated_member_use
    launch(facebookUrl);
  }

  void _launchWhatsapp(String message, String postUrl) async {
    String whatsappUrl = 'https://api.whatsapp.com/send?text=$message $postUrl';

    // ignore: deprecated_member_use
    launch(whatsappUrl);
  }

  void _launchLinkedIn(String message, String postUrl) async {
    String linkedInUrl =
        'https://www.linkedin.com/shareArticle?mini=true&url=$postUrl&title=$message';

    // ignore: deprecated_member_use
    launch(linkedInUrl);
  }

  void _launchTwitter(String message, String postUrl) async {
    String twitterUrl =
        'https://twitter.com/intent/tweet?text=$message&url=$postUrl';

    // ignore: deprecated_member_use
    launch(twitterUrl);
  }

  void _launchTelegram(String message, String postUrl) async {
    String telegramUrl = 'https://t.me/share/url?url=$postUrl&text=$message';

    // ignore: deprecated_member_use
    launch(telegramUrl);
  }
}
