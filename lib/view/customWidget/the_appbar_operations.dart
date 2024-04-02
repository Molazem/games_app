import 'package:flutter/material.dart';
import 'package:games_app/controller/genre_sort.dart';
import 'package:provider/provider.dart';

class TheAppBarBottom extends StatelessWidget {

  const TheAppBarBottom({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<GenreHandler>(context);
    var genre = myProvider.genre;
    return  Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 15,),
            Container(
              height: 40,
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                  color: Colors.white70,
                  width: 2
                ),
                //color: Colors.deepPurpleAccent
              ),
              child: DropdownButton(
                items: [
                DropdownMenuItem(value: genre[0],child: Text(genre[0]),),
                DropdownMenuItem(value: genre[1],child: Text(genre[1]),),
                DropdownMenuItem(value: genre[2],child: Text(genre[2]),),
                DropdownMenuItem(value: genre[3],child: Text(genre[3]),),
                DropdownMenuItem(value: genre[4],child: Text(genre[4]),),
                DropdownMenuItem(value: genre[5],child: Text(genre[5]),),
                DropdownMenuItem(value: genre[6],child: Text(genre[6]),),
                DropdownMenuItem(value: genre[7],child: Text(genre[7]),),
                DropdownMenuItem(value: genre[8],child: Text(genre[8]),),
                DropdownMenuItem(value: genre[9],child: Text(genre[9]),),
                DropdownMenuItem(value: genre[10],child: Text(genre[10]),),
                DropdownMenuItem(value: genre[11],child: Text(genre[11]),),
                DropdownMenuItem(value: genre[12],child: Text(genre[12]),),
                DropdownMenuItem(value: genre[13],child: Text(genre[13]),),
                DropdownMenuItem(value: genre[14],child: Text(genre[14]),),
                DropdownMenuItem(value: genre[15],child: Text(genre[15]),),
                DropdownMenuItem(value: genre[16],child: Text(genre[16]),),
                DropdownMenuItem(value: genre[17],child: Text(genre[17]),),
                DropdownMenuItem(value: genre[18],child: Text(genre[18]),),
                DropdownMenuItem(value: genre[19],child: Text(genre[19]),),
              ],
                value: myProvider.theCurrentGenre,
                onChanged: (String? value) => myProvider.changeCurrentGenre(value!),
                iconEnabledColor: Colors.white70,
                underline: Container(),
                style: const TextStyle(color: Colors.white70),


              ),
            ),
            const Spacer(),
            IconButton(onPressed: (){myProvider.toggleView();}, icon: (myProvider.isGrid)?const Icon(Icons.view_list_rounded):const Icon(Icons.grid_view_rounded)),
            const SizedBox(width: 15,)
          ],
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
