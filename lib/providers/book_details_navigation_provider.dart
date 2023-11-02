
import 'package:flutter/material.dart';

import '../common/models/books.dart';

class BookDetailsNavigation with ChangeNotifier {
  late int index;
  late List<Books> booksList;
  late int bookID;

  void incrementIndex() {
//    print("Incrementing index");
    if (index < booksList.length - 1) {
      index = index + 1;
      setBookID();
      notifyListeners();
    }
  }

  void setBookID() {
//    print("Setting book ID");
    bookID = booksList[index].id!;
//    print(bookID);
  }

  void decrementIndex() {
//    print("Decrementing index");
    if (index > 0) {
      index = index - 1;
      setBookID();
      notifyListeners();
    }
  }

}
