package com.fsgp.foreground_service_gp


import android.Manifest
import android.app.*
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.widget.RemoteViews
import androidx.annotation.RequiresPermission
import androidx.core.app.NotificationChannelCompat
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.ProcessLifecycleOwner


class AppForegroundService : Service() {

    companion object {
        const val CHANNEL_ID = "my_foreground_channel"
        const val NOTIFY_ID = 1001
        const val SERVICE_ID = 1002
         var sIsRunning = false
    }

    override fun onCreate() {
        super.onCreate()
        sIsRunning = true
    }

    @RequiresPermission(Manifest.permission.POST_NOTIFICATIONS)
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {

        try {

            val title = intent?.getStringExtra("title") ?: "Lucky Claus Slots"
            val content = intent?.getStringExtra("content") ?: "My Cash = $1000"
            val imgNameBg = intent?.getStringExtra("imgNameBg") ?: ""
            val imgNameSmall = intent?.getStringExtra("imgNameSmall") ?: ""

            println("===foreground=onStartCommand===title:${title}==content:$content=")
            val remoteViews = RemoteViews(packageName, R.layout.noti_c)
            remoteViews.setTextViewText(R.id.title, title)
            remoteViews.setTextViewText(R.id.content, content)
            remoteViews.setImageViewResource(
                R.id.noti_bg,
                applicationContext.resources.getIdentifier(imgNameBg, "drawable", packageName)
            )
            remoteViews.setImageViewResource(
                R.id.left_img,
                applicationContext.resources.getIdentifier(imgNameSmall, "drawable", packageName)
            )


            val clickIntent =
                applicationContext.packageManager.getLaunchIntentForPackage(packageName)
            clickIntent?.putExtra("fix_tx", "android")
            val pendingIntent = PendingIntent.getActivity(
                this,
                0,
                clickIntent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            val notification = NotificationCompat.Builder(this, CHANNEL_ID)
                .setSmallIcon(
                    applicationContext.resources.getIdentifier(
                        "ic_launcher",
                        "mipmap",
                        packageName
                    )
                )
                .setAutoCancel(false)
                .setStyle(NotificationCompat.DecoratedCustomViewStyle())
                .setPriority(NotificationCompat.PRIORITY_DEFAULT)
                .setOngoing(true)
                .setOnlyAlertOnce(true)
                .setSound(null)
                .setCategory(NotificationCompat.CATEGORY_SERVICE)
                .setCustomContentView(remoteViews)
                .setCustomBigContentView(remoteViews)
                .setCustomHeadsUpContentView(remoteViews)
                .setContentIntent(pendingIntent)
                .build()

            val nmc = NotificationManagerCompat.from(applicationContext)
            nmc.createNotificationChannel(
                NotificationChannelCompat.Builder(
                    CHANNEL_ID,
                    NotificationManagerCompat.IMPORTANCE_DEFAULT
                )
                    .setName("Slots Foreground Service")
                    .setSound(null, null)
                    .setLightsEnabled(false)
                    .setShowBadge(false)
                    .build()
            )



            nmc.notify(NOTIFY_ID, notification)




            if (ProcessLifecycleOwner.get()
                    .lifecycle
                    .currentState
                    .isAtLeast(Lifecycle.State.STARTED) && sIsRunning
            ) {
                // App 在前台运行
                println("===foreground=onStartCommand===app in foreground===")
                startForeground(NOTIFY_ID, notification)
//            ServiceCompat.startForeground(this,NOTIFY_ID, notification,FOREGROUND_SERVICE_TYPE_SPECIAL_USE)
//            ServiceCompat.startForeground(this,NOTIFY_ID, notification,if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
//                FOREGROUND_SERVICE_TYPE_SPECIAL_USE
//            } else {
//                0
//            })
//            ServiceCompat.startForeground()
            } else {
                // App 在后台运行
                println("===foreground=onStartCommand===app in background===")
//              stopSelf()

            }


        } catch (e: Exception) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
                && e is ForegroundServiceStartNotAllowedException
            ) {
                println("===foreground=onStartCommand===app in background===ForegroundServiceStartNotAllowedException:${e.message}")
                // App not in a valid state to start foreground service
                // (e.g. started from bg)
            }
            // ...
        }



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
        sIsRunning = false
    }

}
