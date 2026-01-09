-- -- apc_provenance表
CREATE TABLE apc_provenance (
    apc_provenance_id SMALLINT,
    apc_provenance VARCHAR(20)
);

-- author表
CREATE TABLE author (
    author_id BIGINT,
    author TEXT,
    orcid CHAR(19),
    openalex_id VARCHAR(12),
    scopus_id BIGINT,
    wikipedia_url VARCHAR(100),
    updated_date TIMESTAMP,
    created_date TIMESTAMP
);

-- author_alternative_name表
CREATE TABLE author_alternative_name (
    author_id BIGINT,
    alternative_name_seq SMALLINT,
    alternative_name VARCHAR(255)
);

-- author_institution表
CREATE TABLE author_institution (
    author_id BIGINT,
    institution_seq SMALLINT,
    institution_id BIGINT
);

-- author_institution_year表
CREATE TABLE author_institution_year (
    author_id BIGINT,
    institution_seq SMALLINT,
    year_seq SMALLINT,
    year SMALLINT
);

-- author_last_known_institution表
CREATE TABLE author_last_known_institution (
    author_id BIGINT,
    last_known_institution_seq SMALLINT,
    last_known_institution_id BIGINT
);

-- author_position表
CREATE TABLE author_position (
    author_position_id SMALLINT,
    author_position VARCHAR(6)
);

-- citation表
CREATE TABLE citation (
    citing_work_id BIGINT,
    reference_seq INT,
    cited_work_id BIGINT,
    pub_year SMALLINT,
    cit_window SMALLINT,
    is_self_cit BOOLEAN
);

-- city表
CREATE TABLE city (
    geonames_city_id INT,
    city VARCHAR(100)
);

-- concept表
CREATE TABLE concept (
    CONCEPT_ID BIGINT,
    concept VARCHAR(120),
    description VARCHAR(250),
    level SMALLINT,
    openalex_id VARCHAR(12),
    mag_id BIGINT,
    wikidata_id VARCHAR(10),
    wikipedia_url VARCHAR(180),
    image_url VARCHAR(700),
    thumbnail_url VARCHAR(900),
    updated_date TIMESTAMP,
    created_date TIMESTAMP
);

CREATE TABLE tmp_concept (
    CONCEPT_ID BIGINT,
    concept VARCHAR(120),
    description VARCHAR(250),
    level SMALLINT,
    openalex_id VARCHAR(12),
    mag_id BIGINT,
    wikidata_id VARCHAR(10),
    wikipedia_url VARCHAR(180),
    image_url VARCHAR(700),
    thumbnail_url VARCHAR(900),
    updated_date TEXT,
    created_date TEXT
);


-- concept_ancestor表
CREATE TABLE concept_ancestor (
    CONCEPT_ID BIGINT,
    ancestor_concept_seq SMALLINT,
    ancestor_CONCEPT_ID BIGINT
);

-- concept_international_description表
CREATE TABLE concept_international_description (
    CONCEPT_ID BIGINT,
    language_code VARCHAR(16),
    concept_international_description VARCHAR(800)
);

-- concept_international_name表
CREATE TABLE concept_international_name (
    CONCEPT_ID BIGINT,
    language_code VARCHAR(30),
    concept_international_name VARCHAR(200)
);

-- concept_related表
CREATE TABLE concept_related (
    CONCEPT_ID BIGINT,
    related_concept_seq SMALLINT,
    related_CONCEPT_ID BIGINT,
    score FLOAT
);

-- concept_umls_aui表
CREATE TABLE concept_umls_aui (
    CONCEPT_ID BIGINT,
    umls_aui_seq SMALLINT,
    umls_aui VARCHAR(9)
);

-- concept_umls_cui表
CREATE TABLE concept_umls_cui (
    CONCEPT_ID BIGINT,
    umls_cui_seq SMALLINT,
    umls_cui CHAR(8)
);

-- country表
CREATE TABLE country (
    country_iso_alpha2_code CHAR(2),
    country VARCHAR(50)
);

-- data_source表
CREATE TABLE data_source (
    data_source_id BIGINT,
    data_source VARCHAR(20)
);

-- doi_registration_agency表
CREATE TABLE doi_registration_agency (
    doi_registration_agency_id SMALLINT,
    doi_registration_agency VARCHAR(20)
);

-- domain表
CREATE TABLE domain (
    domain_id SMALLINT,
    domain VARCHAR(120),
    description VARCHAR(250),
    openalex_id SMALLINT,
    wikidata_id VARCHAR(10),
    wikipedia_url VARCHAR(180),
    updated_date TIMESTAMP,
    created_date TIMESTAMP
);

