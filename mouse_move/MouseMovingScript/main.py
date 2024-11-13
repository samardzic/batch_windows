# ctypes -- included library with Python install.
from datetime import datetime
import ctypes
import pyautogui
import sys
import time

# Wait for 5 seconds so there is time to click the window
startupTimeSecs = 5
for i in range(startupTimeSecs, 0, -1):
    sys.stdout.write(str(i) + ' ')
    sys.stdout.flush()
    time.sleep(1)
print("Go\n")

timeout_hrs = 4
timeout_mins = timeout_hrs * 60
timeout_secs = timeout_mins * 60
timeout = time.time() + timeout_secs
timeStart = time.time()
timeStartDate = datetime.now()
print("--Running--")
print(timeout_hrs, "hrs")

wait_mins = 5
wait_secs = wait_mins * 60

# Move the mouse in a line and back
while time.time() < timeout:
    timeElapsed = time.time() - timeStart
    percent = (timeElapsed/timeout_secs) * 100

    timeEndDate = datetime.now()
    timeElapsedStr = str(timeEndDate - timeStartDate)
    timeElapsedStr = timeElapsedStr[0:4]

    sys.stdout.write("\r" + timeElapsedStr + " -- {:0.2f}% ".format(percent))
    sys.stdout.flush()

    pyautogui.click(button='middle', duration=0.5)
    pyautogui.click(button='middle', duration=0.5)
    time.sleep(wait_secs)

print(timeout_hrs, "Hrs Elapsed, ending")
ctypes.windll.user32.MessageBoxW(
    0, "2 Hrs Elapsed, ending...", "Python Terminal", 1)
