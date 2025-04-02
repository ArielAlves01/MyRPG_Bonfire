import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:meurpg_/game/king.dart';
import 'package:meurpg_/game/pig.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RPG(),
    );
  }
}

class RPG extends StatelessWidget {
  const RPG({super.key});

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      playerControllers: [
        Keyboard(config: KeyboardConfig()),
        Joystick(
          directional: JoystickDirectional(),
        actions: [JoystickAction(actionId: 1),JoystickAction(actionId: 2,margin: EdgeInsets.only(bottom: 50,right: 120),color: Colors.red)]
        )
      ],
      map: WorldMapByTiled(WorldMapReader.fromAsset('map/mapa.tmj'),
          objectsBuilder: {
            'pig':(properties) => Pig(position:properties.position)
          },
          forceTileSize: Vector2(32, 32)),
      cameraConfig:
          CameraConfig(zoom: getZoomFromMaxVisibleTile(context, 32.0, 15),moveOnlyMapArea: true),
      backgroundColor: Color(0xFF3F3851),
      player: King(position: Vector2(300, 100)),
      globalForces: [GravityForce2D()],
      showCollisionArea: true,
    );
  }
}
