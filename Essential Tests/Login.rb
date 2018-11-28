require "rspec"
require "selenium-webdriver"

describe 'Logintest' do

    before(:all) do
        @driver = driver = Selenium::WebDriver.for :firefox

    end

    it "can test a login" do
        @driver.manage.window.maximize
        puts "Loading URL"
        @driver.navigate.to("https://staging.tintup.com")
    end
    it "enter credentials" do
        @driver.find_element(:id, 'login').click
        @driver.find_element(:id, 'credential_email').send_keys 'email@email.com'
        @driver.find_element(:id, 'credential_password').send_keys 'password'
        @driver.find_element(:xpath, '//*[@id="new_credential"]/div[4]/input').click
        puts @driver.find_element(:css, 'h1').text
        
    end

    after(:all) do
        @driver.quit()
    end
end