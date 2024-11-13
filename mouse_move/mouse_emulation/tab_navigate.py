import time

import pyautogui as pag

# pag.press("tab")
pag.hotkey("alt", "tab", interval=1)
time.sleep(2)

pag.getInfo()
# pag.locateOnWindow(title: "Teams")


# getWindowsWithTitle("music")[0].maximize()