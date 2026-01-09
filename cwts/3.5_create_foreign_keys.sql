-- author_alternative_name表外键
ALTER TABLE author_alternative_name ADD CONSTRAINT FK_author_alternative_name_author 
    FOREIGN KEY (author_id) REFERENCES author(author_id);

-- author_institution表外键
ALTER TABLE author_institution ADD CONSTRAINT FK_author_institution_author 
    FOREIGN KEY (author_id) REFERENCES author(author_id);
ALTER TABLE author_institution ADD CONSTRAINT FK_author_institution_institution 
    FOREIGN KEY (institution_id) REFERENCES institution(institution_id);

-- author_institution_year表外键
ALTER TABLE author_institution_year ADD CONSTRAINT FK_author_institution_year_author_institution 
    FOREIGN KEY (author_id, institution_seq) REFERENCES author_institution(author_id, institution_seq);

-- author_last_known_institution表外键
ALTER TABLE author_last_known_institution ADD CONSTRAINT FK_author_last_known_institution_author 
    FOREIGN KEY (author_id) REFERENCES author(author_id);
ALTER TABLE author_last_known_institution ADD CONSTRAINT FK_author_last_known_institution_institution 
    FOREIGN KEY (last_known_institution_id) REFERENCES institution(institution_id);

-- citation表外键
ALTER TABLE citation ADD CONSTRAINT FK_citation_citing_work 
    FOREIGN KEY (citing_work_id) REFERENCES work(work_id);
ALTER TABLE citation ADD CONSTRAINT FK_citation_cited_work 
    FOREIGN KEY (cited_work_id) REFERENCES work(work_id);

-- concept_ancestor表外键
ALTER TABLE concept_ancestor ADD CONSTRAINT FK_concept_ancestor_concept 
    FOREIGN KEY (concept_id) REFERENCES concept(concept_id);
ALTER TABLE concept_ancestor ADD CONSTRAINT FK_concept_ancestor_ancestor_concept 
    FOREIGN KEY (ancestor_concept_id) REFERENCES concept(concept_id);

-- concept_international_description表外键
ALTER TABLE concept_international_description ADD CONSTRAINT FK_concept_international_description_concept 
    FOREIGN KEY (concept_id) REFERENCES concept(concept_id);

-- concept_international_name表外键
ALTER TABLE concept_international_name ADD CONSTRAINT FK_concept_international_name_concept 
    FOREIGN KEY (concept_id) REFERENCES concept(concept_id);

-- concept_related表外键
ALTER TABLE concept_related ADD CONSTRAINT FK_concept_related_concept 
    FOREIGN KEY (concept_id) REFERENCES concept(concept_id);
ALTER TABLE concept_related ADD CONSTRAINT FK_concept_related_related_concept 
    FOREIGN KEY (related_concept_id) REFERENCES concept(concept_id);

-- concept_umls_aui表外键
ALTER TABLE concept_umls_aui ADD CONSTRAINT FK_concept_umls_aui_concept 
    FOREIGN KEY (concept_id) REFERENCES concept(concept_id);

-- concept_umls_cui表外键
ALTER TABLE concept_umls_cui ADD CONSTRAINT FK_concept_umls_cui_concept 
    FOREIGN KEY (concept_id) REFERENCES concept(concept_id);

-- domain_alternative_name表外键
ALTER TABLE domain_alternative_name ADD CONSTRAINT FK_domain_alternative_name_domain 
    FOREIGN KEY (domain_id) REFERENCES domain(domain_id);

-- domain_field表外键
ALTER TABLE domain_field ADD CONSTRAINT FK_domain_field_domain 
    FOREIGN KEY (domain_id) REFERENCES domain(domain_id);
ALTER TABLE domain_field ADD CONSTRAINT FK_domain_field_field 
    FOREIGN KEY (field_id) REFERENCES field(field_id);

-- domain_sibling表外键
ALTER TABLE domain_sibling ADD CONSTRAINT FK_domain_sibling_domain 
    FOREIGN KEY (domain_id) REFERENCES domain(domain_id);
ALTER TABLE domain_sibling ADD CONSTRAINT FK_domain_sibling_sibling_domain 
    FOREIGN KEY (sibling_domain_id) REFERENCES domain(domain_id);

-- field表外键
ALTER TABLE field ADD CONSTRAINT FK_field_domain 
    FOREIGN KEY (domain_id) REFERENCES domain(domain_id);

