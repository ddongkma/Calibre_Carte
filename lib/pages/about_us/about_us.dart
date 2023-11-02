import 'package:calibre_carte/pages/about_us/widgets/about_us_widget.dart';
import 'package:calibre_carte/providers/color_theme_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorTheme colorTheme = Provider.of(context);
    return Scaffold(
      backgroundColor: colorTheme.descriptionBackground,
      appBar: buildAppbar(),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
//                decoration: BoxDecoration(
//                    border: Border.all(width: 2, color: Color(0xffFED962))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    reusableText("Authors: ", fontSize: 25),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableText("Ekansh Jain, Prerna Dave",
                        color: colorTheme.headerText),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
//                decoration: BoxDecoration(
//                    border: Border.all(width: 2, color: Color(0xffFED962))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("Contact: ", fontSize: 25),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableText("calibre.carte@gmail.com",
                        color: colorTheme.headerText),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
