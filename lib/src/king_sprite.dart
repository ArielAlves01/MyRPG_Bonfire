import 'package:bonfire/bonfire.dart';

abstract class KingSpritesheet {

static Future<SpriteAnimation> get idle => SpriteAnimation.load('king/idle.png', SpriteAnimationData.sequenced(amount: 11, stepTime: 0.1, textureSize: Vector2(78, 58)));

static Future<SpriteAnimation> get run => SpriteAnimation.load('king/run.png', SpriteAnimationData.sequenced(amount: 8, stepTime: 0.1, textureSize: Vector2(78, 58)));

static Future<SpriteAnimation> get jumpup => SpriteAnimation.load('king/jump.png', SpriteAnimationData.sequenced(amount: 1, stepTime: 0.1, textureSize: Vector2(78, 58)));

static Future<SpriteAnimation> get jumpdown => SpriteAnimation.load('king/fall.png', SpriteAnimationData.sequenced(amount: 1, stepTime: 0.1, textureSize: Vector2(78, 58)));

static Future<SpriteAnimation> get ground => SpriteAnimation.load('king/ground.png', SpriteAnimationData.sequenced(amount: 1, stepTime: 0.1, textureSize: Vector2(78, 58)));

static Future<SpriteAnimation> get attack => SpriteAnimation.load('king/attack.png', SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(78, 58)));

}