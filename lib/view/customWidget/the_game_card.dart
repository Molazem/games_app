
import 'package:flutter/material.dart';
import 'package:games_app/controller/genre_sort.dart';
import 'package:games_app/model/game_model.dart';
import 'package:provider/provider.dart';

class GamesCard extends StatelessWidget {
  final GameModel gameItem;
  const GamesCard({super.key, required this.gameItem});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<GenreHandler>(context);
    return Container(
      margin: myProvider.isGrid ? const EdgeInsets.all(15) : const EdgeInsets.only(left:15, right: 15,top: 25),
      height: 350,
      decoration:  BoxDecoration(
        borderRadius:const BorderRadius.all(Radius.circular(15)),
        color: Colors.blueGrey,
        image: DecorationImage(
            image: NetworkImage(gameItem.thumbnail),
            fit: BoxFit.cover
        )

      ),
      child: Column(
        children: [
          const Spacer(),
           Container(
             height: myProvider.isGrid?90 : 350,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black,Colors.transparent]
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(gameItem.title, style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: (myProvider.isGrid)?14:20
                  ),),
                  Text('${gameItem.description.substring(0,60)}.....', style:  TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: (myProvider.isGrid)?7:14
                  ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
