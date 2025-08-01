require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium,
    using: ENV["DEBUG"] ? :chrome : :headless_chrome,
    screen_size: [ 1400, 1400 ] do |options|
      options.add_argument("guest")
    end

  teardown do
    js_logs = page.driver.browser.logs.get(:browser).reject do |log_message|
      log_message.message.include?("the server responded with a status of 422")
    end

    assert js_logs.map(&:level).none?("SEVERE"), js_logs.map(&:message).join("\n")
  end

  def wait_until(time: Capybara.default_max_wait_time)
    Timeout.timeout(time) do
      until value = yield
        sleep(0.1)
      end
      value
    end
  end

  def slow_connection
    params = {
      cmd: "Network.emulateNetworkConditions",
      params: {
        offline:            false,
        latency:            2000,
        downloadThroughput: 0,
        uploadThroughput:   0
      }
    }
    page.driver.browser.send(:bridge).send_command(params)

    yield

    params = {
      cmd: "Network.emulateNetworkConditions",
      params: {
        offline:            false,
        latency:            0,
        downloadThroughput: 0,
        uploadThroughput:   0
      }
    }

    page.driver.browser.send(:bridge).send_command(params)
  end

  def sign_in(user)
    visit lists_path
    fill_in "email_address", with: user.email_address
    fill_in "password", with: "password"
    click_on "Sign in"
    assert_text "Lists"
  end
end
