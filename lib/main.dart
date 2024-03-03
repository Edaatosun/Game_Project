import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/extensions.dart';
import 'package:flame/parallax.dart';
import 'package:game_project/RobotState.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft, // veya landscapeLeft
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final game = Oyunilk();
    return GameWidget(game: game);
  }
}

class Oyunilk extends FlameGame {
  late SpriteAnimationComponent oyuncu;
  //late final JoystickComponent joystick;
  late SpriteAnimationGroupComponent<RobotState> robot;
  //bool oyuncuflip = false;
  late Parallax parallax;
  @override
  Future<void> onLoad() async {
    await super.onLoad();





    //  final running = await loadSpriteAnimation(
    //   'DinoSprites - tard.png',
    //   SpriteAnimationData.sequenced(
    //     amount: 24,
    //     stepTime: 0.2,
    //     textureSize: Vector2(17, 19),
    //   ),
    // );
    // final idle = await loadSpriteAnimation(
    //   'DinoSprites - tard.png',
    //   SpriteAnimationData.sequenced(
    //     amount: 24,
    //     stepTime: 0.5,
    //     textureSize: Vector2(17, 20),
    //   ),
    // );

    // final robotSize = Vector2(100, 64);
    // robot = SpriteAnimationGroupComponent<RobotState>(
    //   animations: {
    //     RobotState.running: running,
    //     RobotState.idle: idle,
    //   },
    //   current: RobotState.idle,
    //   position: size / 2 - robotSize / 2,
    //   size: robotSize,
    // );
    //  add(robot);

    
  

    // final image = await images.load('landing.png');

    // var animation1 = SpriteAnimation.fromFrameData(
    //   image,
    //   SpriteAnimationData.sequenced(
    //       amount: 25, stepTime: 0.1, textureSize: Vector2(600,500)),
    // );
    // oyuncu = SpriteAnimationComponent()
    //   ..animation = animation1
    //   ..size = Vector2(100, 100)
    //   ..position = Vector2(50, 10);

    // add(oyuncu);

    final zemin = await Flame.images.load('5_ Floor Platform.png');
    final resim1 = await Flame.images.load('0_ Background.png');
    final resim2 = await Flame.images.load('1_ Trees Background.png');
    final resim3 = await Flame.images.load('2_ Trees.png');
    final resim4 = await Flame.images.load('3_ Trees.png');
    final resim5 = await Flame.images.load('4_ Trees.png');

    parallax = Parallax(
  [
    ParallaxLayer(
      ParallaxImage(resim1),
      velocityMultiplier: Vector2(0.8, 0), // Örnek bir yavaş hareket hızı
    ),
    ParallaxLayer(
      ParallaxImage(resim2),
      velocityMultiplier: Vector2(1.0, 0), // Daha yavaş hareket eden bir resim
    ),
    ParallaxLayer(
      ParallaxImage(resim3),
      velocityMultiplier: Vector2(1.5, 0), // Orta hızda hareket eden bir resim
    ),
    ParallaxLayer(
      ParallaxImage(resim4),
      velocityMultiplier: Vector2(2.5, 0), // Daha hızlı hareket eden bir resim
    ),
    ParallaxLayer(
      ParallaxImage(resim5),
      velocityMultiplier: Vector2(3.0, 0), // En hızlı hareket eden bir resim
    ),
    ParallaxLayer(
      ParallaxImage(zemin,
          fill: LayerFill.width, alignment: Alignment.bottomCenter),
          velocityMultiplier: Vector2(3.0, 0),
    ),
  ],
  size: size,
  baseVelocity: Vector2(10, 0),
 
);
  }

  @override
  void update(double dt) {
    super.update(dt);

    
    // oyuncu.position.add(joystick.relativeDelta * 300 * dt);
    // if(joystick.relativeDelta[0] < 0 && !oyuncuflip) {
    //   oyuncuflip = false;
    //   oyuncu.flipHorizontallyAroundCenter();
    // }
    // if(joystick.relativeDelta[0] > 0 && !oyuncuflip) {
    //   oyuncuflip= true;
    //   oyuncu.flipHorizontallyAroundCenter();
    // }

    parallax.update(dt);
    //oyuncu.update(dt);
    //robot.update(dt);
    
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    parallax.render(canvas);
    //robot.render(canvas);

    //oyuncu.render(canvas);
    //joystick.render(canvas);
  }
  
  
}
