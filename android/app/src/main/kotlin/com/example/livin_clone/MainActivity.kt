package com.example.livin_clone

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import android.view.WindowManager.LayoutParams;

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine ) {
        // Add this line to register your plugins
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        
        // Add FLAG_SECURE to prevent screenshots and screen recordings
        //getWindow().setFlags(LayoutParams.FLAG_SECURE, LayoutParams.FLAG_SECURE)
    }

    override fun onPause(){
        super.onPause();
    }

     override fun onResume(){
        super.onResume();
    }
}