-- field_alternative_name表外键
ALTER TABLE field_alternative_name ADD CONSTRAINT FK_field_alternative_name_field 
    FOREIGN KEY (field_id) REFERENCES field(field_id);

-- field_sibling表外键
ALTER TABLE field_sibling ADD CONSTRAINT FK_field_sibling_field 
    FOREIGN KEY (field_id) REFERENCES field(field_id);
ALTER TABLE field_sibling ADD CONSTRAINT FK_field_sibling_sibling_field 
    FOREIGN KEY (sibling_field_id) REFERENCES field(field_id);

-- field_subfield表外键
ALTER TABLE field_subfield ADD CONSTRAINT FK_field_subfield_field 
    FOREIGN KEY (field_id) REFERENCES field(field_id);
ALTER TABLE field_subfield ADD CONSTRAINT FK_field_subfield_subfield 
    FOREIGN KEY (subfield_id) REFERENCES subfield(subfield_id);

-- funder_alternative_name表外键
ALTER TABLE funder_alternative_name ADD CONSTRAINT FK_funder_alternative_name_funder 
    FOREIGN KEY (funder_id) REFERENCES funder(funder_id);

-- funder_publisher表外键
ALTER TABLE funder_publisher ADD CONSTRAINT FK_funder_publisher_funder 
    FOREIGN KEY (funder_id) REFERENCES funder(funder_id);
ALTER TABLE funder_publisher ADD CONSTRAINT FK_funder_publisher_publisher 
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id);

-- funder表外键
ALTER TABLE funder ADD CONSTRAINT FK_funder_country 
    FOREIGN KEY (country_iso_alpha2_code) REFERENCES country(country_iso_alpha2_code);

-- institution_acronym表外键
ALTER TABLE institution_acronym ADD CONSTRAINT FK_institution_acronym_institution 
    FOREIGN KEY (institution_id) REFERENCES institution(institution_id);

-- institution_alternative_name表外键
ALTER TABLE institution_alternative_name ADD CONSTRAINT FK_institution_alternative_name_institution 
    FOREIGN KEY (institution_id) REFERENCES institution(institution_id);

-- institution_associated表外键
ALTER TABLE institution_associated ADD CONSTRAINT FK_institution_associated_institution 
    FOREIGN KEY (institution_id) REFERENCES institution(institution_id);
ALTER TABLE institution_associated ADD CONSTRAINT FK_institution_associated_associated_institution 
    FOREIGN KEY (associated_institution_id) REFERENCES institution(institution_id);
ALTER TABLE institution_associated ADD CONSTRAINT FK_institution_associated_relationship_type 
    FOREIGN KEY (institution_relationship_type_id) REFERENCES institution_relationship_type(institution_relationship_type_id);

-- institution_funder表外键
ALTER TABLE institution_funder ADD CONSTRAINT FK_institution_funder_institution 
    FOREIGN KEY (institution_id) REFERENCES institution(institution_id);
ALTER TABLE institution_funder ADD CONSTRAINT FK_institution_funder_funder 
    FOREIGN KEY (funder_id) REFERENCES funder(funder_id);

-- institution_international_name表外键
ALTER TABLE institution_international_name ADD CONSTRAINT FK_institution_international_name_institution 
    FOREIGN KEY (institution_id) REFERENCES institution(institution_id);

-- institution_lineage表外键
ALTER TABLE institution_lineage ADD CONSTRAINT FK_institution_lineage_institution 
    FOREIGN KEY (institution_id) REFERENCES institution(institution_id);
ALTER TABLE institution_lineage ADD CONSTRAINT FK_institution_lineage_lineage_institution 
    FOREIGN KEY (lineage_institution_id) REFERENCES institution(institution_id);

-- institution_publisher表外键
ALTER TABLE institution_publisher ADD CONSTRAINT FK_institution_publisher_institution 
    FOREIGN KEY (institution_id) REFERENCES institution(institution_id);
ALTER TABLE institution_publisher ADD CONSTRAINT FK_institution_publisher_publisher 
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id);

-- institution_repository表外键
ALTER TABLE institution_repository ADD CONSTRAINT FK_institution_repository_institution 
    FOREIGN KEY (institution_id) REFERENCES institution(institution_id);
