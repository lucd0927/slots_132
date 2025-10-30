import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newton_particles/newton_particles.dart';
import 'package:slots_132/gen/assets.gen.dart';

void main() {
  runApp(const ThumbUpExampleApp());
}

class ThumbUpExampleApp extends StatelessWidget {
  const ThumbUpExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = <int, Color>{
      50: Color.fromRGBO(27, 27, 29, .1),
      100: Color.fromRGBO(27, 27, 29, .2),
      200: Color.fromRGBO(27, 27, 29, .3),
      300: Color.fromRGBO(27, 27, 29, .4),
      400: Color.fromRGBO(27, 27, 29, .5),
      500: Color.fromRGBO(27, 27, 29, .6),
      600: Color.fromRGBO(27, 27, 29, .7),
      700: Color.fromRGBO(27, 27, 29, .8),
      800: Color.fromRGBO(27, 27, 29, .9),
      900: Color.fromRGBO(27, 27, 29, 1),
    };
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const MaterialColor(
          0x1b1b1d,
          primaryColor,
        ),
        canvasColor: const Color(0xff1b1b1d),
      ),
      home: const ThumbUpExample(),
    );
  }
}

class ThumbUpExample extends StatefulWidget {
  const ThumbUpExample({super.key});

  @override
  State<ThumbUpExample> createState() => _ThumbUpExampleState();
}

class _ThumbUpExampleState extends State<ThumbUpExample> {
  final _newtonKey = GlobalKey<NewtonState>();

  final List<ImageAssetShape> _imageAssets = [
    ImageAssetShape(Assets.img.money.path),
    // ImageAssetShape(Assets.img.money.path),
    // ImageAssetShape(Assets.img.money.path),
  ];

  final _emojiSize = 50.0;
  final _btnSize = 50.0;

  DeterministicEffectConfiguration currentActiveEffectConfiguration(int index, Duration delay) {
    return DeterministicEffectConfiguration(
      particleCount: 100,
      particlesPerEmit: 100,
      distanceCurve: Curves.slowMiddle,
      emitCurve: Curves.fastOutSlowIn,
      fadeInCurve: Curves.easeIn,
      fadeOutCurve: Curves.easeOut,
      emitDuration: const Duration(milliseconds: 250),
      minAngle: -135,
      maxAngle: -45,
      minDistance: 90,
      maxDistance: 220,
      maxParticleLifespan: const Duration(seconds: 3),
      minFadeOutThreshold: 0.6,
      maxFadeOutThreshold: 0.8,
      minBeginScale: 0.7,
      maxBeginScale: 0.9,
      minEndScale: 1,
      maxEndScale: 1.2,
      particleConfiguration: ParticleConfiguration(
        shape: _imageAssets[index],
        size: Size.square(_emojiSize),
      ),
      startDelay: delay,
      origin: const Offset(0.5, 0),
    );
  }

  dynamic ttt(){
    return   RelativisticEffectConfiguration(
      gravity: Gravity(-0,5),
      origin: Offset.zero,
      maxOriginOffset: const Offset(1, 0),
      maxAngle: 90,
      maxEndScale: 1,
      maxFadeOutThreshold: 0.8,
      maxParticleLifespan: const Duration(seconds: 7),
      minAngle: 90,
      minEndScale: 0.1,
      minFadeOutThreshold: 0.6,
      minParticleLifespan: const Duration(seconds: 1),
      particleConfiguration:  ParticleConfiguration(
        // shape:CircleShape(),
        shape: ImageAssetShape(Assets.img.money.path),
        size: Size(25, 25),
      ),
    );
  }

  dynamic ttt2(){
    return   RelativisticEffectConfiguration(
      gravity: Gravity(-0,2),
      origin: Offset.zero,
      maxOriginOffset: const Offset(1, 1),
      maxAngle: 90,
      maxEndScale: 1,
      maxFadeOutThreshold: 0.8,
      maxParticleLifespan: const Duration(seconds: 7),
      minAngle: 90,
      minEndScale: 1,
      minFadeOutThreshold: 0.6,
      minParticleLifespan: const Duration(seconds: 4),
      particleConfiguration:  ParticleConfiguration(
        // shape:CircleShape(),
        shape: ImageAssetShape(Assets.img.money.path),
        size: Size(25, 25),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      Future.delayed(Duration(milliseconds: 200),(){
        // _newtonKey.currentState?.addEffect(ttt());
        _newtonKey.currentState?.addEffect(ttt2());
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Newton(
        key: _newtonKey,
        child: SizedBox(
          width: _btnSize,
          height: _btnSize,

        ),
      ),
    );
  }
}
