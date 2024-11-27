require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]

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
      cmd:    'Network.emulateNetworkConditions',
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
      cmd:    'Network.emulateNetworkConditions',
      params: {
        offline:            false,
        latency:            0,
        downloadThroughput: 0,
        uploadThroughput:   0
      }
    }

    page.driver.browser.send(:bridge).send_command(params)
  end
end
