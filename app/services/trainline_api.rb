require "httparty"
require 'selenium-webdriver'

class TrainlineApi
  def initialize(departure, arrival)
    @departure = departure
    @arrival = arrival
  end

  def call
    options = Selenium::WebDriver::Options.chrome(args: ['--headless=new'])
    driver = Selenium::WebDriver.for :chrome, options: options
    begin
      driver.navigate.to "https://www.thetrainline.com"
      sleep(2)

      # initial_url = driver.current_url

      departure_field = driver.find_element(id: 'jsf-origin-input')
      departure_field.send_keys(@departure)
      arrival_field = driver.find_element(id: 'jsf-destination-input')
      arrival_field.send_keys(@arrival)
      # arrival_field.attribute("value")
      # Locate and click on the date field
      # date_field = driver.find_element(id: 'jsf-outbound-time-input-toggle')
      # driver.action.click(date_field)
      sleep(1)
      # Select a date (assuming the date picker is open) : This will click on today’s date; you might need to adjust the selector for a specific date
      # date_picker_today = driver.find_element(css: 'td[data-id="2024-09-20"]')
      # date_picker_today.click

      # date_next_month = driver.find_element(css: '[data-testid="calendar-navigate-to-next-month"]')
      # driver.action.click(date_next_month)

      # date_next_month = driver.find_element(css: '.style-module__root__Gv_h8.style-module__large__mXyOn.style-module__contained__QrPWk.Calendar-module__calendarButton__yD2T9')
      # date_departure_day = driver.find_element(css: '[data-testid="jsf-calendar-date-button-31"]')
      # driver.action.click(date_departure_day)

      # date_arrival_field = driver.find_element(id: 'jsf-inbound-time-input-toggle')
      # date_arrival_field.click
      # sleep(1)
      # date_next_month = driver.find_element(id: 'calendar-navigate-to-next-month')
      # date_next_month.click
      # date_departure_day = driver.find_element(id: 'jsf-calendar-date-button-20')
      # date_departure_day.click

      # décocher le "rechercher un logement"
      skip_booking = driver.find_element(id: 'bookingPromo')
      driver.action.click(skip_booking)

      submit = driver.find_element(css: '[data-testid="jsf-submit"]')
      submit.submit()
      sleep(2)
      # wait = Selenium::WebDriver::Wait.new(timeout: 10)
      # wait.until { driver.current_url != initial_url }
      result_url = driver.current_url
      puts "Result page URL: #{result_url}"

      results = driver.find_elements(css: '[data-test="eu-journey-row-0-wrapper"]')
      p results
      debugger
      results.each do |result|
        puts result.text
        p result
        debugger
      end
    rescue StandardError => e
      puts "An error occurred: #{e.message}"
    ensure
      # Close the browser window
      driver.quit
    end
  end
end

# # base.include HTTParty
# # base.base_uri "https://www.thetrainline.com"
# # base.headers(
# #   "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/119.0",
# #   Accept:  "application/json",
# #   "Accept-language": DEFAULT_LOCALE,
# #   "Content-Type": "application/json",
# #   Host: "www.thetrainline.com",
# #   "Accept-Encoding": "deflate, gzip",
# #   "x-version": "4.34.27239",
# # )

# headers = {
#   "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/119.0",
#   "Accept" => "application/json",
#   "Accept-language" => "en-US",
#   "Content-Type" => "application/json",
#   "Host" => "www.thetrainline.com"
# }

# query = {
#   departure: @departure,
#   destination: @arrival,
#   depart_at: Date.today
# }
# response = HTTParty.get(
#   "https://www.thetrainline.com/api/journey-search/",
#   query: query,
#   headers: headers,
#   body:
#     {
#       passengers: [
#         {
#           id: "76f5ce86-6318-4d10-bb72-6779600357c9",
#           dateOfBirth: DateTime.now.prev_year(18).strftime("%F"),
#           cardIds: [],
#         },
#       ],
#       isEurope: true,
#       cards: [],
#       transitDefinitions: [
#         {
#           direction: "outward",
#           origin: @departure,
#           destination: @destionation,
#           journeyDate: {
#             type: "departAfter",
#             time: Date.today.strftime("%FT%T"),
#           },
#         },
#       ],
#       type: "single",
#       maximumJourneys: 10,
#       includeRealtime: true,
#       transportModes: [
#         "mixed",
#       ],
#       directSearch: false,
#       composition: %w[
#         through
#         interchangeSplit
#       ],
#       requestedCurrencyCode: "EUR"
#     }
# )