CREATE TABLE tmp_domain (
    domain_id SMALLINT,
    domain VARCHAR(120),
    description VARCHAR(250),
    openalex_id SMALLINT,
    wikidata_id VARCHAR(10),
    wikipedia_url VARCHAR(180),
    updated_date TEXT,
    created_date TEXT
);

-- domain_alternative_name表
CREATE TABLE domain_alternative_name (
    domain_id SMALLINT,
    alternative_name_seq SMALLINT,
    alternative_name VARCHAR(255)
);

-- domain_field表
CREATE TABLE domain_field (
    domain_id SMALLINT,
    field_seq SMALLINT,
    field_id SMALLINT
);

-- domain_sibling表
CREATE TABLE domain_sibling (
    domain_id SMALLINT,
    sibling_domain_seq SMALLINT,
    sibling_domain_id SMALLINT
);

-- field表
CREATE TABLE field (
    field_id SMALLINT,
    field VARCHAR(120),
    description VARCHAR(250),
    openalex_id SMALLINT,
    wikidata_id VARCHAR(10),
    wikipedia_url VARCHAR(180),
    domain_id SMALLINT,
    updated_date TIMESTAMP,
    created_date TIMESTAMP
);

CREATE TABLE tmp_field (
    field_id SMALLINT,
    field VARCHAR(120),
    description VARCHAR(250),
    openalex_id SMALLINT,
    wikidata_id VARCHAR(10),
    wikipedia_url VARCHAR(180),
    domain_id SMALLINT,
    updated_date TEXT,
    created_date TEXT
);

-- field_alternative_name表
CREATE TABLE field_alternative_name (
    field_id SMALLINT,
    alternative_name_seq SMALLINT,
    alternative_name VARCHAR(255)
);

-- field_sibling表
CREATE TABLE field_sibling (
    field_id SMALLINT,
    sibling_field_seq SMALLINT,
    sibling_field_id SMALLINT
);

-- field_subfield表
CREATE TABLE field_subfield (
    field_id SMALLINT,
    subfield_seq SMALLINT,
    subfield_id SMALLINT
);

-- fulltext_origin表
CREATE TABLE fulltext_origin (
    fulltext_origin_id SMALLINT,
    fulltext_origin VARCHAR(20)
);

-- funder表
CREATE TABLE funder (
    funder_id BIGINT,
    funder VARCHAR(200),
    country_iso_alpha2_code CHAR(2),
    description VARCHAR(250),
    homepage_url VARCHAR(200),
    ror_id VARCHAR(9),
    openalex_id VARCHAR(12),
    wikidata_id VARCHAR(10),
    image_url VARCHAR(700),
    thumbnail_url VARCHAR(1200),
    updated_date TIMESTAMP,
    created_date TIMESTAMP
);

-- funder_alternative_name表
CREATE TABLE funder_alternative_name (
    funder_id BIGINT,
    alternative_name_seq SMALLINT,
    alternative_name VARCHAR(500)
);

-- funder_publisher表
CREATE TABLE funder_publisher (
    funder_id BIGINT,
    publisher_seq SMALLINT,
    publisher_id BIGINT
);

-- institution表
CREATE TABLE institution (
    institution_id BIGINT,
    institution VARCHAR(200),
    institution_type_id SMALLINT,
    country_iso_alpha2_code CHAR(2),
    region_id SMALLINT,
    geonames_city_id INT,
    latitude FLOAT,
    longitude FLOAT,
    homepage_url VARCHAR(600),
    is_super_system BOOLEAN,
    ror_id VARCHAR(9),
    grid_id VARCHAR(13),
    openalex_id VARCHAR(12),
    mag_id BIGINT,
    wikidata_id VARCHAR(10),
    wikipedia_url VARCHAR(800),
    image_url VARCHAR(800),
    thumbnail_url VARCHAR(1200),
    updated_date TIMESTAMP,
    created_date TIMESTAMP
);

-- institution_acronym表
CREATE TABLE institution_acronym (
    institution_id BIGINT,
    acronym_seq SMALLINT,
    acronym VARCHAR(70)
);

-- institution_alternative_name表
CREATE TABLE institution_alternative_name (
    institution_id BIGINT,
    alternative_name_seq SMALLINT,
    alternative_name VARCHAR(250)
);

