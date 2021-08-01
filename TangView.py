from selenium import webdriver
import time
 #trước hết ta cần đọc video list, ta dùng hàm open. Lưu ý: đặt file py cùng chung với file txt
videoFileName = "video.txt"
viewFileName = "ViewCount.txt"

videoFile = open(videoFileName)
listVideo = videoFile.readlines()

NUMBER_OF_TAB = 4
NUMBER_OF_VIDEO = len(listVideo)
LOOP_TIME = 3

videoIndex = 0
tabIndex = 0
tabCount = 1 # tạo 1 tab mới sao cho tabCout = NUMBER_OF_TAB
viewCount = 0 # thống kê số lượt view
# mở Chrome
browser = webdriver.Chrome('./chromedriver')

# mở URL (video đầu tiên ==> tabIndex=0)
browser.get(listVideo[videoIndex])        #Tạo 1 biến index để duyệt list

while True:
    videoIndex = (videoIndex + 1) % NUMBER_OF_VIDEO
    tabIndex = (tabIndex + 1) % NUMBER_OF_TAB
    if (tabCount < NUMBER_OF_TAB):
        tabCount = tabCount + 1 # tạo tab mới bằng url trong list video
        browser.execute_script("window.open('" + listVideo[videoIndex].strip() + "')")
    else:
        browser.switch_to.window(browser.window_handles[tabIndex]) # mở video mới trong tab cũ
        time.sleep(0.5)
        browser.get(listVideo[videoIndex])
    viewCount = viewCount + 1
    #ghi file
    saveFile = open(viewFileName,"w")
    saveFile.write(str(viewCount))
    saveFile.close()
    time.sleep(LOOP_TIME)