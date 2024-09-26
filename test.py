import csv
import glob
import gzip
import json
import os

with open("part_000",'r') as f:
    x = f.readlines()[0]
    work = json.loads(x)


work_id = work.get('id')

# authorships
if authorships := work.get('authorships'):
    for authorship in authorships:
        if author_id := authorship.get('author', {}).get('id'):
            affiliations = authorship.get('affiliations')
            affiliations = affiliations or [None]
            affiliation_id = 1
            for affiliation in affiliations:
                institution_ids = affiliation.get('institution_ids')
                institution_ids = [i for i in institution_ids if i]
                institution_ids = institution_ids or [None]
                for institution_id in institution_ids:
                    result = {
                        'work_id': work_id,
                        'author_position': authorship.get('author_position'),
                        'author_id': author_id,
                        'raw_author_name': authorship.get('raw_author_name'),
                        'is_corresponding': authorship.get('is_corresponding'),
                        'affiliation_id': affiliation_id,
                        'raw_affiliation_string': affiliation.get('raw_affiliation_string'),
                        'institution_ids': institution_id
                    }
                    print(result)
