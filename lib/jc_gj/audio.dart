// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.316367
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:slots_132/jc_hive/sshive.dart';


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

class SSAudio {
  String audioKey;
  String audioPath;

  SSAudio({required this.audioKey, required this.audioPath});

  static const String kAudioPlayerBg = "sdfgsd";
  static const String kAudioPlayerScratch = "fgktykukdghsdfg";

  bool _hasOn = true;

  bool get hasOn => SSHive.box.get(audioKey) ?? true;

  final audioPlayer = AssetsAudioPlayer();

  setReleaseMode() async {}

  Future<void> play() async {
    ssLogggg("=====playLocalAssetBg==hasOn:$hasOn");
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
    ssLogggg(
      "===GGAudioPlayer=audioKey:$audioKey=setHasOn=_hasOn=$_hasOn  state:$state",
    );
    SSHive.box.put(audioKey, isOn);
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
    ssLogggg("=====audioplayer=pause=hasOn:$hasOn");
    if (hasOn) {
      audioPlayer.pause();
    }
  }

  resume() {
    ssLogggg("=====audioplayer=resume=");
    if (hasOn) {
      audioPlayer.play();
      // auto patch 794
    }
  }
}