-- institution_associated表
CREATE TABLE institution_associated (
    institution_id BIGINT,
    associated_institution_seq SMALLINT,
    associated_institution_id BIGINT,
    institution_relationship_type_id SMALLINT
);

-- institution_funder表
CREATE TABLE institution_funder (
    institution_id BIGINT,
    funder_seq SMALLINT,
    funder_id BIGINT
);

-- institution_international_name表
CREATE TABLE institution_international_name (
    institution_id BIGINT,
    language_code VARCHAR(16),
    institution_international_name VARCHAR(200)
);

-- institution_lineage表
CREATE TABLE institution_lineage (
    institution_id BIGINT,
    lineage_institution_seq SMALLINT,
    lineage_institution_id BIGINT
);

-- institution_publisher表
CREATE TABLE institution_publisher (
    institution_id BIGINT,
    publisher_seq SMALLINT,
    publisher_id BIGINT
);

-- institution_relationship_type表
CREATE TABLE institution_relationship_type (
    institution_relationship_type_id SMALLINT,
    institution_relationship_type VARCHAR(10)
);

-- institution_repository表
CREATE TABLE institution_repository (
    institution_id BIGINT,
    repository_seq SMALLINT,
    repository_source_id BIGINT
);

-- institution_type表
CREATE TABLE institution_type (
    institution_type_id SMALLINT,
    institution_type VARCHAR(10)
);

-- keyword表
CREATE TABLE keyword (
    keyword_id INT,
    keyword VARCHAR(200)
);

-- license表
CREATE TABLE license (
    license_id SMALLINT,
    license VARCHAR(60)
);

-- mesh_descriptor表
CREATE TABLE mesh_descriptor (
    mesh_descriptor_ui VARCHAR(10),
    mesh_descriptor VARCHAR(120)
);

-- mesh_qualifier表
CREATE TABLE mesh_qualifier (
    mesh_qualifier_ui VARCHAR(10),
    mesh_qualifier VARCHAR(40)
);

-- oa_status表
CREATE TABLE oa_status (
    oa_status_id SMALLINT,
    oa_status VARCHAR(10)
);

-- publisher表
CREATE TABLE publisher (
    publisher_id BIGINT,
    publisher VARCHAR(200),
    hierarchy_level SMALLINT,
    parent_publisher_id BIGINT,
    homepage_url VARCHAR(200),
    ror_id VARCHAR(9),
    openalex_id VARCHAR(12),
    wikidata_id VARCHAR(10),
    image_url VARCHAR(700),
    thumbnail_url VARCHAR(1200),
    updated_date TIMESTAMP,
    created_date TIMESTAMP
);

-- publisher_alternative_name表
CREATE TABLE publisher_alternative_name (
    publisher_id BIGINT,
    alternative_name_seq SMALLINT,
    alternative_name VARCHAR(150)
);

-- publisher_country表
CREATE TABLE publisher_country (
    publisher_id BIGINT,
    country_seq SMALLINT,
    country_iso_alpha2_code CHAR(2)
);

-- raw_affiliation_string表
CREATE TABLE raw_affiliation_string (
    raw_affiliation_string_id INT,
    raw_affiliation_string VARCHAR(800)
);

-- raw_author_name表
CREATE TABLE raw_author_name (
    raw_author_name_id INT,
    raw_author_name VARCHAR(800)
);

-- region表
CREATE TABLE region (
    region_id SMALLINT,
    region VARCHAR(50)
);

-- source表
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

CREATE TABLE tmp_source (
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
    updated_date TEXT,
    created_date TEXT
);

-- source_alternative_title表
CREATE TABLE source_alternative_title (
    source_id BIGINT,
    alternative_title_seq SMALLINT,
    alternative_title VARCHAR(700)
);

-- source_apc_price表
CREATE TABLE source_apc_price (
    source_id BIGINT,
    apc_price_seq SMALLINT,
    apc_price INT,
    currency CHAR(3)
);

-- source_issn表
CREATE TABLE source_issn (
    source_id BIGINT,
    issn_seq SMALLINT,
    issn CHAR(9)
);

-- source_society表
CREATE TABLE source_society (
    source_id BIGINT,
    society_seq SMALLINT,
    society VARCHAR(500),
    homepage_url VARCHAR(250)
);

-- source_type表
CREATE TABLE source_type (
    source_type_id SMALLINT,
    source_type VARCHAR(14)
);

