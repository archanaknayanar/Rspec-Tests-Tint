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
        @driver.find_element(:id, 'credential_email').send_keys 'enter email here'
        @driver.find_element(:id, 'credential_password').send_keys 'wenter password'
        @driver.find_element(:xpath, '//*[@id="new_credential"]/div[4]/input').click
        puts @driver.find_element(:css, 'h1').text
        @driver.find_element(:id, 'settings_dropdown_toggle').click
        sleep 10
        @driver.find_element(:link_text, 'Sign Out').click
        sleep 5
        puts @driver.find_element(:class, 'alert').text
        end

    after(:all) do
        @driver.quit()
    end
end
