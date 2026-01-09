-- 设置日期格式为（DMY 日-月-年）
SET datestyle = 'ISO, DMY';

-- 数据文件根目录（如需调整路径，仅需修改此处）
\setenv CWTS_OPENALEX_DATA_DIR '/data/home/share/openalex_cwts_2025aug'

-- A开头的表
\copy apc_provenance FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/apc_provenance.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy author FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/author.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy author_alternative_name FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/author_alternative_name.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy author_institution FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/author_institution.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy author_institution_year FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/author_institution_year.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy author_last_known_institution FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/author_last_known_institution.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy author_position FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/author_position.csv.gz"' WITH (FORMAT csv, HEADER true);

-- C开头的表
\copy citation FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/citation.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy city FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/city.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy tmp_concept FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/concept.csv.gz"' WITH (FORMAT csv, HEADER true);
INSERT INTO concept (CONCEPT_ID, concept, description, level, openalex_id, mag_id, wikidata_id, wikipedia_url, image_url, thumbnail_url, updated_date, created_date)
SELECT CONCEPT_ID, concept, description, level, openalex_id, mag_id, wikidata_id, wikipedia_url, image_url, thumbnail_url, to_timestamp(updated_date,'MM/DD/YYYY HH12:MI:SS AM'), to_timestamp(created_date,'MM/DD/YYYY HH12:MI:SS AM') FROM tmp_concept;
DROP TABLE tmp_concept;
\copy concept_ancestor FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/concept_ancestor.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy concept_international_description FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/concept_international_description.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy concept_international_name FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/concept_international_name.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy concept_related FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/concept_related.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy concept_umls_aui FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/concept_umls_aui.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy concept_umls_cui FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/concept_umls_cui.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy country FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/country.csv.gz"' WITH (FORMAT csv, HEADER true);

-- D开头的表
\copy data_source FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/data_source.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy doi_registration_agency FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/doi_registration_agency.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy tmp_domain FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/domain.csv.gz"' WITH (FORMAT csv, HEADER true);

INSERT INTO domain (domain_id, domain, description, openalex_id, wikidata_id, wikipedia_url, updated_date, created_date)
SELECT domain_id, domain, description, openalex_id, wikidata_id, wikipedia_url,
         to_timestamp(updated_date,'MM/DD/YYYY HH12:MI:SS AM'),
         to_timestamp(created_date,'MM/DD/YYYY HH12:MI:SS AM') FROM tmp_domain;
DROP TABLE tmp_domain;
\copy domain_alternative_name FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/domain_alternative_name.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy domain_field FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/domain_field.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy domain_sibling FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/domain_sibling.csv.gz"' WITH (FORMAT csv, HEADER true);

-- F开头的表
\copy tmp_field FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/field.csv.gz"' WITH (FORMAT csv, HEADER true);
INSERT INTO field (field_id, field, description, openalex_id, wikidata_id, wikipedia_url, domain_id, updated_date, created_date)
SELECT field_id, field, description, openalex_id, wikidata_id, wikipedia_url,
         domain_id,
         to_timestamp(updated_date,'MM/DD/YYYY HH12:MI:SS AM'),
         to_timestamp(created_date,'MM/DD/YYYY HH12:MI:SS AM') FROM tmp_field;
DROP TABLE tmp_field;
\copy field_alternative_name FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/field_alternative_name.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy field_sibling FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/field_sibling.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy field_subfield FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/field_subfield.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy fulltext_origin FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/fulltext_origin.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy funder FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/funder.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy funder_alternative_name FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/funder_alternative_name.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy funder_publisher FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/funder_publisher.csv.gz"' WITH (FORMAT csv, HEADER true);

-- I开头的表
\copy institution FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/institution.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy institution_acronym FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/institution_acronym.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy institution_alternative_name FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/institution_alternative_name.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy institution_associated FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/institution_associated.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy institution_funder FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/institution_funder.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy institution_international_name FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/institution_international_name.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy institution_lineage FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/institution_lineage.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy institution_publisher FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/institution_publisher.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy institution_relationship_type FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/institution_relationship_type.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy institution_repository FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/institution_repository.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy institution_type FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/institution_type.csv.gz"' WITH (FORMAT csv, HEADER true);

-- K开头的表
\copy keyword FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/keyword.csv.gz"' WITH (FORMAT csv, HEADER true);

-- -- L开头的表
\copy license FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/license.csv.gz"' WITH (FORMAT csv, HEADER true);

-- M开头的表
\copy mesh_descriptor FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/mesh_descriptor.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy mesh_qualifier FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/mesh_qualifier.csv.gz"' WITH (FORMAT csv, HEADER true);

-- O开头的表
\copy oa_status FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/oa_status.csv.gz"' WITH (FORMAT csv, HEADER true);

-- P开头的表
\copy publisher FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/publisher.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy publisher_alternative_name FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/publisher_alternative_name.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy publisher_country FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/publisher_country.csv.gz"' WITH (FORMAT csv, HEADER true);

