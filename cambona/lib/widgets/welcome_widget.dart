import 'package:cambona/core/app_responsivity.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String ask;
  final String? link;
  final VoidCallback? route;
  const WelcomeWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.ask,
    this.link,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Resposivity.automatic(24, mediaQueryData)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Resposivity.automatic(15, mediaQueryData),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: Resposivity.fontSize(30, mediaQueryData),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: Resposivity.fontSize(30, mediaQueryData),
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Resposivity.automatic(25, mediaQueryData),
              bottom: Resposivity.automatic(35, mediaQueryData),
            ),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: Resposivity.fontSize(20, mediaQueryData),
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: ask,
                      style: const TextStyle(
                        color: Colors.black26,
                      )),
                  if (link != null)
                    TextSpan(
                        text: ' | $link',
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = route),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
