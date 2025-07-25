package com.aronwolf.todos

import dev.hotwire.core.turbo.webview.HotwireWebView
import dev.hotwire.navigation.destinations.HotwireDestinationDeepLink
import dev.hotwire.navigation.fragments.HotwireWebBottomSheetFragment

@HotwireDestinationDeepLink(uri = "hotwire://fragment/web/modal/sheet")
class WebModalSheet : HotwireWebBottomSheetFragment() {
    override fun onWebViewAttached(webView: HotwireWebView) {
        webView.requestFocus()
    }
}