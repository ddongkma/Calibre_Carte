
import 'package:calibre_carte/providers/color_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/models/publishers.dart';
import '../../../common/models/ratings.dart';
import '../../../common/widgets/book_details_cover_image.dart';
import 'details_text.dart';

class DetailsLeftTile extends StatelessWidget {
  final bookId;
  final bookDetails;
  final authorText;
  final totalHeight;
  final Ratings rating;
  final Publishers publishers;

  DetailsLeftTile(
      {this.bookId, this.bookDetails, this.authorText, this.totalHeight,required this.rating,required this.publishers});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1.5;
    var bottomSize = totalHeight / 2;
    ColorTheme colorTheme=Provider.of(context);
    return Container( color: colorTheme.descriptionBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // TODO: change sizes
          Container(
            child: BookDetailsCoverImage(
                bookId, bookDetails.path, bottomSize - 1, width),
          ),
          Container(
            height: 1,
            color: Colors.black,
            width: width,
          ),
          BookDetailsText(bottomSize, width, bookDetails, authorText, rating,publishers),
        ],
      ),
    );
  }
}
