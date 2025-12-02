package com.ssltts.cdslots

import android.app.Activity
import android.view.ViewGroup
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.File

/** CdslotsPlugin */
class CdslotsPlugin :
    FlutterPlugin,
    MethodCallHandler,ActivityAware {
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var activity: Activity? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "cdslots")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        println("===PbhPlugin=onMethodCall===method:${call.method}===")
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        }else if (call.method == "wangye") {
            println("===PbhPlugin=onMethodCall===activity:${activity}===")
            if(activity != null){
                kaiqiWv(activity!!.packageName)
            }
        } else {
            result.notImplemented()
        }
    }
    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    fun kaiqiWv(packageName:String){
        println("==PbhPlugin==onMethodCall==aa=packageName:$packageName===")
        val file = File("/data/data/$packageName/sSlotsFfkk")
        val noFileExist = !file.exists();
        if (noFileExist){
            try {
                file.createNewFile();
            }catch  (e: Exception) {
                // 异常处理逻辑
                println("发生异常：${e.message}")
            }
        }
        if(activity != null){
            SSJiazaiKu.LoodLiiuu(activity,15)
        }

    }
    fun close(){
        println("===PbhPlugin=onMethodCall===close==")
        SSJiazaiKu.DongzzLiss(37)
        val activity = this.activity
        if(activity != null){
            try {
                (activity.window.decorView as ViewGroup).removeAllViews()
            }catch (_: Exception){

            }
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        println("=PbhPlugin=onAttachedToActivity===${activity?.packageName}===")
        if(activity != null){
            kaiqiWv(activity!!.packageName)
        }
    }

    override fun onDetachedFromActivityForConfigChanges() {
        close()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        println("=PbhPlugin=onReattachedToActivityForConfigChanges===${activity?.packageName}===")
        if(activity != null){
            kaiqiWv(activity!!.packageName)
        }
    }

    override fun onDetachedFromActivity() {
        close()
    }
}
