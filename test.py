import csv
import glob
import gzip
import json
import os
import re

SNAPSHOT_DIR = '/Volumes/WDC4/openalex-snapshot'
CSV_DIR = '/Volumes/WDC4/openalex-snapshot/csv-files/affiliations'

if not os.path.exists(CSV_DIR):
    os.mkdir(CSV_DIR)

FILES_PER_ENTITY = int(os.environ.get('OPENALEX_DEMO_FILES_PER_ENTITY', '0'))

csv_files = {
    'works': {
        'affiliations': {
            'name': os.path.join(CSV_DIR, 'works_au_affs.csv.gz'),
            'columns': [
                'work_id', 'author_position', 'author_id','raw_author_name',
                'is_corresponding','affiliation_id','raw_affiliation_string',
                'institution_ids'
            ]
        },
    },
}


def flatten_works():
    file_spec = csv_files['works']

    with gzip.open(file_spec['affiliations']['name'], 'wt',
                   encoding='utf-8') as affiliations_csv:
        affiliations_writer = init_dict_writer(affiliations_csv, file_spec['affiliations'])

        files_done = 0
        break_out = False
        for jsonl_file_name in glob.glob(
                os.path.join(SNAPSHOT_DIR, 'data', 'works', '*', '*.gz')):
            print(jsonl_file_name)
            with gzip.open(jsonl_file_name, 'r') as works_jsonl:
                for work_json in works_jsonl:
                    if not work_json.strip():
                        continue

                    work = json.loads(work_json)

                    if not (work_id := work.get('id')):
                        continue
                    # print(work_id)
                    if work_id == "https://openalex.org/W1800773466":
                        break_out = True
                        break
            if break_out is True:
                break


def init_dict_writer(csv_file, file_spec, **kwargs):
    writer = csv.DictWriter(
        csv_file, fieldnames=file_spec['columns'], **kwargs
    )
    writer.writeheader()
    return writer


if __name__ == '__main__':
    flatten_works()
