from selenium import webdriver
from time import sleep
#1. Khai báo browser bằng biến driver
driver = webdriver.Chrome('./chromedriver')
#2. Mở thử trang web nhac.vn
driver.get("https://www.nhaccuatui.com")
#3. Lấy link BXH nhạc trẻ
bxh_link = driver.get("https://www.nhaccuatui.com/top100/top-100-nhac-tre.m3liaiy6vVsF.html")
sleep(3)
#4. Lấy tất cả các bài hát và ghi ra màn hình
    #--> Lấy tất cả tên bài hát
list_songs = driver.find_elements_by_class_name("box_info_field")
    #--> Lặp tất cả bài hát và hiển thị ra màn hình
for songs in list_songs:
    name = songs.find_elements_by_class_name("name_song")
    singer = songs.find_elements_by_class_name("list_name_singer")
    print("*",name[0].text,": ",singer[0].text)
sleep(3)
#5. Đóng trình duyệt
driver.close()