ALTER TABLE institution_repository ADD CONSTRAINT FK_institution_repository_source 
    FOREIGN KEY (repository_source_id) REFERENCES source(source_id);

-- institution表外键
ALTER TABLE institution ADD CONSTRAINT FK_institution_institution_type 
    FOREIGN KEY (institution_type_id) REFERENCES institution_type(institution_type_id);
ALTER TABLE institution ADD CONSTRAINT FK_institution_country 
    FOREIGN KEY (country_iso_alpha2_code) REFERENCES country(country_iso_alpha2_code);
ALTER TABLE institution ADD CONSTRAINT FK_institution_region 
    FOREIGN KEY (region_id) REFERENCES region(region_id);
ALTER TABLE institution ADD CONSTRAINT FK_institution_city 
    FOREIGN KEY (geonames_city_id) REFERENCES city(geonames_city_id);

-- publisher_alternative_name表外键
ALTER TABLE publisher_alternative_name ADD CONSTRAINT FK_publisher_alternative_name_publisher 
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id);

-- publisher_country表外键
ALTER TABLE publisher_country ADD CONSTRAINT FK_publisher_country_publisher 
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id);
ALTER TABLE publisher_country ADD CONSTRAINT FK_publisher_country_country 
    FOREIGN KEY (country_iso_alpha2_code) REFERENCES country(country_iso_alpha2_code);

-- publisher表外键
ALTER TABLE publisher ADD CONSTRAINT FK_publisher_parent_publisher 
    FOREIGN KEY (parent_publisher_id) REFERENCES publisher(publisher_id);

-- source_alternative_title表外键
ALTER TABLE source_alternative_title ADD CONSTRAINT FK_source_alternative_title_source 
    FOREIGN KEY (source_id) REFERENCES source(source_id);

-- source_apc_price表外键
ALTER TABLE source_apc_price ADD CONSTRAINT FK_source_apc_price_source 
    FOREIGN KEY (source_id) REFERENCES source(source_id);

-- source_issn表外键
ALTER TABLE source_issn ADD CONSTRAINT FK_source_issn_source 
    FOREIGN KEY (source_id) REFERENCES source(source_id);

-- source_society表外键
ALTER TABLE source_society ADD CONSTRAINT FK_source_society_source 
    FOREIGN KEY (source_id) REFERENCES source(source_id);

-- source表外键
ALTER TABLE source ADD CONSTRAINT FK_source_source_type 
    FOREIGN KEY (source_type_id) REFERENCES source_type(source_type_id);
ALTER TABLE source ADD CONSTRAINT FK_source_country 
    FOREIGN KEY (country_iso_alpha2_code) REFERENCES country(country_iso_alpha2_code);
ALTER TABLE source ADD CONSTRAINT FK_source_publisher 
    FOREIGN KEY (host_organization_publisher_id) REFERENCES publisher(publisher_id);
ALTER TABLE source ADD CONSTRAINT FK_source_institution 
    FOREIGN KEY (host_organization_institution_id) REFERENCES institution(institution_id);

-- subfield_alternative_name表外键
ALTER TABLE subfield_alternative_name ADD CONSTRAINT FK_subfield_alternative_name_subfield 
    FOREIGN KEY (subfield_id) REFERENCES subfield(subfield_id);

-- subfield_sibling表外键
ALTER TABLE subfield_sibling ADD CONSTRAINT FK_subfield_sibling_subfield 
    FOREIGN KEY (subfield_id) REFERENCES subfield(subfield_id);
ALTER TABLE subfield_sibling ADD CONSTRAINT FK_subfield_sibling_sibling_subfield 
    FOREIGN KEY (sibling_subfield_id) REFERENCES subfield(subfield_id);

-- subfield_topic表外键
ALTER TABLE subfield_topic ADD CONSTRAINT FK_subfield_topic_subfield 
    FOREIGN KEY (subfield_id) REFERENCES subfield(subfield_id);
ALTER TABLE subfield_topic ADD CONSTRAINT FK_subfield_topic_topic 
    FOREIGN KEY (topic_id) REFERENCES topic(topic_id);

-- subfield表外键
ALTER TABLE subfield ADD CONSTRAINT FK_subfield_domain 
    FOREIGN KEY (domain_id) REFERENCES domain(domain_id);
ALTER TABLE subfield ADD CONSTRAINT FK_subfield_field 
    FOREIGN KEY (field_id) REFERENCES field(field_id);

