package com.fsgp.foreground_service_gp

import android.app.Activity
import android.content.Intent
import android.widget.RemoteViews
import androidx.core.content.ContextCompat
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.ProcessLifecycleOwner
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry


/** ForegroundServiceGpPlugin */
class ForegroundServiceGpPlugin :
    FlutterPlugin,
    MethodCallHandler, PluginRegistry.NewIntentListener, ActivityAware {
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private  var activity: Activity? =null
//    private lateinit var appContext: android.content.Context
    private  val TGA = "ForegroundServiceGpPlugin"

    private  var intentData:String? =null

    companion object {
        // 静态 Channel，可以在 Service 里调用
//        var channel: MethodChannel? = null
        // 让 Service 能访问
        var channelRef: MethodChannel? = null
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "foreground_service_gp")
        channel.setMethodCallHandler(this)

        channelRef = channel   // 关键
//        appContext = flutterPluginBinding.applicationContext
    }

    fun isForeground(): Boolean{
        val result =ProcessLifecycleOwner.get()
            .lifecycle
            .currentState
            .isAtLeast(Lifecycle.State.STARTED)
        return  result
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
                    val imgNameBg = call.argument<String>("imgNameBg") ?: ""
                    val imgNameSmall = call.argument<String>("imgNameSmall") ?: ""

                    val intent = Intent(activity, AppForegroundService::class.java)
                    intent.putExtra("title", title)
                    intent.putExtra("content", content)
                    intent.putExtra("imgNameBg", imgNameBg)
                    intent.putExtra("imgNameSmall", imgNameSmall)
                    if(activity == null){
                        result.success(false)
                        return
                    }
                    val isFg = isForeground()
                    println("$TGA start isForeground:$isFg AppForegroundService.sIsRunning:${AppForegroundService.sIsRunning}")
//                    isFg = true
                    if (isFg && !AppForegroundService.sIsRunning) {
                        ContextCompat.startForegroundService(activity!!,intent)
//                    if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
//                        activity!!.startForegroundService(intent)
//                    } else {
//                        activity!!.startService(intent)
//                    }
                        onInvo()
                        result.success(true)
                    } else {
                        result.success(false)
                    }



                }

                "stop" -> {
                    val intent = Intent(activity, AppForegroundService::class.java)
                    activity?.stopService(intent)
                    result.success(true)
                }

                else -> result.notImplemented()
            }
        }
    }


    private fun onInvo(){
        println("$TGA onNotificationClick intentData:$intentData")
        if(intentData != null){
            intentData = null
            channelRef
                ?.invokeMethod("onNotificationClick", true)
        }

    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        channelRef = null
    }

    override fun onNewIntent(intent: Intent): Boolean {
        println("$TGA onNewIntent intent:$intent")
        val a = intent.getStringExtra("fix_tx")
        intentData = a
        onInvo()
        return true
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        val activity = binding.getActivity()
        this.activity = activity
        binding.addOnNewIntentListener(this)
        val initIntent = activity.getIntent()
        val a = initIntent.getStringExtra("fix_tx")
        intentData = a

    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
//        val activity = binding.getActivity()
//        val initIntent = activity.getIntent()
//        onInvo()
//        println("$TGA onReattachedToActivityForConfigChanges initIntent：$initIntent")
    }

    override fun onDetachedFromActivity() {
    }
}
