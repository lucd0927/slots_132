import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

class PBEventBus {
  static final EventBus eventBus = EventBus();

  static void fire(dynamic event) {
    eventBus.fire(event);
  }
}

mixin PBEventBusMixin<T extends StatefulWidget> on State<T> {
  EventBus get eventBus => PBEventBus.eventBus;

  final Map<String, StreamSubscription?> _eventMapStreams = {};

  bool get cancelOnError => false;
  String? _eventName;

  void register<E>(void Function(E event) onData) {
    // _eventStream?.cancel();
    // _eventStream = null;
    // if(!eventEnable)return;
    // _eventName = E.toString();
    // _eventStream = eventBus.on<E>().listen(onData, onError: eventError, onDone: eventDone, cancelOnError: cancelOnError);
    if (!eventEnable) return;
    assert(E != null);
    String eventName = E.toString();
    StreamSubscription? eventStream = _eventMapStreams[eventName];
    if (eventStream != null) {
      return;
    }
    eventStream = eventBus.on<E>().listen(
      onData,
      onError: eventError,
      onDone: eventDone,
      cancelOnError: cancelOnError,
    );
    _eventMapStreams[eventName] = eventStream;
  }

  void eventError(dynamic e) {}

  void eventDone() {}

  /*控制注册开关*/
  bool get eventEnable => true;

  @override
  void dispose() {
    for (var element in _eventMapStreams.values) {
      element?.cancel();
      element = null;
    }
    super.dispose();
  }
}

mixin PBEventBusMixin2 {
  EventBus get eventBus => PBEventBus.eventBus;

  final Map<String, StreamSubscription?> _eventMapStreams = {};

  bool get cancelOnError => false;
  String? _eventName;

  void register<E>(void Function(E event) onData) {
    // _eventStream?.cancel();
    // _eventStream = null;
    // if(!eventEnable)return;
    // _eventName = E.toString();
    // _eventStream = eventBus.on<E>().listen(onData, onError: eventError, onDone: eventDone, cancelOnError: cancelOnError);
    if (!eventEnable) return;
    assert(E != null);
    String eventName = E.toString();
    StreamSubscription? eventStream = _eventMapStreams[eventName];
    if (eventStream != null) {
      return;
    }
    eventStream = eventBus.on<E>().listen(
      onData,
      onError: eventError,
      onDone: eventDone,
      cancelOnError: cancelOnError,
    );
    _eventMapStreams[eventName] = eventStream;
  }

  void eventError(dynamic e) {}

  void eventDone() {}

  /*控制注册开关*/
  bool get eventEnable => true;

  void remove() {
    // LogUtil.d("KyyEventBusMixin2 dispose");
    for (var element in _eventMapStreams.values) {
      element?.cancel();
      element = null;
    }
  }

  void removeEventWithName<T>() {
    String eventName = T.toString();
    _eventMapStreams.forEach((key, value) {
      if (eventName == key) {
        value?.cancel();
        value = null;
      }
    });
  }
}
