import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:game_project/main.dart';

// Class representing the background with parallax effect
class BackGround extends ParallaxComponent<Oyunilk> {
  double backgroundSpeed = 2;

  @override
  FutureOr<void> onLoad() async {
    // Loading parallax background images
    var gameRef;
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('yol.png'),
        ParallaxImageData('yol.png'),
      ],
      fill: LayerFill.width,
      repeat: ImageRepeat.repeat,
      baseVelocity: Vector2(0, -70 * backgroundSpeed.toDouble()),
      velocityMultiplierDelta: Vector2(0, 1.2 * backgroundSpeed),
    );
  }
}