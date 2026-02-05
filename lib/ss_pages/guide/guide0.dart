import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_tushi.dart';
import 'package:slots_132/jc_gj/jc_widget/ss_rotate.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/sssssp/spine_splash_fangzi.dart';
import 'package:slots_132/ss_pages/guide/snow_widget.dart';
import 'package:slots_132/ss_pages/guide/test22.dart';
import 'package:slots_132/ss_pages/guide/testaaa.dart';
import 'package:slots_132/ss_pages/guide/tornado_animation.dart';
import 'package:slots_132/ss_pages/guide/videoplayer.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer_effect.dart';

class OverlayGuide0BGuide {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show({bool showTask = true}) {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Container(
            child: Guide0BGuideWidget(
              coins: 10,
              onClose: () async {
                ssLogggg("=====OverlayGuideTestAnim=close");
                close();
              },
              showTask: showTask,
            ),
          ),
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlayEntry!);

    _isShowing = true;
  }

  String kHashCode = "";

  void close() {
    _isShowing = false;
    _overlayEntry?.remove();
  }
}

class Guide0BGuideWidget extends StatefulWidget {
  const Guide0BGuideWidget({
    super.key,
    required this.onClose,
    required this.coins, required this.showTask,
  });

  final VoidCallback onClose;
  final double coins;
  final bool showTask;
  @override
  State<Guide0BGuideWidget> createState() => Guide0BGuideWidgetState();
}

