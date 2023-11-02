import 'package:calibre_carte/pages/privacy_police/widgets/privacy_policy_widget.dart';
import 'package:calibre_carte/providers/color_theme_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatelessWidget {
  final points = [
    " Calibre Carte does not collect any of your personal information or track a user in any way. ",
    "When you connect to Dropbox, and use the app, data is sent to and requested from Dropbox, which is governed by its own privacy policy. Dropbox is not affiliated with Calibre Carte, and as such, anything that it does or does not do with your data is completely out of this app’s control.",
    "Calibre Carte runs on top of Calibre, which is governed by its own privacy policy. Calibre is not affiliated with Calibre Carte, and as such, anything that it does or does not do with your data is completely out of Calibre Carte's control.",
    " If you use the ebook download / export feature, the e-book file will leave the app and be opened in the app of your choice. The apps that can open these files are not affiliated with Calibre Carte, and each have their own privacy policies."
  ];

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  reusableText("\u2022", color: colorTheme.headerText,),
                  Expanded(
                      child: RichText(
                    text: TextSpan(children: [
                      textSpan(points[0], color: colorTheme.headerText,)
                    ]),
                  ))
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  reusableText(
                    "\u2022", color: colorTheme.headerText,),
                  Expanded(
                      child: RichText(
                    text: TextSpan(children: [
                      textSpan(
                        " When you connect to Dropbox, and use the app, data is sent to and requested from",
                        color: colorTheme.headerText,
                      ),
                      TextSpan(
                          text: " Dropbox",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://dropbox.com/');
                            },
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: colorTheme.headerText,
                              fontSize: 15)),
                      textSpan(
                        ", which is governed by its own privacy policy. Dropbox is not affiliated with Calibre Carte, and as such, anything that it does or does not do with your data is completely out of this app’s control.",
                        color: colorTheme.headerText,
                      )
                    ]),
                  ))
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  reusableText(
                    "\u2022", color: colorTheme.headerText,),
                  Expanded(
                      child: RichText(
                    text: TextSpan(children: [
                      textSpan(
                        " Calibre Carte runs on top of", color: colorTheme.headerText,),
                      TextSpan(
                          text: " Calibre",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://calibre-ebook.com/');
                            },
                          style: const TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.blue,
                              fontSize: 15)),
                      textSpan(
                        ", which is governed by its own privacy policy. Calibre is not affiliated with Calibre Carte, and as such, anything that it does or does not do with your data is completely out of Calibre Carte's control.",
                        color: colorTheme.headerText,
                      )
                    ]),
                  ))
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  reusableText("\u2022", color: colorTheme.headerText),
                  Expanded(
                      child: RichText(
                    text: TextSpan(children: [textSpan(points[3], color: colorTheme.headerText,)]),
                  ))
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  reusableText("\u2022", color: colorTheme.headerText,),
                  Expanded(
                      child: RichText(
                    text: TextSpan(children: [
                      textSpan(
                        "Calibre Carte requires permissions to access device storage only for storing and accessing downloaded books.",
                        color: colorTheme.headerText,
                      )
                    ]),
                  ))
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  reusableText("\u2022", color: colorTheme.headerText),
                  Expanded(
                      child: RichText(
                    text: TextSpan(children: [
                      textSpan(
                        "Calibre Carte requires permissions to access files and folders on your Dropbox© account only to scan for available Calibre Libraries and download Calibre Libraries. Calibre Carte does not do anything else with your data on Dropbox.",
                        color: colorTheme.headerText,)
                    ]),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
