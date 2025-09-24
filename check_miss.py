import os
import json

path = "/Volumes/WDC/Raw_Data/openalex-snapshot/data/works"
files = os.listdir(path)

for file in files:
    print(file)
    if os.path.isdir(path + "/" + file):
        path1 = path + "/" + file
        files1 = os.listdir(path1)
        for file1 in files1:
            print(path1 + "/" + file1)
            with open(path1 + "/" + file1, "r") as f:
                for line in f.readlines():
                    if line != "\n" and line.startswith('{"id"'):
                        data = json.loads(line.replace("\n", ""))
                        # print(data)
                        paperid = data["id"].replace("https://openalex.org/", "")
                        if paperid == "W1976134055":
                            print(data)