-- R开头的表
\copy raw_affiliation_string FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/raw_affiliation_string.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy raw_author_name FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/raw_author_name.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy region FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/region.csv.gz"' WITH (FORMAT csv, HEADER true);

-- S开头的表
\copy tmp_source FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/source.csv.gz"' WITH (FORMAT csv, HEADER true);
CREATE TABLE source (
    source_id BIGINT,
    source VARCHAR(800),
    abbreviation VARCHAR(800),
    source_type_id SMALLINT,
    country_iso_alpha2_code CHAR(2),
    host_organization_publisher_id BIGINT,
    host_organization_institution_id BIGINT,
    homepage_url VARCHAR(600),
    issn_l CHAR(9),
    openalex_id VARCHAR(12),
    mag_id BIGINT,
    wikidata_id VARCHAR(10),
    fatcat_id CHAR(26),
    is_in_doaj BOOLEAN,
    is_oa BOOLEAN,
    apc_price_usd INT,
    updated_date TIMESTAMP,
    created_date TIMESTAMP
);
INSERT INTO source (source_id, source, abbreviation, source_type_id, country_iso_alpha2_code, host_organization_publisher_id, host_organization_institution_id, homepage_url, issn_l, openalex_id, mag_id, wikidata_id, fatcat_id, is_in_doaj, is_oa, apc_price_usd, updated_date, created_date)
SELECT source_id, source, abbreviation, source_type_id, country_iso_alpha2_code, host_organization_publisher_id, host_organization_institution_id, homepage_url, issn_l, openalex_id, mag_id, wikidata_id, fatcat_id, is_in_doaj, is_oa, apc_price_usd, to_timestamp(updated_date,'MM/DD/YYYY HH12:MI:SS AM'), to_timestamp(created_date,'MM/DD/YYYY HH12:MI:SS AM') FROM tmp_source;
DROP TABLE tmp_source;
\copy source_alternative_title FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/source_alternative_title.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy source_apc_price FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/source_apc_price.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy source_issn FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/source_issn.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy source_society FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/source_society.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy source_type FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/source_type.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy subfield FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/subfield.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy subfield_alternative_name FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/subfield_alternative_name.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy subfield_sibling FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/subfield_sibling.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy subfield_topic FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/subfield_topic.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy sustainable_development_goal FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/sustainable_development_goal.csv.gz"' WITH (FORMAT csv, HEADER true);

-- T开头的表
\copy topic FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/topic.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy topic_keyword FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/topic_keyword.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy topic_sibling FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/topic_sibling.csv.gz"' WITH (FORMAT csv, HEADER true);

-- V开头的表
\copy version FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/version.csv.gz"' WITH (FORMAT csv, HEADER true);

-- W开头的表
\copy tmp_work FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work.csv.gz"' WITH (FORMAT csv, HEADER true);
INSERT INTO work (work_id, work_type_id, crossref_work_type_id, source_id, pub_date, pub_year, volume, issue, page_first, page_last, doi_registration_agency_id, doi, openalex_id, mag_id, pmid, pmcid, arxiv_id, language_iso2_code, is_paratext, is_retracted, is_oa, any_repository_has_fulltext, oa_status_id, oa_url, apc_list_currency, apc_list_price, apc_list_price_usd, apc_list_apc_provenance_id, apc_paid_currency, apc_paid_price, apc_paid_price_usd, apc_paid_apc_provenance_id, fulltext_origin_id, n_refs, n_cits, updated_date, created_date)
SELECT work_id, work_type_id, crossref_work_type_id, source_id, to_timestamp(pub_date,'MM/DD/YYYY HH12:MI:SS AM'), pub_year, volume, issue, page_first, page_last, doi_registration_agency_id, doi, openalex_id, mag_id, pmid, pmcid, arxiv_id, language_iso2_code, is_paratext, is_retracted, is_oa, any_repository_has_fulltext, oa_status_id, oa_url, apc_list_currency, apc_list_price, apc_list_price_usd, apc_list_apc_provenance_id, apc_paid_currency, apc_paid_price, apc_paid_price_usd, apc_paid_apc_provenance_id, fulltext_origin_id, n_refs, n_cits, to_timestamp(updated_date,'MM/DD/YYYY HH12:MI:SS AM'), to_timestamp(created_date,'MM/DD/YYYY HH12:MI:SS AM') FROM tmp_work;
drop table tmp_work;
\copy work_abstract FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_abstract.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_affiliation FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_affiliation.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_affiliation_institution FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_affiliation_institution.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_author FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_author.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_author_affiliation FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_author_affiliation.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_author_country FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_author_country.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_concept FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_concept.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_data_source FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_data_source.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_detail FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_detail.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_grant FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_grant.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_keyword FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_keyword.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_location FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_location.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_mesh FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_mesh.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_reference FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_reference.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_related FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_related.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_sustainable_development_goal FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_sustainable_development_goal.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_title FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_title.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_topic FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_topic.csv.gz"' WITH (FORMAT csv, HEADER true);
\copy work_type FROM PROGRAM 'gunzip -c "$CWTS_OPENALEX_DATA_DIR/work_type.csv.gz"' WITH (FORMAT csv, HEADER true);


