

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:game_project/main.dart';

class Zemin extends ParallaxComponent<Oyunilk>{

  Zemin();
  @override
  Future<void>onLoad() async{
    final zemin = await Flame.images.load('5_ Floor Platform.png');
    final resim1 = await Flame.images.load('0_ Background.png');
    final resim2 = await Flame.images.load('1_ Trees Background.png');
    final resim3 = await Flame.images.load('2_ Trees.png');
    final resim4 = await Flame.images.load('3_ Trees.png');
    final resim5 = await Flame.images.load('4_ Trees.png');
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(resim1),
      ),
      ParallaxLayer(
        ParallaxImage(resim2),
      ),
      ParallaxLayer(
        ParallaxImage(resim3),
      ),
      ParallaxLayer(
        ParallaxImage(resim4),
      ),
      ParallaxLayer(
        ParallaxImage(resim5),
      ),
      ParallaxLayer(
        ParallaxImage(zemin,fill: LayerFill.width,alignment: Alignment.bottomCenter),
      ),
      
    ]);
  }

}