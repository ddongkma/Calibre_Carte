import 'package:calibre_carte/pages/license/widgets/license_widget.dart';
import 'package:calibre_carte/providers/color_theme_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class License extends StatelessWidget {
  String licenseText =
      "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:";
  String licenseText2 =
      "The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.";
  String licenseText3 =
      "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.";

  @override
  Widget build(BuildContext context) {
    ColorTheme colorTheme = Provider.of(context);
    return Scaffold(
      backgroundColor: colorTheme.descriptionBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: reusableText("License", color: Colors.white),
        backgroundColor: colorTheme.appBarColor,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              reusableText("Copyright (c) 2019 Ekansh Jain", color: colorTheme.headerText),
              const SizedBox(height: 10,),
              reusableText(
                "Copyright (c) 2019 Prerna Dave", color: colorTheme.headerText,),
              const SizedBox(height: 20,),
              reusableText(licenseText, color: colorTheme.headerText,),
              const SizedBox(height: 20,),
              reusableText(licenseText2, color: colorTheme.headerText,),
              const SizedBox(height: 20,),
              reusableText(licenseText3, color: colorTheme.headerText,)
            ],
          ),
        ),
      ),
    );
  }
}
