// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.316367
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:slots_132/jc_hive/sshive.dart';


import 'log.dart';

const prevVvvv = "assets/";
SSAudio bgMusic = SSAudio(
  audioKey: SSAudio.kAudioPlayerBg,
  audioPath: "${prevVvvv}audddd/bg.mp3",
);
SSAudio btnAudio = SSAudio(
  audioKey: SSAudio.kAudioPlayerScratch,
  audioPath: "${prevVvvv}audddd/scratch2.mp3",
);

class SSAudio {
  String audioKey;
  String audioPath;

  SSAudio({required this.audioKey, required this.audioPath});

  static const String kAudioPlayerBg = "dfghdhg";
  static const String kAudioPlayerScratch = "sdfgsdfgsdf";

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

