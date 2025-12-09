package com.fsgp.foreground_service_gp


import android.annotation.SuppressLint
import android.app.*
import android.content.BroadcastReceiver
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.widget.RemoteViews
import androidx.core.app.NotificationCompat

import android.content.Context
import android.content.IntentFilter

class AppForegroundService : Service() {

    companion object {
        const val CHANNEL_ID = "my_foreground_channel"
        const val NOTIFY_ID = 1001
        const val ACTION_CLICK = "com.fsgp.foreground.CLICK_NOTIFICATION"
    }

    // BroadcastReceiver
    private val clickReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            println("clickReceiver action:${intent?.action}")
            if (intent?.action == ACTION_CLICK) {
                launchAppPage("/notify")
                // ✅ 回调 Flutter
                ForegroundServiceGpPlugin.channelRef
                    ?.invokeMethod("onNotificationClick", null)
            }
        }
    }

    private fun launchAppPage(route: String) {
        println("clickReceiver launchAppPage:${route}")
        val launchIntent = packageManager.getLaunchIntentForPackage(packageName)
        launchIntent?.apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or
                    Intent.FLAG_ACTIVITY_SINGLE_TOP or
                    Intent.FLAG_ACTIVITY_CLEAR_TOP

            // ✅ 传递路由给 Flutter
            putExtra("flutter_route", route)
        }
        startActivity(launchIntent)
    }


    override fun onCreate() {
        super.onCreate()
        createChannel()

        // 注册 BroadcastReceiver
//        registerBroadcastReceiver()
    }

    @SuppressLint("UnspecifiedRegisterReceiverFlag")
    private fun registerBroadcastReceiver() {
        val filter = IntentFilter(ACTION_CLICK)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            registerReceiver(clickReceiver, filter, Context.RECEIVER_NOT_EXPORTED)
        } else {
            registerReceiver(clickReceiver, filter)
        }
    }

    private fun unregisterBroadcastReceiver() {
//        unregisterReceiver(clickReceiver)
    }


    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {

        val title = intent?.getStringExtra("title") ?: "Service Running"
        val content = intent?.getStringExtra("content") ?: "App is running in background"

        println("===foreground=onStartCommand===title:${title}==content:$content=")
        val remoteViews = RemoteViews(packageName, R.layout.noti_c)
        remoteViews.setTextViewText(R.id.title, title)
        remoteViews.setTextViewText(R.id.content, content)
        val clickIntent = applicationContext.packageManager.getLaunchIntentForPackage(packageName)
        clickIntent?.putExtra("fix_tx","android")
        val pendingIntent = PendingIntent.getActivity(
            this,
            0,
            clickIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )



//        remoteViews.setOnClickPendingIntent(R.id.lltop,pendingIntent)
        val notification = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle(title)
            .setContentText(content)
            .setCustomContentView(remoteViews)
            .setSmallIcon(android.R.drawable.menu_frame)
            .setOngoing(true)
            .setContentIntent(pendingIntent)
            .build()

        startForeground(NOTIFY_ID, notification)

        return START_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? = null

    private fun createChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                "Foreground Service",
                NotificationManager.IMPORTANCE_LOW
            )
            val mgr = getSystemService(NotificationManager::class.java)
            mgr.createNotificationChannel(channel)
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        // 记得注销
//        unregisterReceiver(clickReceiver)
        unregisterBroadcastReceiver()
    }
}
