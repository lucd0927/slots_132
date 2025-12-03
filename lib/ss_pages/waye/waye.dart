import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SSWaye extends StatefulWidget {
  const SSWaye({super.key});

  @override
  State<SSWaye> createState() => _SSWayeState();
}

class _SSWayeState extends State<SSWaye> {
  late WebViewController controller;
  bool jiazaiCompleted = false;


  initCont() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint("加载进度: $progress%");
            if (progress == 100) {
              setState(() {
                jiazaiCompleted = true;
              });
            } else {
              setState(() {
                jiazaiCompleted = false;
              });
            }
          },
          onPageStarted: (String url) {
            debugPrint("开始加载: $url");
          },
          onPageFinished: (String url) {
            debugPrint("加载完成: $url");
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("加载错误: $error");
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://tinyurl.com/y9nht47w'));
  }

  @override
  void initState() {
    super.initState();
    initCont();

    // PBMaiDian.h5_page();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              dingbu(),
              Expanded(
                child: Stack(
                  children: [
                    WebViewWidget(controller: controller),
                    if (!jiazaiCompleted) Positioned.fill(child: loading()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  loading() {
    return CupertinoActivityIndicator();
  }

  dingbu() {
    return Container(
      width: double.infinity,
      height: ScreenUtil().statusBarHeight + 50,
      color: Color(0xff4562F5),
      child: Column(
        children: [
          SizedBox(height: ScreenUtil().statusBarHeight),

          Row(children: [back()]),
        ],
      ),
    );
  }

  back() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 50,
        height: 50,
        color: Colors.transparent,
        child: Icon(Icons.arrow_back_ios_new, size: 30, color: Colors.white),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