-- topic_keyword表外键
ALTER TABLE topic_keyword ADD CONSTRAINT FK_topic_keyword_topic 
    FOREIGN KEY (topic_id) REFERENCES topic(topic_id);

-- topic_sibling表外键
ALTER TABLE topic_sibling ADD CONSTRAINT FK_topic_sibling_topic 
    FOREIGN KEY (topic_id) REFERENCES topic(topic_id);
ALTER TABLE topic_sibling ADD CONSTRAINT FK_topic_sibling_sibling_topic 
    FOREIGN KEY (sibling_topic_id) REFERENCES topic(topic_id);

-- topic表外键
ALTER TABLE topic ADD CONSTRAINT FK_topic_domain 
    FOREIGN KEY (domain_id) REFERENCES domain(domain_id);
ALTER TABLE topic ADD CONSTRAINT FK_topic_field 
    FOREIGN KEY (field_id) REFERENCES field(field_id);
ALTER TABLE topic ADD CONSTRAINT FK_topic_subfield 
    FOREIGN KEY (subfield_id) REFERENCES subfield(subfield_id);

-- work_abstract表外键
ALTER TABLE work_abstract ADD CONSTRAINT FK_work_abstract_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);

-- work_affiliation_institution表外键
ALTER TABLE work_affiliation_institution ADD CONSTRAINT FK_work_affiliation_institution_work_affiliation 
    FOREIGN KEY (work_id, affiliation_seq) REFERENCES work_affiliation(work_id, affiliation_seq);
ALTER TABLE work_affiliation_institution ADD CONSTRAINT FK_work_affiliation_institution_institution 
    FOREIGN KEY (institution_id) REFERENCES institution(institution_id);

-- work_affiliation表外键
ALTER TABLE work_affiliation ADD CONSTRAINT FK_work_affiliation_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);
ALTER TABLE work_affiliation ADD CONSTRAINT FK_work_affiliation_raw_string 
    FOREIGN KEY (raw_affiliation_string_id) REFERENCES raw_affiliation_string(raw_affiliation_string_id);

-- work_author_affiliation表外键
ALTER TABLE work_author_affiliation ADD CONSTRAINT FK_work_author_affiliation_work_author 
    FOREIGN KEY (work_id, author_seq) REFERENCES work_author(work_id, author_seq);
ALTER TABLE work_author_affiliation ADD CONSTRAINT FK_work_author_affiliation_work_affiliation 
    FOREIGN KEY (work_id, affiliation_seq) REFERENCES work_affiliation(work_id, affiliation_seq);

-- work_author_country表外键
ALTER TABLE work_author_country ADD CONSTRAINT FK_work_author_country_work_author 
    FOREIGN KEY (work_id, author_seq) REFERENCES work_author(work_id, author_seq);
ALTER TABLE work_author_country ADD CONSTRAINT FK_work_author_country_country 
    FOREIGN KEY (country_iso_alpha2_code) REFERENCES country(country_iso_alpha2_code);

-- work_author表外键
ALTER TABLE work_author ADD CONSTRAINT FK_work_author_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);
ALTER TABLE work_author ADD CONSTRAINT FK_work_author_author 
    FOREIGN KEY (author_id) REFERENCES author(author_id);
ALTER TABLE work_author ADD CONSTRAINT FK_work_author_position 
    FOREIGN KEY (author_position_id) REFERENCES author_position(author_position_id);
ALTER TABLE work_author ADD CONSTRAINT FK_work_author_raw_name 
    FOREIGN KEY (raw_author_name_id) REFERENCES raw_author_name(raw_author_name_id);

-- work_concept表外键
ALTER TABLE work_concept ADD CONSTRAINT FK_work_concept_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);
ALTER TABLE work_concept ADD CONSTRAINT FK_work_concept_concept 
    FOREIGN KEY (concept_id) REFERENCES concept(concept_id);

-- work_data_source表外键
ALTER TABLE work_data_source ADD CONSTRAINT FK_work_data_source_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);
ALTER TABLE work_data_source ADD CONSTRAINT FK_work_data_source_data_source 
    FOREIGN KEY (data_source_id) REFERENCES data_source(data_source_id);

-- work_detail表外键
ALTER TABLE work_detail ADD CONSTRAINT FK_work_detail_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);

