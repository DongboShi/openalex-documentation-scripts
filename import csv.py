import csv
import glob
import gzip
import json
import os
import re

SNAPSHOT_DIR = "/Volumes/WDC4/openalex_250825/openalex-snapshot"
CSV_DIR = "/Volumes/WDC4/openalex_250825/csv-files/affiliations"

if not os.path.exists(CSV_DIR):
    os.mkdir(CSV_DIR)

FILES_PER_ENTITY = int(os.environ.get("OPENALEX_DEMO_FILES_PER_ENTITY", "0"))

csv_files = {
    'sources': {
        'sources_type': {
            'name': os.path.join(CSV_DIR, 'sources_type.csv.gz'),
            'columns': [
                'id', 'type'
            ]
        },
    },
}

def flatten_sources():
    with gzip.open(csv_files['sources']['sources_type']['name'], 'wt',
                   encoding='utf-8') as sources_csv:

        sources_type_writer = csv.DictWriter(
            sources_csv, fieldnames=csv_files['sources']['sources_type']['columns'],
            extrasaction='ignore'
        )
        # sources_type_writer.writeheader()

        seen_source_ids = set()

        files_done = 0
        for jsonl_file_name in glob.glob(
                os.path.join(SNAPSHOT_DIR, 'data', 'sources', '*', '*.gz')):
            print(jsonl_file_name)
            with gzip.open(jsonl_file_name, 'r') as sources_jsonl:
                for source_json in sources_jsonl:
                    if not source_json.strip():
                        continue

                    source = json.loads(source_json)

                    if not (source_id := source.get(
                            'id')) or source_id in seen_source_ids:
                        continue

                    seen_source_ids.add(source_id)

                    if sources_type := source.get('ids'):
                        sources_type['source_id'] = source_id
                        sources_type['type'] = json.dumps(source_ids.get('type'))
                        sources_type_writer.writerow(sources_type)

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
    flatten_sources()