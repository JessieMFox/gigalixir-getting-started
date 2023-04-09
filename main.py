import os
import threading
import time
import subprocess

subprocess.check_call(['pip', 'install', 'schedule'])

import schedule


def job():
  os.system("curl \
    -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
    -i httpstodo")


schedule.every(7).minutes.do(job)


class ScheduleThread(threading.Thread):

  def __init__(self):
    threading.Thread.__init__(self)
    self.daemon = True

  def run(self):
    while True:
      schedule.run_pending()
      time.sleep(1)


thread = ScheduleThread()
thread.start()

os.system("chmod +x ./run.sh; ./run.sh")
