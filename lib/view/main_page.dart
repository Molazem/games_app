import 'package:flutter/material.dart';
import 'package:games_app/controller/genre_sort.dart';
import 'package:games_app/model/game_model.dart';
import 'package:games_app/view/customWidget/the_appbar_operations.dart';
import 'package:games_app/view/customWidget/the_game_card.dart';
import 'package:provider/provider.dart';

import '../controller/online_data.dart';

class TheHomePage extends StatefulWidget {
  const TheHomePage({super.key});

  @override
  State<TheHomePage> createState() => _TheHomePageState();
}

class _TheHomePageState extends State<TheHomePage> {
  List<GameModel> games = [];
  
  void _getData() async{
    games = (await Data().myData())!;

    setState(() {});
  }
  
  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
  }
  List<GameModel>? sortedList(String theSortValue){
    if(theSortValue == 'all') {
      return games;
    }else {
      return games.where((element)=> element.genre == theSortValue).toList();
    }
  }
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<GenreHandler>(context);
    var theList = sortedList(myProvider.theCurrentGenre);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Center(child: Text('The Games app', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
        bottom: const PreferredSize(preferredSize: Size.square(50), child: TheAppBarBottom()),
      ),
      body: theList!.isEmpty
          ? const Center(child: CircularProgressIndicator(),)
          : (myProvider.isGrid)
          ?GridView.builder(
        itemCount: theList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ), itemBuilder: (context, index){
            return GamesCard(gameItem: theList[index]);
      })
          :ListView.separated(
          itemCount: theList.length,
          separatorBuilder: (context, index){
            return const SizedBox(height: 20,);
          },
          itemBuilder: (context, index){
            return GamesCard(gameItem: theList[index]);
          })
    );
  }
}
