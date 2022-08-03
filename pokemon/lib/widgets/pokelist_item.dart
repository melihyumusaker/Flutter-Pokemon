import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/constant/constants.dart';
import 'package:pokemon/constant/ui_helper.dart';
import 'package:pokemon/pages/detail_page.dart';
import 'package:pokemon/widgets/pokemon_image_and_ball.dart';
import '../model/pokemon_model.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              pokemon: pokemon,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pokemon.name ?? 'N/A',
              style: Constants.getPokemonNameTextStyle(),
            ),
            Chip(
              label: Text(
                pokemon.type![0],
                style: Constants.getTypeChipTextStyle(),
              ),
            ),
            Expanded(child: PokeImageAndBall(pokemon: pokemon)),
          ],
        ),
      ),
    );
  }
}
