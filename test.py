from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep

#1. Khai báo browser bằng biến driver
driver = webdriver.Chrome('./chromedriver')

#2. Mở thử trang web FB
driver.get("https://www.facebook.com/")

    #2a. Điền user và pass
txtUser = driver.find_element_by_id("email")
txtUser.send_keys("lethuchi9x@gmail.com")

txtPass = driver.find_element_by_id("pass")
txtPass.send_keys("kickTKD4q")
    #2a. submit form
txtPass.send_keys(Keys.ENTER)

#3. Dừng chương trình sau 8s
sleep(5)

#4. Đóng trình duyệt
driver.close()