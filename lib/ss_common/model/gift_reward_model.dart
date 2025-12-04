enum EnumGiftRewardModel {
  freespin("freespin"),
  cash("cash"),
  iphoneCard("iphoneCard"),
  xp("xp");


  final String name;
  const EnumGiftRewardModel(this.name);
}

class GiftRewardModel {
  final EnumGiftRewardModel rewardModelType;
  final String img;
  final double num;
  final int? time;

  GiftRewardModel({
    required this.rewardModelType,
    required this.num,
    required this.img,
    this.time,
  });


  Map toJson() {
    return {
      "rewardModelType": rewardModelType.name,
      "num": num,
      "img": img,
      "time": DateTime
          .now()
          .millisecondsSinceEpoch
    };
  }
}
