package com.aronwolf.todos

import android.content.Intent
import android.util.Log
import androidx.test.core.app.ActivityScenario
import androidx.test.espresso.Espresso.onView
import androidx.test.espresso.action.ViewActions.click
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.device.DeviceInteraction.Companion.setScreenOrientation
import androidx.test.espresso.device.EspressoDevice.Companion.onDevice
import androidx.test.platform.app.InstrumentationRegistry
import androidx.test.ext.junit.runners.AndroidJUnit4
import androidx.test.espresso.device.action.ScreenOrientation
import androidx.test.espresso.device.rules.ScreenOrientationRule
import androidx.test.espresso.matcher.ViewMatchers.isDisplayed
import androidx.test.espresso.matcher.ViewMatchers.withId
import androidx.test.espresso.matcher.ViewMatchers.withText
import androidx.test.espresso.web.sugar.Web.onWebView
import androidx.test.espresso.web.webdriver.DriverAtoms
import androidx.test.espresso.web.webdriver.DriverAtoms.findElement
import androidx.test.espresso.web.webdriver.Locator
import androidx.test.ext.junit.rules.ActivityScenarioRule

import org.junit.Test
import org.junit.runner.RunWith

import org.junit.Assert.*
import org.junit.Rule

/**
 * Instrumented test, which will execute on an Android device.
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
@RunWith(AndroidJUnit4::class)
class ExampleInstrumentedTest {
    @get:Rule
    val screenOrientationRule: ScreenOrientationRule = ScreenOrientationRule(ScreenOrientation.PORTRAIT)

    @get:Rule
    val activityRule = ActivityScenarioRule(MainActivity::class.java)

    @Test
    fun signIn() {
        Log.w("TEST", "Started")
        Thread.sleep(30000)
        onView(withText("Sign in")).check(matches(isDisplayed()))

        onWebView()
            .withElement(findElement(Locator.ID, "email_address"))
            .perform(DriverAtoms.webKeys("one@example.com"))

        onWebView()
            .withElement(findElement(Locator.ID, "password"))
            .perform(DriverAtoms.webKeys("password"))

        onWebView()
            .withElement(findElement(Locator.ID, "sign-in"))
            .perform(DriverAtoms.webClick())

        Thread.sleep(1000)
        onView(withText("Lists")).check(matches(isDisplayed()))

        onView(withId(R.id.overflow))
            .perform(click())
        Thread.sleep(1000)

        onWebView()
            .withElement(findElement(Locator.ID, "sign-out"))
            .perform(DriverAtoms.webClick())

        Thread.sleep(1000)
        onView(withText("Sign in")).check(matches(isDisplayed()))
    }
}