-- subfield表
CREATE TABLE subfield (
    subfield_id SMALLINT,
    subfield VARCHAR(120),
    description VARCHAR(250),
    openalex_id SMALLINT,
    wikidata_id VARCHAR(10),
    wikipedia_url VARCHAR(180),
    domain_id SMALLINT,
    field_id SMALLINT,
    updated_date TIMESTAMP,
    created_date TIMESTAMP
);

-- subfield_alternative_name表
CREATE TABLE subfield_alternative_name (
    subfield_id SMALLINT,
    alternative_name_seq SMALLINT,
    alternative_name VARCHAR(255)
);

-- subfield_sibling表
CREATE TABLE subfield_sibling (
    subfield_id SMALLINT,
    sibling_subfield_seq SMALLINT,
    sibling_subfield_id SMALLINT
);

-- subfield_topic表
CREATE TABLE subfield_topic (
    subfield_id SMALLINT,
    topic_seq SMALLINT,
    topic_id SMALLINT
);

-- sustainable_development_goal表
CREATE TABLE sustainable_development_goal (
    sustainable_development_goal_id SMALLINT,
    sustainable_development_goal VARCHAR(40),
    taxonomy_url VARCHAR(30)
);

-- topic表
CREATE TABLE topic (
    topic_id SMALLINT,
    topic VARCHAR(120),
    description VARCHAR(1000),
    openalex_id SMALLINT,
    wikipedia_url VARCHAR(180),
    domain_id SMALLINT,
    field_id SMALLINT,
    subfield_id SMALLINT,
    updated_date TIMESTAMP,
    created_date TIMESTAMP
);

-- topic_keyword表
CREATE TABLE topic_keyword (
    topic_id SMALLINT,
    keyword_seq SMALLINT,
    keyword VARCHAR(100)
);

-- topic_sibling表
CREATE TABLE topic_sibling (
    topic_id SMALLINT,
    sibling_topic_seq SMALLINT,
    sibling_topic_id SMALLINT
);

-- version表
CREATE TABLE version (
    version_id SMALLINT,
    version VARCHAR(16)
);

-- work表
-- 日期格式不同，要导入临时表格
CREATE TABLE tmp_work (
    work_id BIGINT,
    work_type_id SMALLINT,
    crossref_work_type_id SMALLINT,
    source_id BIGINT,
    pub_date TEXT,
    pub_year SMALLINT,
    volume VARCHAR(1000),
    issue VARCHAR(80),
    page_first VARCHAR(200),
    page_last VARCHAR(300),
    doi_registration_agency_id SMALLINT,
    doi VARCHAR(350),
    openalex_id VARCHAR(32),
    mag_id BIGINT,
    pmid BIGINT,
    pmcid INT,
    arxiv_id VARCHAR(80),
    language_iso2_code CHAR(2),
    is_paratext BOOLEAN,
    is_retracted BOOLEAN,
    is_oa BOOLEAN,
    any_repository_has_fulltext BOOLEAN,
    oa_status_id SMALLINT,
    oa_url VARCHAR(4000),
    apc_list_currency CHAR(3),
    apc_list_price INT,
    apc_list_price_usd INT,
    apc_list_apc_provenance_id SMALLINT,
    apc_paid_currency CHAR(3),
    apc_paid_price INT,
    apc_paid_price_usd INT,
    apc_paid_apc_provenance_id SMALLINT,
    fulltext_origin_id SMALLINT,
    n_refs INT,
    n_cits INT,
    updated_date TEXT,
    created_date TEXT
);

CREATE TABLE work (
    work_id BIGINT,
    work_type_id SMALLINT,
    crossref_work_type_id SMALLINT,
    source_id BIGINT,
    pub_date TIMESTAMP,
    pub_year SMALLINT,
    volume VARCHAR(1000),
    issue VARCHAR(80),
    page_first VARCHAR(200),
    page_last VARCHAR(300),
    doi_registration_agency_id SMALLINT,
    doi VARCHAR(350),
    openalex_id VARCHAR(32),
    mag_id BIGINT,
    pmid BIGINT,
    pmcid INT,
    arxiv_id VARCHAR(80),
    language_iso2_code CHAR(2),
    is_paratext BOOLEAN,
    is_retracted BOOLEAN,
    is_oa BOOLEAN,
    any_repository_has_fulltext BOOLEAN,
    oa_status_id SMALLINT,
    oa_url VARCHAR(4000),
    apc_list_currency CHAR(3),
    apc_list_price INT,
    apc_list_price_usd INT,
    apc_list_apc_provenance_id SMALLINT,
    apc_paid_currency CHAR(3),
    apc_paid_price INT,
    apc_paid_price_usd INT,
    apc_paid_apc_provenance_id SMALLINT,
    fulltext_origin_id SMALLINT,
    n_refs INT,
    n_cits INT,
    updated_date TIMESTAMP,
    created_date TIMESTAMP
);

