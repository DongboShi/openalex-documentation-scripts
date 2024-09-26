import csv
import glob
import gzip
import json
import os

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

                    # authorships
                    if authorships := work.get('authorships'):
                        for authorship in authorships:
                            if author_id := authorship.get('author', {}).get('id'):
                                affiliations = authorship.get('affiliations')
                                if affiliations is not None:
                                    affiliation_id = 1
                                    for affiliation in affiliations:
                                        institution_ids = affiliation.get('institution_ids')
                                        institution_ids = [i for i in institution_ids if i]
                                        institution_ids = institution_ids or [None]
                                        for institution_id in institution_ids:
                                            affiliations_writer.writerow({
                                                'work_id': work_id,
                                                'author_position': authorship.get('author_position'),
                                                'author_id': author_id,
                                                'raw_author_name': authorship.get('raw_author_name'),
                                                'is_corresponding': authorship.get('is_corresponding'),
                                                'affiliation_id':affiliation_id,
                                                'raw_affiliation_string': affiliation.get('raw_affiliation_string'),
                                                'institution_ids':institution_id
                                            })
                                        affiliation_id += 1
            files_done += 1
            if FILES_PER_ENTITY and files_done >= FILES_PER_ENTITY:
                break

def init_dict_writer(csv_file, file_spec, **kwargs):
    writer = csv.DictWriter(
        csv_file, fieldnames=file_spec['columns'], **kwargs
    )
    writer.writeheader()
    return writer


if __name__ == '__main__':
    flatten_works()
