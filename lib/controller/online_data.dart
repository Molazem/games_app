import 'package:games_app/controller/constants.dart';
import 'package:games_app/model/game_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class Data{
  final String _api = TheAPI.api;
  List<GameModel> games = [];

  Future<List<GameModel>?> myData() async{
    var request = Uri.parse(_api);
    var response = await http.get(request);
    if(response.statusCode == 200){
      var bodyList = convert.jsonDecode(response.body) as List<dynamic>;
      var count = bodyList.length;
      print('the list size is $count');
      for (var element in bodyList) {
        games.add(GameModel.fromJson(element));
      }
      return games;
    }else {
      print('Request failed ${response.statusCode}');
    }
    return null;
  }
}

