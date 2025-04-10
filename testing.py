import psutil
import time

def get_cpu_usage():
    while True:
        cpu_usage = psutil.cpu_percent(interval=1)
        print(f"CPU Usage: {cpu_usage}%")
        time.sleep(1)

if __name__ == "__main__":
    get_cpu_usage()
