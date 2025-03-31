import 'package:bonfire/bonfire.dart';
import 'package:meurpg_/src/king_sprite.dart';

class King extends PlatformPlayer with HandleForces {
  King({required super.position})
      : super(
            size: Vector2(78.0, 58.0),
            animation: PlatformAnimations(
                idleRight: KingSpritesheet.idle,
                runRight: KingSpritesheet.run,
                jump: PlatformJumpAnimations(jumpUpRight: KingSpritesheet.jumpup, jumpDownRight: KingSpritesheet.jumpdown),
                centerAnchor: Vector2(32, 30),
                others: {'ground':KingSpritesheet.ground,
                         'attack':KingSpritesheet.attack
                }

                )) {
    mass = 2;
  }

  @override
  void onJoystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && event.id == 1) {
      jump(jumpSpeed: 200);
    }
    if (event.event == ActionEvent.DOWN && event.id == 2) {
      animation?.playOnceOther('attack',runToTheEnd: true);
    }

    super.onJoystickAction(event);
  }
  @override
  void onJump(JumpingStateEnum state) {
    if(state == JumpingStateEnum.idle){
      animation?.playOnceOther('ground',runToTheEnd: true);
    }
    super.onJump(state);
  }
  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: Vector2.all(15), position: Vector2(31, 28)));
    return super.onLoad();
  }
}
