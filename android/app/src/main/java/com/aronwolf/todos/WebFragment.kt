package com.aronwolf.todos

import android.os.Bundle
import android.view.View
import dev.hotwire.navigation.fragments.HotwireWebFragment
import dev.hotwire.navigation.destinations.HotwireDestinationDeepLink

@HotwireDestinationDeepLink(uri = "hotwire://fragment/web")
class WebFragment : HotwireWebFragment() {
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        setupMenu()
    }

    private fun setupMenu() {
        toolbarForNavigation()?.inflateMenu(R.menu.web)
    }
}