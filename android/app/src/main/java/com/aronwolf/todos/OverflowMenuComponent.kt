package com.aronwolf.todos

import android.util.Log
import androidx.appcompat.widget.Toolbar
import androidx.fragment.app.Fragment
import dev.hotwire.core.bridge.BridgeComponent
import dev.hotwire.core.bridge.BridgeDelegate
import dev.hotwire.core.bridge.Message
import dev.hotwire.navigation.destinations.HotwireDestination

/**
 * Bridge component to display a native 3-dot menu in the toolbar, which
 * will will notify the web when it has been tapped.
 */
class OverflowMenuComponent(
    name: String,
    private val delegate: BridgeDelegate<HotwireDestination>
) : BridgeComponent<HotwireDestination>(name, delegate) {

    private val fragment: Fragment
        get() = delegate.destination.fragment
    private val toolbar: Toolbar?
        get() = fragment.view?.findViewById(dev.hotwire.navigation.R.id.toolbar)

    override fun onReceive(message: Message) {
        when (message.event) {
            "connect" -> handleConnectEvent(message)
            else -> Log.w("OverflowMenuComponent", "Unknown event for message: $message")
        }
    }

    private fun handleConnectEvent(message: Message) {
        showOverflowMenuItem()
    }

    private fun showOverflowMenuItem() {
        val toolbar = toolbar ?: return

        toolbar.menu.findItem(R.id.overflow)?.apply {
            isVisible = true
        }

        toolbar.setOnMenuItemClickListener {
            when (it.itemId) {
                R.id.overflow -> {
                    performClick()
                    true
                }
                else -> false
            }
        }
    }

    private fun performClick() {
        replyTo("connect")
    }
}
