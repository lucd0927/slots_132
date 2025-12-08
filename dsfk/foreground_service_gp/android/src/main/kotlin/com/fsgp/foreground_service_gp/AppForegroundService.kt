package com.fsgp.foreground_service_gp


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
            if (intent?.action == ACTION_CLICK) {
                // 回调 Flutter
                ForegroundServiceGpPlugin.channel?.invokeMethod("onNotificationClick", null)
            }
        }
    }


    override fun onCreate() {
        super.onCreate()
        createChannel()

        // 注册 BroadcastReceiver
        val filter = IntentFilter(ACTION_CLICK)
        registerReceiver(clickReceiver, filter)
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {

        val title = intent?.getStringExtra("title") ?: "Service Running"
        val content = intent?.getStringExtra("content") ?: "App is running in background"

        println("===foreground=onStartCommand===title:${title}==content:$content=")
        val remoteViews = RemoteViews(packageName, R.layout.noti_c)
        remoteViews.setTextViewText(R.id.title, title)
        remoteViews.setTextViewText(R.id.content, content)
        val clickIntent = Intent(ACTION_CLICK)
        val pendingIntent = PendingIntent.getBroadcast(
            this,
            0,
            clickIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        remoteViews.setOnClickPendingIntent(R.id.lltop,pendingIntent)
        val notification = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle(title)
            .setContentText(content)
            .setCustomContentView(remoteViews)
            .setSmallIcon(android.R.drawable.ic_dialog_info)
            .setOngoing(true)
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
        unregisterReceiver(clickReceiver)
    }
}
