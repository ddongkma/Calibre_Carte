import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:calibre_carte/helpers/image_cacher.dart';

class BookDetailsCoverImage extends StatefulWidget {
  final int bookId;
  final String relativePath;
  final height;
  final width;
  BookDetailsCoverImage(
      this.bookId, this.relativePath, this.height, this.width);

  @override
  _BookDetailsCoverImageState createState() => _BookDetailsCoverImageState();
}

class _BookDetailsCoverImageState extends State<BookDetailsCoverImage> {
  late Future myFuture;
  late String localImagePath;
  late Future<bool> gotImage;

  Future<bool> getBookCoverImage() async {
    ImageCacher ic = ImageCacher();
    bool imageExists = true;

    bool exists =
        await ic.checkIfCachedFileExists(widget.relativePath, widget.bookId);
    if (!exists) {
      imageExists =
          await ic.downloadAndCacheImage(widget.relativePath, widget.bookId);
    }
    if (imageExists == true) {
      localImagePath =
          await ic.returnCachedImagePath(widget.relativePath, widget.bookId);
      return true;
    }
    if (imageExists == false) {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotImage = getBookCoverImage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: gotImage,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            return widget.height == null
                ? Image.file(
                    File(localImagePath),
                    key: UniqueKey(),
                  )
                : Image.file(
                    File(localImagePath),
                    key: UniqueKey(),
                    height: widget.height,
                    width: widget.width,
                    fit: BoxFit.fill,
                  );
          } else
            return widget.height == null
                ? Image.asset('assets/images/logo.png',
                    key: UniqueKey(),
                    height: widget.height,
                    width: widget.width,
                    fit: BoxFit.fitWidth)
                : Image.asset('assets/images/logo.png',
                    height: widget.height,
                    width: widget.width,
                    fit: BoxFit.fitWidth);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
