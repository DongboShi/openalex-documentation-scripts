import csv
import glob
import gzip
import json
import os

SNAPSHOT_DIR = 'openalex-snapshot'
OPT_DIR = 'tidy-files'

if not os.path.exists(OPT_DIR):
    os.mkdir(OPT_DIR)

FILES_PER_ENTITY = int(os.environ.get('OPENALEX_DEMO_FILES_PER_ENTITY', '0'))

def flatten_work_authors():


if __name__ == '__main__':
    flatten_work_authors()