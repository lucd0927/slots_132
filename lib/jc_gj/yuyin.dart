// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.316367
import 'package:assets_audio_player/assets_audio_player.dart';


import '../hive/sshive.dart';
import 'log.dart';

const qianzhui = "assets/";
// SWAudioPlayer bgGGAudioPlayer = SWAudioPlayer(
//   audioKey: SWAudioPlayer.kAudioPlayerBg,
//   audioPath: "${qianzhui}audio/bg.mp3",
// );
// SWAudioPlayer btnGGAudioPlayer = SWAudioPlayer(
//   audioKey: SWAudioPlayer.kAudioPlayerScratch,
//   audioPath: "${qianzhui}audio/scratch2.mp3",
// );

class YuYinBoFan {
  String audioKey;
  String audioPath;

  YuYinBoFan({required this.audioKey, required this.audioPath});

  static const String kAudioPlayerBg = "kAudioPlayerBg";
  static const String kAudioPlayerScratch = "kAudioPlayerScratch";

  bool _hasOn = true;

  bool get hasOn => PBHive.box.get(audioKey) ?? true;

  final audioPlayer = AssetsAudioPlayer();

  setReleaseMode() async {}

  Future<void> play() async {
    pbLog("=====playLocalAssetBg==hasOn:$hasOn");
    if (hasOn) {
      await audioPlayer.open(
        Audio(audioPath),
        loopMode: LoopMode.single,
        autoStart: true,
      );
      audioPlayer.play();

      // await audioPlayer.play(AssetSource(audioPath), volume: 1);
    }
  }

  Future<void> stop() async {
    if (hasOn) {
      await audioPlayer.stop();
    }
  }

  void setSWHasOn(bool isOn, {required bool showAudioPlayOrPause}) {
    _hasOn = isOn;
    PlayerState state = audioPlayer.playerState.value;
    pbLog(
      "===GGAudioPlayer=audioKey:$audioKey=setHasOn=_hasOn=$_hasOn  state:$state",
    );
    PBHive.box.put(audioKey, isOn);
    if(showAudioPlayOrPause){
      if (isOn) {
        if (state == PlayerState.stop || state == PlayerState.pause) {
          play();
        } else {
          audioPlayer.pause();
        }
      } else {
        audioPlayer.pause();
      }
    }

  }

  pause() {
    pbLog("=====audioplayer=pause=hasOn:$hasOn");
    if (hasOn) {
      audioPlayer.pause();
    }
  }

  resume() {
    pbLog("=====audioplayer=resume=");
    if (hasOn) {
      audioPlayer.play();
      // auto patch 794
    }
  }
}
// class GGAudioPlayer {
//   String audioKey;
//   String audioPath;
//
//   GGAudioPlayer({required this.audioKey, required this.audioPath});
//
//   static const String kAudioPlayerBg = "kAudioPlayerBg";
//   static const String kAudioPlayerScratch = "kAudioPlayerScratch";
//
//   bool _hasOn = true;
//
//   bool get hasOn => GGHive.box.get(audioKey) ?? true;
//
//   void setHasOn(bool isOn) {
//     _hasOn = isOn;
//     PlayerState state = audioPlayer.state;
//     ggPrint(
//       "===GGAudioPlayer=audioKey:$audioKey=setHasOn=_hasOn=$_hasOn  state:$state",
//     );
//     GGHive.box.put(audioKey, isOn);
//     if (isOn) {
//       if (state == PlayerState.stopped) {
//         play();
//       } else {
//         audioPlayer.resume();
//       }
//     } else {
//       audioPlayer.pause();
//     }
//   }
//
//   final audioPlayer = AudioPlayer();
//
//   setReleaseMode() async {}
//
//   Future<void> play() async {
//     ggPrint("=====playLocalAssetBg==hasOn:$hasOn");
//     if (hasOn) {
//       final context = AudioContext(
//         iOS: AudioContextIOS(
//           category: AVAudioSessionCategory.playAndRecord,
//           options: {
//             AVAudioSessionOptions.defaultToSpeaker,
//             AVAudioSessionOptions.mixWithOthers, // 💡关键
//           },
//         ),
//         android: const AudioContextAndroid(
//           isSpeakerphoneOn: true,
//           stayAwake: false,
//           audioMode: AndroidAudioMode.inCommunication,
//           contentType: AndroidContentType.music,
//           usageType: AndroidUsageType.media,
//           audioFocus: AndroidAudioFocus.gain,
//         ),
//       );
//       audioPlayer.setAudioContext(context);
//       audioPlayer.setReleaseMode(ReleaseMode.loop);
//
//       await audioPlayer.play(AssetSource(audioPath), volume: 1);
//     }
//   }
//
//   // Future<void> playLocalAssetBg() async {
//   //   ggPrint("=====playLocalAssetBg==hasOn:$hasOn");
//   //   if (hasOn) {
//   //     audioPlayer.setReleaseMode(ReleaseMode.loop);
//   //
//   //     await audioPlayer.play(AssetSource("audio/bg.mp3"), volume: 1);
//   //   }
//   // }
//   //
//   // Future<void> playLocalAssetScratch() async {
//   //   if (hasOn) {
//   //     audioPlayer.setReleaseMode(ReleaseMode.loop);
//   //     await audioPlayer.play(AssetSource("audio/scratch2.mp3"));
//   //   }
//   // }
//
//   Future<void> stop() async {
//     if (hasOn) {
//       await audioPlayer.stop();
//     }
//   }
//
//   pause() {
//     ggPrint("=====audioplayer=pause=hasOn:$hasOn");
//     if (hasOn) {
//       audioPlayer.pause();
//     }
//   }
//
//   resume() {
//     ggPrint("=====audioplayer=resume=");
//     if (hasOn) {
//       audioPlayer.resume();
//       // auto patch 794
//     }
//   }
// }
//
// // Dummy injected code for hash diff
// void _dummyHashAdjuster_130184() {
//   // auto patch 513
//   final now = DateTime.now().microsecondsSinceEpoch;
//   if (now == 609203819) print('Unreachable dummy code');
// }
