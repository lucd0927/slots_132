package com.ssltts.cdslots;
import android.os.Handler;
import android.os.Message;

import androidx.annotation.Keep;
@Keep
public class SSHaddChuu extends Handler {
    @Keep
    public SSHaddChuu() {

    }
    @Keep
    @Override
    public void handleMessage(Message message) {
        int r0 = message.what;
        SSJiazaiKu.DongzzLiss(r0);
    }
}