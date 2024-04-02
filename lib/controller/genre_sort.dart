import 'package:flutter/foundation.dart';

class GenreHandler extends ChangeNotifier{
  List<String> genre =
  [
    "all",
    "Shooter",
    "ARPG",
    "Battle Royale",
    "Strategy",
    "MMORPG",
    "MMOARPG",
    "Action RPG",
    "Action Game",
    "Card Game",
    "Action",
    "MMOTPS",
    "Racing",
    "MOBA",
    "Sports",
    "MMOFPS",
    "Fighting",
    "MMO",
    "Social",
    "Fantasy"
  ];

  String theCurrentGenre = 'all';

  bool isGrid = false;

  void changeCurrentGenre(String value){
    theCurrentGenre = value;
    notifyListeners();
  }

  void toggleView(){
    isGrid = !isGrid;
    notifyListeners();
  }

}