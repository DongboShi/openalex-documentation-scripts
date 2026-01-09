import csv
import glob
import gzip
import json
import os
import re

SNAPSHOT_DIR = "/data/home/share/openalex_250825/openalex-snapshot"
CSV_DIR = "/data/home/share/openalex_250825/csv-files/affiliations"

if not os.path.exists(CSV_DIR):
    os.mkdir(CSV_DIR)

FILES_PER_ENTITY = int(os.environ.get("OPENALEX_DEMO_FILES_PER_ENTITY", "0"))

csv_files = {
    "works": {
        "affiliations": {
            "name": os.path.join(CSV_DIR, "works_au_affs.csv"),
            "columns": [
                "work_id",
                "author_position",
                "author_id",
                "raw_author_name",
                "is_corresponding",
                "affiliation_seq",
                "raw_affiliation_string",
                "institution_ids",
                "countries",
            ],
        },
        "citation_normalized_percentile": {
            "name": os.path.join(CSV_DIR, "works_citation_normalized_percentile.csv"),
            "columns": [
                "work_id",
                "citation_normalized_percentile",
            ],
        },
        "counts_by_year": {
            "name": os.path.join(CSV_DIR, "works_counts_by_year.csv"),
            "columns": [
                "work_id",
                "year",
                "cited_by_count",
            ],
        },
    },
}


def flatten_works():
    file_spec = csv_files["works"]

    with (
        open(
            file_spec["affiliations"]["name"], "wt", encoding="utf-8"
        ) as affiliations_csv,
        open(
            file_spec["citation_normalized_percentile"]["name"],
            "wt",
            encoding="utf-8",
        ) as citation_normalized_percentile_writer_csv,
        open(
            file_spec["counts_by_year"]["name"], "wt", encoding="utf-8"
        ) as counts_by_year_csv,
    ):
        affiliations_writer = init_dict_writer(
            affiliations_csv, file_spec["affiliations"]
        )

        citation_normalized_percentile_writer = init_dict_writer(
            citation_normalized_percentile_writer_csv,
            file_spec["citation_normalized_percentile"],
        )

        counts_by_year_writer = init_dict_writer(
            counts_by_year_csv, file_spec["counts_by_year"]
        )

        files_done = 0
        for jsonl_file_name in glob.glob(
            os.path.join(SNAPSHOT_DIR, "data", "works", "*", "*.gz")
        ):
            print(jsonl_file_name)
            with gzip.open(jsonl_file_name, "r") as works_jsonl:
                for work_json in works_jsonl:
                    if not work_json.strip():
                        continue

                    work = json.loads(work_json)

                    if not (work_id := work.get("id")):
                        continue

                    # authorships
                    if authorships := work.get("authorships"):
                        for authorship in authorships:
                            if author_id := authorship.get("author", {}).get("id"):
                                affiliations = authorship.get("affiliations")
                                if affiliations is not None:
                                    affiliation_seq = 1
                                    for affiliation in affiliations:
                                        raw_affiliation_string = re.sub(
                                            ",+",
                                            ",",
                                            affiliation.get("raw_affiliation_string")
                                            .strip()
                                            .replace("\n", ",")
                                            .replace("\r", ","),
                                        )
                                        raw_author_name = affiliation.get(
                                            "raw_author_name"
                                        )
                                        if raw_author_name:
                                            raw_author_name = re.sub(
                                                ",+",
                                                ",",
                                                raw_author_name.strip()
                                                .replace("\n", ",")
                                                .replace("\r", ","),
                                            )
                                        countries = authorship.get("countries")
                                        institution_ids = affiliation.get(
                                            "institution_ids"
                                        )
                                        institution_ids = [
                                            i for i in institution_ids if i
                                        ]
                                        institution_ids = institution_ids or [None]
                                        if institution_ids is not None:
                                            for institution_id in institution_ids:
                                                affiliations_writer.writerow(
                                                    {
                                                        "work_id": work_id,
                                                        "author_position": authorship.get(
                                                            "author_position"
                                                        ),
                                                        "author_id": author_id,
                                                        "raw_author_name": raw_author_name,
                                                        "is_corresponding": authorship.get(
                                                            "is_corresponding"
                                                        ),
                                                        "affiliation_seq": affiliation_seq,
                                                        "raw_affiliation_string": raw_affiliation_string,
                                                        "institution_ids": institution_id,
                                                        "countries": countries,
                                                    }
                                                )
                                                affiliation_seq += 1
                                        else:
                                            affiliations_writer.writerow(
                                                {
                                                    "work_id": work_id,
                                                    "author_position": authorship.get(
                                                        "author_position"
                                                    ),
                                                    "author_id": author_id,
                                                    "raw_author_name": raw_author_name,
                                                    "is_corresponding": authorship.get(
                                                        "is_corresponding"
                                                    ),
                                                    "affiliation_seq": affiliation_seq,
                                                    "raw_affiliation_string": raw_affiliation_string,
                                                    "institution_ids": None,
                                                    "countries": countries,
                                                }
                                            )
                    # citations
                    if citation_normalized_percentile := work.get(
                        "citation_normalized_percentile"
                    ):
                        if (
                            citation_normalized_percentile_v
                            := citation_normalized_percentile.get("value")
                        ):
                            citation_normalized_percentile_writer.writerow(
                                {
                                    "work_id": work_id,
                                    "citation_normalized_percentile": citation_normalized_percentile_v,
                                }
                            )
                    if counts_by_years := work.get("counts_by_year"):
                        for count_by_year in counts_by_years:
                            if year := count_by_year.get("year"):
                                cited_by_count = count_by_year.get("cited_by_count")
                                counts_by_year_writer.writerow(
                                    {
                                        "work_id": work_id,
                                        "year": year,
                                        "cited_by_count": cited_by_count,
                                    }
                                )

            files_done += 1
            if FILES_PER_ENTITY and files_done >= FILES_PER_ENTITY:
                break


def init_dict_writer(csv_file, file_spec, **kwargs):
    writer = csv.DictWriter(csv_file, fieldnames=file_spec["columns"], **kwargs)
    writer.writeheader()
    return writer


if __name__ == "__main__":
    flatten_works()
