// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.316367
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:slots_132/jc_hive/sshive.dart';

import 'log.dart';

const prevVvvv = "assets/";
SSAudio bgMusic = SSAudio(
  audioKey: SSAudio.kAudioPlayerBg,
  audioPath: "${prevVvvv}audddd/bg.mp3",
);
SSAudio bgMusicFreeSpin = SSAudio(
  audioKey: SSAudio.kAudioPlayerBg,
  audioPath: "${prevVvvv}audddd/bg_freespin.mp3",
);
SSAudio btnJackpot = SSAudio(
  audioKey: SSAudio.kAudioPlayerScratch,
  audioPath: "${prevVvvv}audddd/jackpot.mp3",
);

SSAudio btnSpinClick = SSAudio(
  audioKey: "xxxxxaaa",
  audioPath: "${prevVvvv}audddd/spin_click.mp3",
);
SSAudio btnWheel = SSAudio(
  audioKey: "121weaasdf",
  audioPath: "${prevVvvv}audddd/wheel.mp3",
);

SSAudio btnBonusGameClick = SSAudio(
  audioKey: "adf564wer",
  audioPath: "${prevVvvv}audddd/bonus_game_click.mp3",
);

SSAudio btnFreespinPre = SSAudio(
  audioKey: "dfg45gjrgds",
  audioPath: "${prevVvvv}audddd/btn_freespin_pre.mp3",
);

SSAudio btnMoney = SSAudio(
  audioKey: "dfg45gjrgds",
  audioPath: "${prevVvvv}audddd/money.mp3",
);

SSAudio btnBoxGift = SSAudio(
  audioKey: "ertye543ert",
  audioPath: "${prevVvvv}audddd/boxgift.mp3",
);

SSAudio btnSpinCenterIndex = SSAudio(
  audioKey: "btnS12pinCenterIndex",
  audioPath: "${prevVvvv}audddd/spin_centerindex.mp3",
);

SSAudio btnSpinLastIndex = SSAudio(
  audioKey: "btnSpin56LastIndex",
  audioPath: "${prevVvvv}audddd/spin_lastindex.mp3",
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

  Future<void> play({LoopMode loopMode = LoopMode.none}) async {
    ssLogggg("=====playLocalAssetBg==hasOn:$hasOn");
    if (hasOn) {
      await audioPlayer.open(
        Audio(audioPath),
        loopMode: loopMode,
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
    if (showAudioPlayOrPause) {
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
