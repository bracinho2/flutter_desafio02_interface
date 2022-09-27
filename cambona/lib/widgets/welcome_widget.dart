import 'package:cambona/cambona.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final Widget ask;

  final VoidCallback? route;
  const WelcomeWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.ask,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsivity.automatic(24, mediaQueryData)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Responsivity.automatic(15, mediaQueryData),
            ),
            child: title,
          ),
          subtitle,
          Padding(
            padding: EdgeInsets.only(
              top: Responsivity.automatic(25, mediaQueryData),
              bottom: Responsivity.automatic(35, mediaQueryData),
            ),
            child: ask,
          ),
        ],
      ),
    );
  }
}
