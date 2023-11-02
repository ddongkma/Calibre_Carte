import 'package:calibre_carte/pages/instruction/widgets/instruction_widget.dart';
import 'package:calibre_carte/providers/color_theme_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Instructions extends StatelessWidget {
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
                  reusableText("\u2022", color: colorTheme.headerText),
                  Expanded(
                      child: RichText(
                    text: TextSpan(children: [
                      textSpan(
                          " Before logging in, you should upload your entire Calibre Library folder to dropbox. You can find the location of the folder by clicking on the \"Calibre Library\" button in the Calibre Application.",
                          color: colorTheme.headerText),
                    ]),
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  reusableText("\u2022", color: colorTheme.headerText),
                  Expanded(
                      child: RichText(
                    text: TextSpan(children: [
                      textSpan(
                          " You can read more about how to export and move Calibre's libraries ",
                          color: colorTheme.headerText),
                      TextSpan(
                          text: "here.",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'http://blog.calibre-ebook.com/2017/01/how-to-backup-move-and-export-your.html');
                            },
                          style: const TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.blue,
                              fontSize: 15)),
                    ]),
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  reusableText("\u2022", color: colorTheme.headerText),
                  Expanded(
                      child: RichText(
                    text: TextSpan(children: [
                      textSpan(
                          " For the best experience with Calibre Carte, download e-book metadata and covers using Calibre. You can find the instructions to download and edit metadata",
                          color: colorTheme.headerText),
                      TextSpan(
                          text: " here.",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://manual.calibre-ebook.com/metadata.html#id2');
                            },
                          style: const TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.blue,
                              fontSize: 15)),
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
