package com.payash.richearn

import android.content.Intent
import com.unity3d.player.UnityPlayerGameActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "unity_launcher"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->

                if (call.method == "openBlazion") {

                    val intent = Intent(this, UnityPlayerGameActivity::class.java)
                    startActivity(intent)

                    result.success(true)

                } else {
                    result.notImplemented()
                }
            }
    }
}