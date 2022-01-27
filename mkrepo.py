import os, sys
from dotenv import load_dotenv
from selenium import webdriver as wb

load_dotenv()

username = os.getenv("USERNAME")
password = os.getenv("PASSWORD")
name = str(sys.argv[1])

if str(sys.argv[2]) == "--private":
    private = True
else:
    private = False

tfa = False
if str(sys.argv[3]) == "--tfa":
    tfa = True
else:
    tfa = False

browser = wb.Firefox(log_path='/home/syn4ck/tmp/geckodriver.log')
browser.get('https://github.com/login')

def mkrepo():
    browser.find_elements_by_xpath('//*[@id="login_field"]')[0].send_keys(username)
    browser.find_elements_by_xpath('//*[@id="password"]')[0].send_keys(password)
    browser.find_elements_by_xpath('/html/body/div[3]/main/div/div[4]/form/div/input[12]')[0].click()

    if tfa == True:
        otp = input("Enter OTP: ")
        browser.find_element_by_xpath('//*[@id="otp"]').send_keys(otp)
        browser.find_element_by_xpath('/html/body/div[3]/main/div/div[5]/div[2]/form/button').click()

    browser.get('https://github.com/new')

    browser.find_element_by_xpath('//*[@id="repository_name"]').send_keys(name)
    
    if private == True:
        browser.find_element_by_xpath('//*[@id="repository_visibility_private"]').click()

    browser.find_element_by_xpath('/html/body/div[6]/main/div/form/div[4]/button').submit()

if __name__ == "__main__":
    mkrepo()
