import os, sys
from dotenv import load_dotenv
from selenium import webdriver as wd

# using environment variables to not leak sensitive data
load_dotenv()

username = os.getenv("USERNAME")
password = os.getenv("PASSWORD")

# sys.argv[1] is the 2nd argument passed while running the python3 command
name = str(sys.argv[1]) 

# logic to set visibility to repository
if str(sys.argv[2]) == "--private":
    private = True
else:
    private = False

# logic to check if 2FA is used or not (pls use 2FA if u care about ur github account)
tfa = False
if str(sys.argv[3]) == "--tfa":
    tfa = True
else:
    tfa = False

# load the web driver
# also change the log path to nowhere
browser = wd.Firefox(log_path=os.path.devnull)

def mkrepo():
    
    # lets go
    browser.get('https://github.com/login')
    
    # github login
    browser.find_elements_by_xpath('//*[@id="login_field"]')[0].send_keys(username)
    browser.find_elements_by_xpath('//*[@id="password"]')[0].send_keys(password)
    browser.find_elements_by_xpath('/html/body/div[3]/main/div/div[4]/form/div/input[12]')[0].click()

    # if tfa is enabled, you will be asked for OTP in the terminal
    if tfa == True:
        otp = input("Enter OTP: ")
        browser.find_element_by_xpath('//*[@id="otp"]').send_keys(otp)
        browser.find_element_by_xpath('/html/body/div[3]/main/div/div[5]/div[2]/form/button').click()

    # create new repository
    browser.get('https://github.com/new')

    # name if repo (same as project name)
    browser.find_element_by_xpath('//*[@id="repository_name"]').send_keys(name)
    
    # logic to change public to private (it is a radio button)
    if private == True:
        browser.find_element_by_xpath('//*[@id="repository_visibility_private"]').click()

    # .click() doesnt work for the final button, use .submit()
    browser.find_element_by_xpath('/html/body/div[6]/main/div/form/div[4]/button').submit()

# call the make repo function
if __name__ == "__main__":
    mkrepo()