-- -- work_abstract表
CREATE TABLE work_abstract (
    work_id BIGINT,
    abstract TEXT
);

-- work_affiliation表
CREATE TABLE work_affiliation (
    work_id BIGINT,
    affiliation_seq SMALLINT,
    raw_affiliation_string_id INT
);

-- work_affiliation_institution表
CREATE TABLE work_affiliation_institution (
    work_id BIGINT,
    affiliation_seq SMALLINT,
    institution_seq SMALLINT,
    institution_id BIGINT
);

-- work_author表
CREATE TABLE work_author (
    work_id BIGINT,
    author_seq SMALLINT,
    author_id BIGINT,
    author_position_id SMALLINT,
    is_corresponding_author BOOLEAN,
    raw_author_name_id INT
);

-- work_author_affiliation表
CREATE TABLE work_author_affiliation (
    work_id BIGINT,
    author_seq SMALLINT,
    affiliation_seq SMALLINT
);

-- work_author_country表
CREATE TABLE work_author_country (
    work_id BIGINT,
    author_seq SMALLINT,
    country_seq SMALLINT,
    country_iso_alpha2_code CHAR(2)
);

-- work_concept表
CREATE TABLE work_concept (
    work_id BIGINT,
    concept_seq SMALLINT,
    CONCEPT_ID BIGINT,
    score FLOAT
);

-- work_data_source表
CREATE TABLE work_data_source (
    work_id BIGINT,
    data_source_seq SMALLINT,
    data_source_id BIGINT
);

-- work_detail表
CREATE TABLE work_detail (
    work_id BIGINT,
    author_first VARCHAR(1000),
    author_et_al VARCHAR(800),
    institution_first VARCHAR(200),
    institution_et_al VARCHAR(500),
    title TEXT,
    source VARCHAR(800),
    pub_year SMALLINT,
    volume VARCHAR(100),
    issue VARCHAR(80),
    pages VARCHAR(350),
    doi VARCHAR(330),
    pmid INT,
    work_type VARCHAR(25),
    n_cits INT,
    n_self_cits INT
);

-- work_grant表
CREATE TABLE work_grant (
    work_id BIGINT,
    grant_seq SMALLINT,
    award_id VARCHAR(1000),
    funder_id BIGINT
);

-- work_keyword表
CREATE TABLE work_keyword (
    work_id BIGINT,
    keyword_seq SMALLINT,
    keyword_id INT,
    score FLOAT
);

-- work_location表
CREATE TABLE work_location (
    work_id BIGINT,
    location_seq SMALLINT,
    is_primary_location BOOLEAN,
    is_best_oa_location BOOLEAN,
    source_id BIGINT,
    landing_page_url VARCHAR(2000),
    pdf_url VARCHAR(4000),
    version_id SMALLINT,
    license_id SMALLINT,
    is_oa BOOLEAN,
    is_accepted BOOLEAN,
    is_published BOOLEAN
);

-- work_mesh表
CREATE TABLE work_mesh (
    work_id BIGINT,
    mesh_seq SMALLINT,
    mesh_descriptor_ui VARCHAR(10),
    mesh_qualifier_ui VARCHAR(10),
    is_major_topic BOOLEAN
);

-- work_reference表
CREATE TABLE work_reference (
    work_id BIGINT,
    reference_seq INT,
    cited_work_id BIGINT
);

-- work_related表
CREATE TABLE work_related (
    work_id BIGINT,
    related_work_seq SMALLINT,
    related_work_id BIGINT
);

-- work_sustainable_development_goal表
CREATE TABLE work_sustainable_development_goal (
    work_id BIGINT,
    sustainable_development_goal_seq SMALLINT,
    sustainable_development_goal_id SMALLINT,
    score FLOAT
);

-- work_title表
CREATE TABLE work_title (
    work_id BIGINT,
    title TEXT
);

-- work_topic表
CREATE TABLE work_topic (
    work_id BIGINT,
    topic_seq SMALLINT,
    topic_id SMALLINT,
    score FLOAT,
    is_primary_topic BOOLEAN
);

-- work_type表
CREATE TABLE work_type (
    work_type_id SMALLINT,
    work_type VARCHAR(25)
);
