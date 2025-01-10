import csv
import glob
import gzip
import json
import os

SNAPSHOT_DIR = '/Volumes/WDC4/openalex-snapshot'
CSV_DIR = '/Volumes/WDC4/openalex-snapshot/csv-files/others'

if not os.path.exists(CSV_DIR):
    os.mkdir(CSV_DIR)

FILES_PER_ENTITY = int(os.environ.get('OPENALEX_DEMO_FILES_PER_ENTITY', '0'))

csv_files = {
    'works': {
        'title': {
            'name': os.path.join(CSV_DIR, 'works_title.csv.gz'),
            'columns': [
                'work_id', 'title'
            ]
        },
        'grants': {
            'name': os.path.join(CSV_DIR, 'works_grants.csv.gz'),
            'columns': [
                'work_id', 'funder', 'funder_display_name', 'award_id'
            ]
        },
        'keywords': {
            'name': os.path.join(CSV_DIR, 'works_keywords.csv.gz'),
            'columns': [
                'work_id', 'kw_id', 'keyword', 'score'
            ]
        },
    },
}
json_file = "works_abstracts.json"


def flatten_others():
    file_spec = csv_files['works']

    # with gzip.open(file_spec['title']['name'], 'wt',
    #                encoding='utf-8') as title_csv, \
    with gzip.open(file_spec['grants']['name'], 'wt',
                      encoding='utf-8') as grants_csv, \
            gzip.open(file_spec['keywords']['name'], 'wt',
                      encoding='utf-8') as keywords_csv:

        # title_writer = csv.DictWriter(title_csv, fieldnames=file_spec['title']['columns'])
        # title_writer.writeheader()

        grants_writer = csv.DictWriter(grants_csv, fieldnames=file_spec['grants']['columns'])
        grants_writer.writeheader()

        keywords_writer = csv.DictWriter(keywords_csv, fieldnames=file_spec['keywords']['columns'])
        keywords_writer.writeheader()

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
                    # title
                    # if title := work.get('title'):
                    #     title_writer.writerow({
                    #         'work_id': work_id,
                    #         'title': title
                    #     })
                    # grants
                    if grants := work.get('grants'):
                        for grant in grants:
                            grants_writer.writerow({
                                'work_id': work_id,
                                'funder': grant.get('funder'),
                                'funder_display_name': grant.get('funder_display_name'),
                                'award_id': grant.get('award_id')
                            })
                    # keywords
                    if keywords := work.get('keywords'):
                        for keyword in keywords:
                            keywords_writer.writerow({
                                'work_id': work_id,
                                'kw_id': keyword.get('id'),
                                'keyword': keyword.get('display_name'),
                                'score': keyword.get('score')
                            })
                    # abstract
                    # if abs := work.get('abstract_inverted_index'):
                    #     abstract = {'work_id': work_id}
                    #     abstract.update({"Abstract": abs})
                    #     json_object = json.dumps(abstract, indent=4)
                    #     with open(os.path.join(CSV_DIR, json_file), "a") as outfile:
                    #         json.dump(json_object, outfile)
                    #         outfile.write('\n')
            files_done += 1
            if FILES_PER_ENTITY and files_done >= FILES_PER_ENTITY:
                break


if __name__ == '__main__':
    flatten_others()