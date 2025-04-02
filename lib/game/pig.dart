import 'package:bonfire/bonfire.dart';
import 'package:meurpg_/src/pig_sprite.dart';

class Pig extends PlatformEnemy with HandleForces {
  Pig({required super.position}) :
        super(size: Vector2(34, 28),
        speed: 50,
        animation: PigSpritesheet.animations,


      ){
    mass = 2;
  }



  @override
  void update(double dt) {
    seeAndMoveToPlayer(radiusVision: 32 *3);
    super.update(dt);
  }
@override
  Future<void> onLoad() {
    add(RectangleHitbox(size: Vector2.all(14),position: Vector2(7,14)));
    return super.onLoad();
  }



}
