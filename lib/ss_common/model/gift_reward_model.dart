
enum EnumGiftRewardModel { spin, cash, iphoneCard, xp }

class GiftRewardModel {
  final EnumGiftRewardModel rewardModelType;
  final String img;
  final int num;

  const GiftRewardModel({
    required this.rewardModelType,
    required this.num,
    required this.img,
  });
}
