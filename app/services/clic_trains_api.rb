# require 'selenium-webdriver'

class ClicTrainsApi
  def initialize(url)
    @url = url
  end

  def call
    # options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--incognito')
    # options.add_argument('--disable-gpu')
    # options.add_argument('--no-sandbox')
    # options.add_argument('--disable-dev-shm-usage')
    # options.add_argument('--disable-popup-blocking')
    # options.add_argument('--disable-infobars')
    # options.add_argument('--disable-extensions')
    # options.add_argument('--disable-notifications')
    # options.add_argument('--disable-blink-features=AutomationControlled')
    # driver = Selenium::WebDriver.for :chrome, options: options
    driver = Selenium::WebDriver.for :chrome
    begin
      driver.navigate.to @url
      sleep(2)

      submit_form = driver.find_element(class: '.progress-button ember-view search__button')
      driver.action.click(submit_form)
      sleep(2)
      puts "Current URL: #{driver.current_url}"

      # submit.submit()
      # # wait = Selenium::WebDriver::Wait.new(timeout: 10)
      # # wait.until { driver.current_url != initial_url }
      # result_url = driver.current_url
      # puts "Result page URL: #{result_url}"

    rescue StandardError => e
      puts "An error occurred: #{e.message}"
    # ensure
    #   # driver.quit
    # end
    end
  end
end
