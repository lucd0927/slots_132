package com.fsgp.foreground_service_gp

import android.content.Intent
import android.widget.RemoteViews
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result




/** ForegroundServiceGpPlugin */
class ForegroundServiceGpPlugin :
    FlutterPlugin,
    MethodCallHandler {
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
//    private lateinit var channel: MethodChannel
    private lateinit var appContext: android.content.Context


    companion object {
        // 静态 Channel，可以在 Service 里调用
        var channel: MethodChannel? = null
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "foreground_service_gp")
        channel?.setMethodCallHandler(this)
        appContext = flutterPluginBinding.applicationContext
    }



    override fun onMethodCall(
        call: MethodCall,
        result: Result
    ) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else {
            when (call.method) {
                "start" -> {
                    val title = call.argument<String>("title") ?: "Running"
                    val content = call.argument<String>("content") ?: "App is running"

                    val intent = Intent(appContext, AppForegroundService::class.java)
                    intent.putExtra("title", title)
                    intent.putExtra("content", content)

                    if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                        appContext.startForegroundService(intent)
                    } else {
                        appContext.startService(intent)
                    }

                    result.success(true)
                }

                "stop" -> {
                    val intent = Intent(appContext, AppForegroundService::class.java)
                    appContext.stopService(intent)
                    result.success(true)
                }

                else -> result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
    }
}
