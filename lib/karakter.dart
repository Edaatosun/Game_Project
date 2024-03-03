import 'package:flame/components.dart';
import 'package:game_project/RobotState.dart';
import 'package:game_project/main.dart';

class Karakter extends SpriteGroupComponent <RobotState> with HasGameRef<Oyunilk>{
  Karakter();

  @override
  Future<void> onLoad() async{
    final karakterjump = await gameRef.loadSprite('jump.png');
    final karakteridle = await gameRef.loadSprite('idle.gif');

    size = Vector2(50, 40);
    current = RobotState.idle;
    sprites = {
      RobotState.running:karakterjump,
      RobotState.idle: karakteridle,
    };




  }
  // Karakter(this.joystick): super(
  //   anchor: Anchor.center,
  //   size: Vector2.all(100.0),
  // );
  // double maxhiz = 300.0;
  // final JoystickComponent joystick;

  // @override
  // Future<void> onLoad() async{
  //   super.onLoad();
  //   sprite = await gameRef.loadSprite('karakter3.png');
  //   position = gameRef.size/2;
  //     }
}