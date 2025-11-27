
abstract class BaseEvent{
  String eventName();
}


class WheelEvent extends BaseEvent{
  @override
  String eventName() {
    // TODO: implement eventName
    return "WheelEvent";
  }

}