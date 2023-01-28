import 'package:flutter/material.dart';
import 'predModel.dart';

class Sustainable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 249, 195),
      appBar: AppBar(
        title: Text("Sustainable_Practices"),
      ),
      body: Row(
        children: [
          Text(
            '''
  ->As a Farmer you can practice these methods to
  follow Sustainable Agriculture :-


  1.Permaculture is a design system that applies
  principles that are usually found in nature to the
  development of human settlements , allowing 
  humanity to live in harmony with the natural world.

  2.Biodynamics incorporates ecological and holistic
  growing practices that are based upon the 
  philosophy of " anthroposophy ".
   
   3.Hydroponics and aquaponics involve the growing
   of plants without soil , nourishing the plants 
  through specialized nutrients that are added to water.

  4.Urban agriculture promotes the need to localize
   our food system requires that we grow food much
    closer to home, including in cities.

  5.Agroforestry involves the growth of trees and 
  shrubs amongst crops or grazing land. Agroforestry
  systems can combine both agriculture and forestry
  practices for long-lasting, productive, and
  diverse land use when approached sustainably.

  6.Natural animal raising, sustainable animal farming
  is possible and is better for everyone. Not only
  that it is good for the environment and our 
  nutritional needs, it is also good for the animals.

 

''',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
