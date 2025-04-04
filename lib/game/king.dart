import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:meurpg_/src/king_sprite.dart';

class King extends PlatformPlayer with HandleForces {
  bool moveEnable = true;
  King({required super.position})
      : super(
            size: Vector2(78.0, 58.0),
            animation: KingSpritesheet.animations) {
    mass = 2;
  }


  @override
  void onJoystickChangeDirectional(JoystickDirectionalEvent event) {
    if(moveEnable){
      super.onJoystickChangeDirectional(event);
    }

  }
  @override
  void onJoystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && (event.id == 1 || event.id == LogicalKeyboardKey.space)) {
      jump(jumpSpeed: 200);
    }
    if (event.event == ActionEvent.DOWN && (event.id == 2 || event.id == LogicalKeyboardKey.keyZ)) {
      _execAttack();

    }

    super.onJoystickAction(event);
  }
  @override
  void onJump(JumpingStateEnum state) {
    if(state == JumpingStateEnum.idle){
      animation?.playOnceOther('ground',runToTheEnd: true,useCompFlip: true);
    }
    super.onJump(state);
  }

  void _execAttack(){
    animation?.playOnceOther('attack',runToTheEnd: true,useCompFlip: true);
    simpleAttackMelee(damage: 20, size: Vector2.all(32),direction: lastDirectionHorizontal,marginFromCenter: 15);
  }

  @override
  void onReceiveDamage(AttackOriginEnum attacker, double damage, identify) {
    animation?.playOnceOther('hit',runToTheEnd: true,useCompFlip: true);
    super.onReceiveDamage(attacker, damage, identify);
  }

  @override
  void onDie() {
    moveEnable = false;
    stopMove();

    animation?.playOnceOther('dead',runToTheEnd: true,useCompFlip: true,onFinish: removeFromParent);
    super.onDie();
  }
  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: Vector2.all(15), position: Vector2(31, 28)));
    return super.onLoad();
  }
}