-- work_grant表外键
ALTER TABLE work_grant ADD CONSTRAINT FK_work_grant_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);
ALTER TABLE work_grant ADD CONSTRAINT FK_work_grant_funder 
    FOREIGN KEY (funder_id) REFERENCES funder(funder_id);

-- work_keyword表外键
ALTER TABLE work_keyword ADD CONSTRAINT FK_work_keyword_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);
ALTER TABLE work_keyword ADD CONSTRAINT FK_work_keyword_keyword 
    FOREIGN KEY (keyword_id) REFERENCES keyword(keyword_id);

-- work_location表外键
ALTER TABLE work_location ADD CONSTRAINT FK_work_location_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);
ALTER TABLE work_location ADD CONSTRAINT FK_work_location_source 
    FOREIGN KEY (source_id) REFERENCES source(source_id);
ALTER TABLE work_location ADD CONSTRAINT FK_work_location_version 
    FOREIGN KEY (version_id) REFERENCES version(version_id);
ALTER TABLE work_location ADD CONSTRAINT FK_work_location_license 
    FOREIGN KEY (license_id) REFERENCES license(license_id);

-- work_mesh表外键
ALTER TABLE work_mesh ADD CONSTRAINT FK_work_mesh_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);
ALTER TABLE work_mesh ADD CONSTRAINT FK_work_mesh_descriptor 
    FOREIGN KEY (mesh_descriptor_ui) REFERENCES mesh_descriptor(mesh_descriptor_ui);
ALTER TABLE work_mesh ADD CONSTRAINT FK_work_mesh_qualifier 
    FOREIGN KEY (mesh_qualifier_ui) REFERENCES mesh_qualifier(mesh_qualifier_ui);

-- work_reference表外键
ALTER TABLE work_reference ADD CONSTRAINT FK_work_reference_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);
ALTER TABLE work_reference ADD CONSTRAINT FK_work_reference_cited_work 
    FOREIGN KEY (cited_work_id) REFERENCES work(work_id);

-- work_related表外键
ALTER TABLE work_related ADD CONSTRAINT FK_work_related_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);
ALTER TABLE work_related ADD CONSTRAINT FK_work_related_related_work 
    FOREIGN KEY (related_work_id) REFERENCES work(work_id);

-- work_sustainable_development_goal表外键
ALTER TABLE work_sustainable_development_goal ADD CONSTRAINT FK_work_sdg_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);
ALTER TABLE work_sustainable_development_goal ADD CONSTRAINT FK_work_sdg_sdg 
    FOREIGN KEY (sustainable_development_goal_id) REFERENCES sustainable_development_goal(sustainable_development_goal_id);

-- work_title表外键
ALTER TABLE work_title ADD CONSTRAINT FK_work_title_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);

-- work_topic表外键
ALTER TABLE work_topic ADD CONSTRAINT FK_work_topic_work 
    FOREIGN KEY (work_id) REFERENCES work(work_id);
ALTER TABLE work_topic ADD CONSTRAINT FK_work_topic_topic 
    FOREIGN KEY (topic_id) REFERENCES topic(topic_id);

-- work表外键
ALTER TABLE work ADD CONSTRAINT FK_work_work_type 
    FOREIGN KEY (work_type_id) REFERENCES work_type(work_type_id);
ALTER TABLE work ADD CONSTRAINT FK_work_doi_registration_agency 
    FOREIGN KEY (doi_registration_agency_id) REFERENCES doi_registration_agency(doi_registration_agency_id);
ALTER TABLE work ADD CONSTRAINT FK_work_language 
    FOREIGN KEY (language_iso2_code) REFERENCES country(country_iso_alpha2_code);
ALTER TABLE work ADD CONSTRAINT FK_work_oa_status 
    FOREIGN KEY (oa_status_id) REFERENCES oa_status(oa_status_id);
ALTER TABLE work ADD CONSTRAINT FK_work_apc_list_provenance 
    FOREIGN KEY (apc_list_apc_provenance_id) REFERENCES apc_provenance(apc_provenance_id);
ALTER TABLE work ADD CONSTRAINT FK_work_apc_paid_provenance 
    FOREIGN KEY (apc_paid_apc_provenance_id) REFERENCES apc_provenance(apc_provenance_id);
ALTER TABLE work ADD CONSTRAINT FK_work_fulltext_origin 
    FOREIGN KEY (fulltext_origin_id) REFERENCES fulltext_origin(fulltext_origin_id);
