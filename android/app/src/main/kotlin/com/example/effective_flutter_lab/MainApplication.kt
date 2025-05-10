package com.example.effective_flutter_lab
import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
  override fun onCreate() {
    super.onCreate()
    MapKitFactory.setLocale("ru_RU") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("41c886da-48d7-45c1-b95e-9e85e881e555") // Your generated API key
  }
}