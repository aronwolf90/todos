package com.aronwolf.todos

import android.app.Application
import dev.hotwire.core.bridge.BridgeComponentFactory
import dev.hotwire.core.config.Hotwire
import dev.hotwire.core.turbo.config.PathConfiguration
import dev.hotwire.navigation.config.defaultFragmentDestination
import dev.hotwire.navigation.config.registerBridgeComponents
import dev.hotwire.navigation.config.registerFragmentDestinations
import dev.hotwire.navigation.fragments.HotwireWebBottomSheetFragment

class TodoApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        Hotwire.loadPathConfiguration(
            context = this,
            location = PathConfiguration.Location(
                assetFilePath = "json/configuration.json"
            )
        )

        Hotwire.defaultFragmentDestination = WebFragment::class

        Hotwire.registerFragmentDestinations(
            WebFragment::class,
            HotwireWebBottomSheetFragment::class
        )

        Hotwire.registerBridgeComponents(
            BridgeComponentFactory("overflow-menu", ::OverflowMenuComponent)
        )

        Hotwire.config.debugLoggingEnabled = true
        Hotwire.config.webViewDebuggingEnabled = true
    }
}