class Guide0BGuideWidgetState extends State<Guide0BGuideWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  int stepIndex = 0;

  Duration _nextDuration = Duration(milliseconds: 2500);
  Timer? _timer0;
  static var box = SSHive.box;
  static const String key_guide0_done = "key_guide0_done1";
  static const String key_guide4_done = "key_guide4_done121";
  static const String key_guide4_play = "key_guide4_play1";
  static const String key_guide3_done_starengine =
      "key_guide3_done_starengine2";

  static int get guide0Done => box.get(key_guide0_done, defaultValue: -1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showStep4Task = widget.showTask;
    stepIndex = guide0Done;
    if (stepIndex <= 0) {
      stepIndex = 0;
    }
    ssLogggg("=====stepIndex$stepIndex=close");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });

        if (stepIndex == 1) {
          _guide0Next();
        } else if (stepIndex == 2) {
          _guide1Next();
        } else if (stepIndex == 3) {
          setSafeSetState(() {
            showStep3Tips1 = true;
            if (guide3DoneStarengine()) {
              showStep3Tips2 = true;
              showStep3Tips3 = true;
              Future.delayed(Duration(milliseconds: 1000), () {
                setSafeSetState(() {
                  showStep3Tips4 = true;
                });
              });
              return;
            } else {
              Future.delayed(Duration(milliseconds: 3000), () {
                setSafeSetState(() {
                  showStep3Tips2 = true;
                });
              });
            }
          });
        } else if (stepIndex == 4) {
          bool hasGi = guide4Done();
          ssLogggg("=======guide4Done:${hasGi}==");
          if (hasGi) {
            setSafeSetState(() {
              showStep4Tips1 = true;
              showStep4Tips2 = true;
              showStep4Tips3 = true;
            });
            return;
          } else if (guide4Play()) {
            setSafeSetState(() {
              showStep4Tips1 = true;
              showStep4Tips2 = true;
            });
          } else {
            setSafeSetState(() {
              showStep4Tips1 = true;
            });
          }
        }
      }
    });
  }

  static bool guide4Done() {
    var box = SSHive.box;
    return box.get(key_guide4_done, defaultValue: false);
  }

  static bool guide4Play() {
    var box = SSHive.box;
    return box.get(key_guide4_play, defaultValue: false);
  }

  _cancelAllTimer() {
    _timer0?.cancel();
  }

  setSafeSetState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }

  final Duration _timerD = Duration(milliseconds: 3000);
  int maxIndex = 4;

  bool guide3DoneStarengine() {
    return box.get(key_guide3_done_starengine, defaultValue: false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ssLogggg("=====_GuideTestWidgetState=close");
        // widget.onClose();
      },
      child: AnimatedContainer(
        duration: animD,
        color: Colors.black.withValues(alpha: showAnimated ? 0.8 : 0),
        child: AnimatedScale(
          duration: animD,
          scale: showAnimated ? 1.0 : 1.0,
          child: Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            color: Colors.black.withValues(alpha: 0.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(child: stepWidget()),

                // Positioned.fill(child:SpineSplashFangzi(),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget stepWidget() {
    return IndexedStack(
      index: stepIndex,
      children: [
        stepWidget0(),
        stepWidget1(),
        stepWidget2(),
        stepWidget3(),
        stepWidget4(),
      ],
    );
  }

  bool showStep4Tips1 = false;
  bool showStep4Tips2 = false;
  bool showStep4Tips3 = false;
  bool showStep4Tips4 = false;
  bool showStep4Task = true;

  btn4Play() {
    return GestureDetector(
      onTap: () {
        setSafeSetState(() {
          showStep4Tips1 = true;
          MainController.to.onAddCollectStar(-1);
          box.put(key_guide4_play, true);
        });
      },
      child: Container(
        width: 277.h,
        height: 48.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              Assets.img.btnWheel.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 8.h,
              top: 0,
              child: Center(
                child: SSTxtBorder(
                  text: "PLAY",
                  fontSize: 18.sp,
                  fontFamily: FontFamily.interBold,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            Positioned(
              child: Center(child: StarWidget(height: 30.h, star: -1)),
              left: 0,
              right: 0,
              bottom: -40.h,
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _tasks = [
    {
      "imgPath": Assets.task.task1.path,
      "title": "Fix Fireplace",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task2.path,
      "title": "Clean Floor",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task3.path,
      "title": "Fix Window",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task4.path,
      "title": "Place Rug",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task5.path,
      "title": "New Armchair",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task6.path,
      "title": "Coffee Table",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task7.path,
      "title": "Dust the Shelf",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task8.path,
      "title": "Fix Lamps",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task9.path,
      "title": "Hang Curtains",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task10.path,
      "title": "The Tree!",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task11.path,
      "title": "Tree Lights",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task12.path,
      "title": "Ornaments",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task13.path,
      "title": "Tree Topper",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task14.path,
      "title": "Gift Boxes",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task15.path,
      "title": "Wall Painting",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task16.path,
      "title": "Gramophone",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task17.path,
      "title": "Stockings",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task18.path,
      "title": "Cookie Plate",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task19.path,
      "title": "Pet Bed",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task20.path,
      "title": "Adopt Reindeer",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task21.path,
      "title": "Wreath",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task22.path,
      "title": "Garlands",
      "des": "",
      "imgPath2": "",
    },
    {
      "imgPath": Assets.task.task23.path,
      "title": "Start Party",
      "des": "",
      "imgPath2": "",
    },
  ];

  taskWidget() {
    List<Widget> taskItems2 = [];
    for (int i = 0; i < _tasks.length; i++) {
      var task = _tasks[i];
      double progress = 0.0;
      String progressText = "";
      String imgPath2 = Assets.imga2.guide4TaskPlay.path;
      if (i <= 1) {
        imgPath2 = Assets.imga2.guide4Ok.path;
        progress = 1;
        progressText = "${i + 1}/${i + 1}";
      } else if (i == 2) {
        imgPath2 = Assets.imga2.guide4Play.path;
        int collected = MainController.to.curCollectStar.value;
        int max = (i + 1) * (i + 1);
        progress = collected / max;
        progressText = "${collected}/${max}";
      } else {
        progress = 0;
        progressText = "0/${(i + 1) * (i + 1)}";
      }

      Widget imte = GestureDetector(
        onTap: () {
          if (i == 2) {
            widget.onClose();
          } else if (i > 2) {
            ssTushi(text: "Coming Soon!");
          } else {
            ssTushi(text: "Task Completed!");
          }
        },
        child: taskItem(
          imgPath: task["imgPath"],
          title: task["title"],
          imgPath2: imgPath2,
          progress: progress,
          progressText: progressText,
        ),
      );

      taskItems2.add(imte);
    }

    return Container(
      width: 346.w,
      height: 605.h,
      // color: Colors.yellow,
      child: Stack(
        children: [
          Image.asset(
            Assets.imga2.guide4TaskBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned.fill(
            top: 20.h,
            bottom: 20.h,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 0.w, bottom: 20.w),
              child: Column(children: taskItems2),
            ),
          ),
        ],
      ),
    );
  }

  taskItem({
    required String imgPath,
    required String title,
    required String imgPath2,
    required double progress,
    required String progressText,
  }) {
    return Container(
      width: 317.w,
      height: 80.h,
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffEA4145), width: 1.2),
        gradient: LinearGradient(
          colors: [Color(0xffFFFEDF), Color(0xffEDD9D9)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Container(
            width: 60.h,
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.h),
              color: Color(0xffFFCFB7),
              border: Border.all(color: Color(0xffFFE2A8), width: 1.w),
            ),
            child: Center(
              child: Image.asset(
                imgPath,
                width: 60.w,
                height: 60.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14.sp, color: Color(0xff431414)),
                ),
                SSProjjjj(
                  height: 20.h,
                  innerHeight: 16.h,
                  width: 140.w,
                  progress: progress,
                  gradientColors: [Color(0xff48EF04), Color(0xff008301)],
                  bgColor: Color(0xff090909),
                  text: progressText,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Image.asset(imgPath2, width: 60.w, height: 60.h, fit: BoxFit.contain),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }

  stepWidget4() {
    Widget child = GestureDetector(
      onTap: () {
        if (showStep4Tips2 && !showStep4Tips3) {
          setSafeSetState(() {
            showStep4Tips3 = true;
            box.put(key_guide4_done, true);
            MainController.to.onAddCollectStar(-2);
          });
        } else if (showStep4Tips3) {
          box.put(key_guide4_done, true);
          // widget.onClose();
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.yellow.shade50.withValues(alpha: 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              showStep4Tips3
                  ? Assets.imga2.guide32.path
                  : showStep4Tips2
                  ? Assets.imga2.guide312.path
                  : showStep4Tips1
                  ? Assets.imga2.guide3.path
                  : Assets.imga2.guide3.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              gaplessPlayback: true,
            ),

            Positioned(
              bottom: 50.h,
              child: AnimatedSize(
                alignment: Alignment.topCenter,
                duration: Duration(milliseconds: 1200),
                child: showStep4Tips2 && !showStep4Tips3
                    ? Container(
                        width: 364.w,
                        height: 320.h,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 20.w,
                              child: Image.asset(
                                Assets.imga2.guide3Sdlr.path,
                                width: 148.w,
                                height: 262.h,
                                fit: BoxFit.contain,
                                gaplessPlayback: true,
                              ),
                            ),

                            Positioned(
                              bottom: 0,
                              child: stepIndex == 4
                                  ? Container(
                                      width: 360.w,
                                      height: 130.h,
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            Assets.imga2.duihuakuang.path,
                                            width: 360.w,
                                            height: 130.h,
                                            fit: BoxFit.fill,
                                            gaplessPlayback: true,
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 16.w,
                                              ),
                                              child: AnimatedTextKit(
                                                animatedTexts: [
                                                  TypewriterAnimatedText(
                                                    'Much better! But the floor is still dirty...',
                                                    textStyle: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          FontFamily.rubik,
                                                    ),
                                                    speed: const Duration(
                                                      milliseconds: 100,
                                                    ),
                                                  ),
                                                ],

                                                totalRepeatCount: 1,
                                                pause: const Duration(
                                                  milliseconds: 10,
                                                ),
                                                displayFullTextOnTap: true,
                                                stopPauseOnTap: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(width: 360.w),
                            ),
                          ],
                        ),
                      )
                    : Container(width: 375.w),
              ),
            ),

            if (!showStep4Tips1)
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                left: 0,
                right: 0,
                bottom: 80.h,
                child: Center(child: btn4Play()),
              ),

            if (!showStep4Tips1)
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                right: 0,
                bottom: 100.h,
                child: IgnorePointer(
                  child: SSAScale(
                    child: Image.asset(
                      Assets.imga2.gesture2.path,
                      width: 125.w,
                      height: 130.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

            if (showStep4Tips1 && !showStep4Tips2)
              VideoApp(
                onStart: () {},
                onEnd: () {
                  setSafeSetState(() {
                    showStep4Tips2 = true;
                  });
                },
                asset: Assets.video.fire,
              ),

            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              top: 50.h,
              right: 20.w,
              child: Center(
                child: AnimatedSize(
                  alignment: Alignment.topCenter,
                  duration: Duration(milliseconds: 1200),
                  child: StarWidget(),
                ),
              ),
            ),

            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              top: showStep4Tips3 ? 30.h : -200.h,
              left: 20.w,
              child: GestureDetector(
                onTap: () {
                  setSafeSetState(() {
                    showStep4Task = !showStep4Task;
                  });
                },
                child: Image.asset(
                  Assets.imga2.guide4Task.path,
                  width: 76.w,
                  height: 86.h,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              left: 0,
              right: showStep4Tips3 ? 0.h : -1000.w,
              // right: 0,
              bottom: 80.h,
              child: AnimatedSize(
                alignment: Alignment.topCenter,
                duration: Duration(milliseconds: 300),
                child: showStep4Task
                    ? Center(child: taskWidget())
                    : SizedBox(width: double.infinity),
              ),
            ),
            if (!showStep4Task)
              Positioned(
                right: -10.w,
                top: 200.h,
                child: GestureDetector(
                  onTap: () {
                    setSafeSetState(() {
                      showStep4Task = !showStep4Task;
                    });
                  },
                  child: SSAScale(
                    child: Image.asset(
                      Assets.imga2.gesture2.path,
                      width: 100.w,
                      height: 130.h,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    return AnimatedSize(
      alignment: Alignment.topCenter,
      duration: Duration(milliseconds: 500),
      child: stepIndex == 4 ? child : SizedBox(width: double.infinity),
    );
  }

  bool showStep3Tips1 = false;
  bool showStep3Tips2 = false;
  bool showStep3Tips3 = false;
  bool showStep3Tips4 = false;

  stepWidget3() {
    Widget child = Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.yellow.shade50.withValues(alpha: 0),
      child: showStep3Tips3
          ? GestureDetector(
              onTap: () {
                if (showStep3Tips4) {
                  setSafeSetState(() {
                    stepIndex = 4;
                    saveGuide0Done(4);
                  });
                }
              },
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: showStep3Tips1
                          ? Colors.black.withValues(alpha: 0.0)
                          : Colors.transparent,
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    bottom: showStep3Tips4 ? 350.h : 200.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: AnimatedSize(
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 1200),
                        child: showStep3Tips4
                            ? Container(
                                width: 364.w,
                                height: 320.h,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      left: 20.w,
                                      child: Image.asset(
                                        Assets.imga2.guide2Sdlr.path,
                                        width: 148.w,
                                        height: 262.h,
                                        fit: BoxFit.contain,
                                        gaplessPlayback: true,
                                      ),
                                    ),

                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        width: 360.w,
                                        height: 130.h,
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              Assets.imga2.duihuakuang.path,
                                              width: 360.w,
                                              height: 130.h,
                                              fit: BoxFit.fill,
                                              gaplessPlayback: true,
                                            ),
                                            Center(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 16.w,
                                                ),
                                                child: AnimatedTextKit(
                                                  animatedTexts: [
                                                    TypewriterAnimatedText(
                                                      'It works! We got some Stars!',
                                                      textStyle: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            FontFamily.rubik,
                                                      ),
                                                      speed: const Duration(
                                                        milliseconds: 100,
                                                      ),
                                                    ),
                                                  ],

                                                  totalRepeatCount: 1,
                                                  pause: const Duration(
                                                    milliseconds: 10,
                                                  ),
                                                  displayFullTextOnTap: true,
                                                  stopPauseOnTap: true,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Center(
                                child: Container(
                                  width: 360.w,
                                  height: 360.w,
                                  color: Colors.red.withValues(alpha: 0),
                                  child: Stack(
                                    children: [
                                      SSRotateWidget(
                                        duration: Duration(seconds: 30),
                                        child: Image.asset(
                                          Assets.img.xuanguang.path,
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Center(
                                        child: SSAScale(
                                          child: ShiningEffect(
                                            shineColor: Colors.white,
                                            opacity: 1,
                                            angle: 1.8,
                                            child: Image.asset(
                                              Assets.imga2.star.path,
                                              width: 152.w,
                                              height: 152.h,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),

                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    top: showStep3Tips4 ? 50.h : -200.h,
                    right: 20.w,
                    child: Center(
                      child: AnimatedSize(
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 1200),
                        child: showStep3Tips4
                            ? StarWidget()
                            : SizedBox(width: 324.w, height: 440.h),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Stack(
              clipBehavior: Clip.none,
              children: [
                if (!showStep3Tips1)
                  Image.asset(
                    Assets.imga2.guide2.path,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                    gaplessPlayback: true,
                  ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: showStep3Tips1
                        ? Colors.black.withValues(alpha: 0.0)
                        : Colors.transparent,
                  ),
                ),
                Positioned(
                  bottom: 250.h,
                  child: AnimatedSize(
                    alignment: Alignment.topCenter,
                    duration: Duration(milliseconds: 1200),
                    child: showStep3Tips1
                        ? Container(
                            width: 364.w,
                            height: 320.h,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: 20.w,
                                  child: Image.asset(
                                    Assets.imga2.guide2Sdlr.path,
                                    width: 148.w,
                                    height: 262.h,
                                    fit: BoxFit.contain,
                                    gaplessPlayback: true,
                                  ),
                                ),

                                !showStep3Tips1
                                    ? const SizedBox()
                                    : Positioned(
                                        bottom: 0,
                                        child: stepIndex == 3
                                            ? Container(
                                                width: 360.w,
                                                height: 130.h,
                                                child: Stack(
                                                  children: [
                                                    Image.asset(
                                                      Assets
                                                          .imga2
                                                          .duihuakuang
                                                          .path,
                                                      width: 360.w,
                                                      height: 130.h,
                                                      fit: BoxFit.fill,
                                                      gaplessPlayback: true,
                                                    ),
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 16.w,
                                                            ),
                                                        child: AnimatedTextKit(
                                                          animatedTexts: [
                                                            TypewriterAnimatedText(
                                                              'Tap here to start the machine',
                                                              textStyle: TextStyle(
                                                                fontSize: 16.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .rubik,
                                                              ),
                                                              speed:
                                                                  const Duration(
                                                                    milliseconds:
                                                                        100,
                                                                  ),
                                                            ),
                                                          ],

                                                          totalRepeatCount: 1,
                                                          pause: const Duration(
                                                            milliseconds: 10,
                                                          ),
                                                          displayFullTextOnTap:
                                                              true,
                                                          stopPauseOnTap: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : SizedBox(width: 360.w),
                                      ),
                              ],
                            ),
                          )
                        : Container(width: 375.w),
                  ),
                ),

                Positioned(
                  bottom: 10.h,
                  child: AnimatedSize(
                    alignment: Alignment.topCenter,
                    duration: Duration(milliseconds: 1200),
                    child: showStep3Tips2
                        ? Container(
                            width: 364.w,
                            height: 320.h,
                            child: Column(
                              children: [
                                SizedBox(height: 100.h),
                                SSAScale(
                                  child: Image.asset(
                                    Assets.imga2.gestureDown.path,
                                    width: 142.w,
                                    height: 142.h,
                                  ),
                                ),

                                GestureDetector(
                                  onTap: onStartEngine,
                                  child: Image.asset(
                                    Assets.imga2.btnStartengine.path,
                                    width: 254.w,
                                    height: 63.h,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(width: 375.w),
                  ),
                ),
                if (!showStep3Tips1)
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    left: 0,
                    right: 0,
                    bottom: 50.h,
                    child: Center(child: btn3Play()),
                  ),

                if (!showStep3Tips1)
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    right: 0,
                    bottom: !showStep3Tips1 ? -10.h : -200.h,
                    child: IgnorePointer(
                      child: SSAScale(
                        child: Image.asset(
                          Assets.imga2.gesture2.path,
                          width: 125.w,
                          height: 130.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );

    return AnimatedSize(
      alignment: Alignment.topCenter,
      duration: Duration(milliseconds: 500),
      child: stepIndex == 3 ? child : SizedBox(width: double.infinity),
    );
  }

  void onStartEngine() {
    widget.onClose();
    MainController.to.onStartRoller();
  }

  btn3Play() {
    return GestureDetector(
      onTap: () {
        setSafeSetState(() {
          showStep3Tips1 = true;
          Future.delayed(Duration(milliseconds: 3000), () {
            setSafeSetState(() {
              showStep3Tips2 = true;
            });
          });
        });
      },
      child: Container(
        width: 277.h,
        height: 48.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              Assets.img.btnWheel.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 8.h,
              top: 0,
              child: Center(
                child: SSTxtBorder(
                  text: "PLAY",
                  fontSize: 18.sp,
                  fontFamily: FontFamily.interBold,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool showStep2Tips1 = false;
  bool showStep2Tips2 = false;

  stepWidget2() {
    Widget child = Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            Assets.imga2.guide1.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            gaplessPlayback: true,
          ),
          SnowWidget(),
          Positioned(
            bottom: 50.h,
            child: AnimatedSize(
              alignment: Alignment.topCenter,
              duration: Duration(milliseconds: 1200),
              child: showStep2Tips1
                  ? Container(
                      width: 364.w,
                      height: 320.h,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            Assets.imga2.guide1Sdlr.path,
                            width: 180.w,
                            height: 320.h,
                            fit: BoxFit.contain,
                            gaplessPlayback: true,
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 300),
                            left: 0,
                            right: 0,
                            bottom: showStep2Tips2 ? 0.h : -200.h,
                            child: Center(child: btn2()),
                          ),

                          AnimatedPositioned(
                            duration: Duration(milliseconds: 300),
                            right: 0,
                            bottom: showStep2Tips2 ? 10.h : -200.h,
                            child: SSAScale(
                              child: Image.asset(
                                Assets.imga2.gestureLeftDown.path,
                                width: 104.w,
                                height: 97.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          showStep2Tips2
                              ? const SizedBox()
                              : Positioned(
                                  bottom: 0,
                                  child: stepIndex == 2
                                      ? Container(
                                          width: 360.w,
                                          height: 130.h,
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                Assets.imga2.duihuakuang.path,
                                                width: 360.w,
                                                height: 130.h,
                                                fit: BoxFit.fill,
                                                gaplessPlayback: true,
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 16.w,
                                                  ),
                                                  child: AnimatedTextKit(
                                                    animatedTexts: [
                                                      TypewriterAnimatedText(
                                                        'I remember we have a Magic Workshop in the basement',
                                                        textStyle: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              FontFamily.rubik,
                                                        ),
                                                        speed: const Duration(
                                                          milliseconds: 100,
                                                        ),
                                                      ),
                                                    ],

                                                    totalRepeatCount: 1,
                                                    pause: const Duration(
                                                      milliseconds: 10,
                                                    ),
                                                    displayFullTextOnTap: true,
                                                    stopPauseOnTap: true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(width: 360.w),
                                ),
                        ],
                      ),
                    )
                  : Container(width: 364.w),
            ),
          ),
        ],
      ),
    );

    return AnimatedSize(
      alignment: Alignment.topCenter,
      duration: Duration(milliseconds: 500),
      child: stepIndex == 2 ? child : SizedBox(width: double.infinity),
    );
  }

  btn2() {
    return GestureDetector(
      onTap: () {
        setSafeSetState(() {
          stepIndex = 3;
          saveGuide0Done(3);
        });
      },
      child: Container(
        width: 277.h,
        height: 48.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              Assets.img.btnWheel.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 8.h,
              top: 0,
              child: Center(
                child: SSTxtBorder(
                  text: "PLAY / LEVEL 1",
                  fontSize: 18.sp,
                  fontFamily: FontFamily.interBold,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _guide1Next() {
    Future.delayed(Duration(milliseconds: 800), () {
      setSafeSetState(() {
        showStep2Tips1 = true;
        Future.delayed(Duration(milliseconds: 6000), () {
          setSafeSetState(() {
            showStep2Tips2 = true;
          });
        });
      });
    });
  }

  btn1() {
    return GestureDetector(
      onTap: () {
        setSafeSetState(() {
          stepIndex = 2;
          saveGuide0Done(2);
          _guide1Next();
        });
      },
      child: Container(
        width: 277.h,
        height: 48.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              Assets.img.btnWheel.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 8.h,
              top: 0,
              child: Center(
                child: SSTxtBorder(
                  text: "GO TO WORKSHOP",
                  fontSize: 18.sp,
                  fontFamily: FontFamily.interBold,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool showStep1Tips1 = false;
  bool showStep1Tips2 = false;
  bool showStep1Tips2_1 = false;
  bool showStep1Tips3 = false;

  stepWidget1() {
    // if(stepIndex != 1){
    //   return SizedBox(width: double.infinity);
    // }
    return GestureDetector(
      onTap: (){
        // if(showStep1Tips1){
        //   showStep1Tips1 = true;
        // }else if(showStep1Tips2_1){
        //
        // }
        // setSafeSetState(() {
        //
        //
        // });
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              Assets.imga2.guide01.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              gaplessPlayback: true,
            ),
            SnowWidget(),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: showStep1Tips1
                      ? [
                          Color(0xff000000).withValues(alpha: 0.6),
                          Color(0xff000000).withValues(alpha: 0),
                          Color(0xff000000).withValues(alpha: 0.2),
                        ]
                      : [
                          Color(0xff000000).withValues(alpha: 0.0),
                          Color(0xff000000).withValues(alpha: 0),
                          Color(0xff000000).withValues(alpha: 0.0),
                        ],
                  stops: [0.0, 0.5, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 50.h,
              child: AnimatedSize(
                alignment: Alignment.topCenter,
                duration: Duration(milliseconds: 1200),
                child: showStep1Tips1
                    ? Container(
                        width: 364.w,
                        height: 320.h,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              Assets.imga2.guide0Sdlr.path,
                              width: 180.w,
                              height: 320.h,
                              fit: BoxFit.contain,
                              gaplessPlayback: true,
                            ),
                            AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              left: 0,
                              right: 0,
                              bottom: showStep1Tips2 ? 0.h : -200.h,
                              child: Center(child: btn1()),
                            ),
                            showStep1Tips2
                                ? const SizedBox()
                                : Positioned(
                                    bottom: 0,
                                    child: stepIndex == 1
                                        ? Container(
                                            width: 360.w,
                                            height: 130.h,
                                            child: Stack(
                                              children: [
                                                Image.asset(
                                                  Assets.imga2.duihuakuang.path,
                                                  width: 360.w,
                                                  height: 130.h,
                                                  fit: BoxFit.fill,
                                                  gaplessPlayback: true,
                                                ),
                                                Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: 16.w,
                                                    ),
                                                    child: AnimatedTextKit(
                                                      animatedTexts: [
                                                        TypewriterAnimatedText(
                                                          'Oh no! The Great Blizzard ruined the cabin !',
                                                          textStyle: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                FontFamily.rubik,
                                                          ),
                                                          speed: const Duration(
                                                            milliseconds: 100,
                                                          ),
                                                        ),
                                                      ],

                                                      totalRepeatCount: 1,
                                                      pause: const Duration(
                                                        milliseconds: 10,
                                                      ),
                                                      displayFullTextOnTap: true,
                                                      stopPauseOnTap: true,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(width: 360.w),
                                  ),
                          ],
                        ),
                      )
                    : Container(width: 364.w),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              // bottom: 100.h,
              right: 77.w,
              bottom: showStep1Tips2 ? 100.h : -200.h,
              child: Center(
                child: Image.asset(
                  Assets.imga2.next.path,
                  width: 129.w,
                  height: 141.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool showVidoeStart = false;
  bool showVidoeEnd = false;

  stepWidget0() {
    Widget child = Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            Assets.imga2.guide00.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            gaplessPlayback: true,
          ),
        ],
      ),
    );
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          child,
          SnowWidget(),
          if (stepIndex == 0)
            Positioned.fill(
              child: VideoApp(
                asset: Assets.video.splash,
                onStart: () {
                  setSafeSetState(() {
                    showVidoeStart = true;
                  });
                },
                onEnd: () {
                  _onGuide0End();
                },
              ),
            ),
        ],
      ),
    );

    // return CurvedPageFlipDemo(
    //   onEnd: () {
    //     setSafeSetState(() {
    //       stepIndex = 1;
    //
    //       Future.delayed(Duration(milliseconds: 500), () {
    //         setSafeSetState(() {
    //           showStep0Tips1 = true;
    //
    //           Future.delayed(Duration(milliseconds: 5000), () {
    //             setSafeSetState(() {
    //               showStep0Tips2 = true;
    //             });
    //           });
    //         });
    //       });
    //     });
    //   },
    // );
  }

  saveGuide0Done(int step) {
    box.put(key_guide0_done, step);
  }

  _guide0Next() {
    Future.delayed(Duration(milliseconds: 500), () {
      setSafeSetState(() {
        showStep1Tips1 = true;

        Future.delayed(Duration(milliseconds: 5000), () {
          setSafeSetState(() {
            showStep1Tips2 = true;
          });
        });
      });
    });
  }

  _onGuide0End() {
    setSafeSetState(() {
      stepIndex = 1;
      saveGuide0Done(1);
      _guide0Next();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  StarWidget({int? star, double? height}) {
    star ??= MainController.to.curCollectStar.value;
    return Container(
      width: 124.w,
      height: height ?? 44.h,
      decoration: BoxDecoration(
        color: Color(0xff722525),
        borderRadius: BorderRadius.circular(100.h),
        border: Border.all(color: Color(0xffFFCC00), width: 1.w),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Image.asset(Assets.imga2.star.path, width: 30.w, height: 30.w),
          Expanded(
            child: Center(
              child: SSTxtGraBorder(text: "${star}", fontSize: 24.sp),
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
