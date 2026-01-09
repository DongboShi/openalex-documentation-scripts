-- apc_provenance表索引
CREATE INDEX idx_apc_provenance_name ON apc_provenance(apc_provenance);

-- author表索引
CREATE INDEX idx_author_name ON author(author);
CREATE INDEX idx_author_orcid ON author(orcid);
CREATE INDEX idx_author_openalex_id ON author(openalex_id);

-- author_alternative_name表索引
CREATE INDEX idx_author_alt_name ON author_alternative_name(alternative_name);

-- author_institution表索引
CREATE INDEX idx_author_institution_inst_id ON author_institution(institution_id);

-- author_last_known_institution表索引
CREATE INDEX idx_author_last_known_inst_id ON author_last_known_institution(last_known_institution_id);

-- author_position表索引
CREATE INDEX idx_author_position_name ON author_position(author_position);

-- city表索引
CREATE INDEX idx_city_name ON city(city);

-- citation表索引
CREATE INDEX idx_citation_cited_work_id ON citation(cited_work_id);
CREATE INDEX idx_citation_pub_year ON citation(pub_year);

-- concept表索引
CREATE INDEX idx_concept_name ON concept(concept);
CREATE INDEX idx_concept_level ON concept(level);
CREATE INDEX idx_concept_openalex_id ON concept(openalex_id);
CREATE INDEX idx_concept_wikidata_id ON concept(wikidata_id);

-- concept_ancestor表索引
CREATE INDEX idx_concept_ancestor_ancestor_id ON concept_ancestor(ancestor_concept_id);

-- concept_international_description表索引
CREATE INDEX idx_concept_intl_desc_lang ON concept_international_description(language_code);

-- concept_international_name表索引
CREATE INDEX idx_concept_intl_name_lang ON concept_international_name(language_code);

-- concept_related表索引
CREATE INDEX idx_concept_related_related_id ON concept_related(related_concept_id);
CREATE INDEX idx_concept_related_score ON concept_related(score);

-- concept_umls_aui表索引
CREATE INDEX idx_concept_umls_aui_aui ON concept_umls_aui(umls_aui);

-- concept_umls_cui表索引
CREATE INDEX idx_concept_umls_cui_cui ON concept_umls_cui(umls_cui);

-- country表索引
CREATE INDEX idx_country_name ON country(country);

-- data_source表索引
CREATE INDEX idx_data_source_name ON data_source(data_source);

-- doi_registration_agency表索引
CREATE INDEX idx_doi_reg_agency_name ON doi_registration_agency(doi_registration_agency);

-- domain表索引
CREATE INDEX idx_domain_name ON domain(domain);
CREATE INDEX idx_domain_openalex_id ON domain(openalex_id);
CREATE INDEX idx_domain_wikidata_id ON domain(wikidata_id);

-- domain_alternative_name表索引
CREATE INDEX idx_domain_alt_name ON domain_alternative_name(alternative_name);

-- domain_field表索引
CREATE INDEX idx_domain_field_field_id ON domain_field(field_id);

-- domain_sibling表索引
CREATE INDEX idx_domain_sibling_sibling_id ON domain_sibling(sibling_domain_id);

-- field表索引
CREATE INDEX idx_field_name ON field(field);
CREATE INDEX idx_field_domain_id ON field(domain_id);
CREATE INDEX idx_field_openalex_id ON field(openalex_id);
CREATE INDEX idx_field_wikidata_id ON field(wikidata_id);

-- field_alternative_name表索引
CREATE INDEX idx_field_alt_name ON field_alternative_name(alternative_name);

-- field_sibling表索引
CREATE INDEX idx_field_sibling_sibling_id ON field_sibling(sibling_field_id);

-- field_subfield表索引
CREATE INDEX idx_field_subfield_subfield_id ON field_subfield(subfield_id);

-- fulltext_origin表索引
CREATE INDEX idx_fulltext_origin_name ON fulltext_origin(fulltext_origin);

-- funder表索引
CREATE INDEX idx_funder_name ON funder(funder);
CREATE INDEX idx_funder_country_code ON funder(country_iso_alpha2_code);
CREATE INDEX idx_funder_ror_id ON funder(ror_id);
CREATE INDEX idx_funder_openalex_id ON funder(openalex_id);
CREATE INDEX idx_funder_wikidata_id ON funder(wikidata_id);

-- funder_alternative_name表索引
CREATE INDEX idx_funder_alt_name ON funder_alternative_name(alternative_name);

-- funder_publisher表索引
CREATE INDEX idx_funder_publisher_publisher_id ON funder_publisher(publisher_id);

-- institution表索引
CREATE INDEX idx_institution_name ON institution(institution);
CREATE INDEX idx_institution_type_id ON institution(institution_type_id);
CREATE INDEX idx_institution_country_code ON institution(country_iso_alpha2_code);
CREATE INDEX idx_institution_region_id ON institution(region_id);
CREATE INDEX idx_institution_city_id ON institution(geonames_city_id);
CREATE INDEX idx_institution_ror_id ON institution(ror_id);
CREATE INDEX idx_institution_grid_id ON institution(grid_id);
CREATE INDEX idx_institution_openalex_id ON institution(openalex_id);
CREATE INDEX idx_institution_wikidata_id ON institution(wikidata_id);

-- institution_acronym表索引
CREATE INDEX idx_institution_acronym_name ON institution_acronym(acronym);

-- institution_alternative_name表索引
CREATE INDEX idx_institution_alt_name ON institution_alternative_name(alternative_name);

-- institution_associated表索引
CREATE INDEX idx_inst_associated_assoc_id ON institution_associated(associated_institution_id);
CREATE INDEX idx_inst_associated_rel_type_id ON institution_associated(institution_relationship_type_id);

-- institution_funder表索引
CREATE INDEX idx_institution_funder_funder_id ON institution_funder(funder_id);

-- institution_international_name表索引
CREATE INDEX idx_inst_intl_name_lang ON institution_international_name(language_code);
CREATE INDEX idx_inst_intl_name_name ON institution_international_name(institution_international_name);

-- institution_lineage表索引
CREATE INDEX idx_inst_lineage_lineage_id ON institution_lineage(lineage_institution_id);

-- institution_publisher表索引
CREATE INDEX idx_institution_publisher_pub_id ON institution_publisher(publisher_id);

-- institution_relationship_type表索引
CREATE INDEX idx_inst_rel_type_name ON institution_relationship_type(institution_relationship_type);

-- institution_repository表索引
CREATE INDEX idx_institution_repo_source_id ON institution_repository(repository_source_id);

-- institution_type表索引
CREATE INDEX idx_institution_type_name ON institution_type(institution_type);

-- keyword表索引
CREATE INDEX idx_keyword_name ON keyword(keyword);

-- license表索引
CREATE INDEX idx_license_name ON license(license);

-- mesh_descriptor表索引
CREATE INDEX idx_mesh_descriptor_name ON mesh_descriptor(mesh_descriptor);

-- mesh_qualifier表索引
CREATE INDEX idx_mesh_qualifier_name ON mesh_qualifier(mesh_qualifier);

-- oa_status表索引
CREATE INDEX idx_oa_status_name ON oa_status(oa_status);

-- publisher表索引
CREATE INDEX idx_publisher_name ON publisher(publisher);
CREATE INDEX idx_publisher_parent_id ON publisher(parent_publisher_id);
CREATE INDEX idx_publisher_ror_id ON publisher(ror_id);
CREATE INDEX idx_publisher_openalex_id ON publisher(openalex_id);
CREATE INDEX idx_publisher_wikidata_id ON publisher(wikidata_id);

-- publisher_alternative_name表索引
CREATE INDEX idx_publisher_alt_name ON publisher_alternative_name(alternative_name);

-- publisher_country表索引
CREATE INDEX idx_publisher_country_code ON publisher_country(country_iso_alpha2_code);

-- raw_affiliation_string表索引
CREATE INDEX idx_raw_affil_string ON raw_affiliation_string(raw_affiliation_string);

-- raw_author_name表索引
CREATE INDEX idx_raw_author_name ON raw_author_name(raw_author_name);

-- region表索引
CREATE INDEX idx_region_name ON region(region);

-- source表索引
CREATE INDEX idx_source_name ON source(source);
CREATE INDEX idx_source_abbreviation ON source(abbreviation);
CREATE INDEX idx_source_type_id ON source(source_type_id);
CREATE INDEX idx_source_country_code ON source(country_iso_alpha2_code);
CREATE INDEX idx_source_host_pub_id ON source(host_organization_publisher_id);
CREATE INDEX idx_source_host_inst_id ON source(host_organization_institution_id);
CREATE INDEX idx_source_issn_l ON source(issn_l);
CREATE INDEX idx_source_openalex_id ON source(openalex_id);
CREATE INDEX idx_source_wikidata_id ON source(wikidata_id);
CREATE INDEX idx_source_is_oa ON source(is_oa);

-- source_alternative_title表索引
CREATE INDEX idx_source_alt_title ON source_alternative_title(alternative_title);

-- source_apc_price表索引
CREATE INDEX idx_source_apc_price ON source_apc_price(apc_price);
CREATE INDEX idx_source_apc_currency ON source_apc_price(currency);

-- source_issn表索引
CREATE INDEX idx_source_issn ON source_issn(issn);

-- source_society表索引
CREATE INDEX idx_source_society_name ON source_society(society);

-- source_type表索引
CREATE INDEX idx_source_type_name ON source_type(source_type);

-- subfield表索引
CREATE INDEX idx_subfield_name ON subfield(subfield);
CREATE INDEX idx_subfield_domain_id ON subfield(domain_id);
CREATE INDEX idx_subfield_field_id ON subfield(field_id);
CREATE INDEX idx_subfield_openalex_id ON subfield(openalex_id);
CREATE INDEX idx_subfield_wikidata_id ON subfield(wikidata_id);

-- subfield_alternative_name表索引
CREATE INDEX idx_subfield_alt_name ON subfield_alternative_name(alternative_name);

-- subfield_sibling表索引
CREATE INDEX idx_subfield_sibling_sibling_id ON subfield_sibling(sibling_subfield_id);

-- subfield_topic表索引
CREATE INDEX idx_subfield_topic_topic_id ON subfield_topic(topic_id);

-- sustainable_development_goal表索引
CREATE INDEX idx_sdg_name ON sustainable_development_goal(sustainable_development_goal);

-- topic表索引
CREATE INDEX idx_topic_name ON topic(topic);
CREATE INDEX idx_topic_domain_id ON topic(domain_id);
CREATE INDEX idx_topic_field_id ON topic(field_id);
CREATE INDEX idx_topic_subfield_id ON topic(subfield_id);
CREATE INDEX idx_topic_openalex_id ON topic(openalex_id);

-- topic_keyword表索引
CREATE INDEX idx_topic_keyword_keyword ON topic_keyword(keyword);

-- topic_sibling表索引
CREATE INDEX idx_topic_sibling_sibling_id ON topic_sibling(sibling_topic_id);

-- version表索引
CREATE INDEX idx_version_name ON version(version);

-- work表索引
CREATE INDEX idx_work_type_id ON work(work_type_id);
CREATE INDEX idx_work_pub_date ON work(pub_date);
CREATE INDEX idx_work_pub_year ON work(pub_year);
CREATE INDEX idx_work_doi_reg_agency_id ON work(doi_registration_agency_id);
CREATE INDEX idx_work_doi ON work(doi);
CREATE INDEX idx_work_openalex_id ON work(openalex_id);
CREATE INDEX idx_work_pmid ON work(pmid);
CREATE INDEX idx_work_language_code ON work(language_iso2_code);
CREATE INDEX idx_work_is_oa ON work(is_oa);
CREATE INDEX idx_work_oa_status_id ON work(oa_status_id);
CREATE INDEX idx_work_fulltext_origin_id ON work(fulltext_origin_id);
CREATE INDEX idx_work_source_id ON work(source_id);

-- work_abstract表索引
-- CREATE INDEX idx_work_abstract_text ON work_abstract(abstract) USING gin;

-- work_affiliation表索引
CREATE INDEX idx_work_affil_raw_string_id ON work_affiliation(raw_affiliation_string_id);

-- work_affiliation_institution表索引
CREATE INDEX idx_work_affil_inst_inst_id ON work_affiliation_institution(institution_id);

-- work_author表索引
CREATE INDEX idx_work_author_author_id ON work_author(author_id);
CREATE INDEX idx_work_author_position_id ON work_author(author_position_id);
CREATE INDEX idx_work_author_is_corresponding ON work_author(is_corresponding_author);
CREATE INDEX idx_work_author_raw_name_id ON work_author(raw_author_name_id);

-- work_author_affiliation表索引
-- 复合索引，基于work_id, author_seq, affiliation_seq的联合主键，无需额外索引

-- work_author_country表索引
CREATE INDEX idx_work_author_country_code ON work_author_country(country_iso_alpha2_code);

-- work_concept表索引
CREATE INDEX idx_work_concept_concept_id ON work_concept(concept_id);
CREATE INDEX idx_work_concept_score ON work_concept(score);

-- work_data_source表索引
CREATE INDEX idx_work_data_source_ds_id ON work_data_source(data_source_id);

-- work_detail表索引
CREATE INDEX idx_work_detail_title ON work_detail(title);
CREATE INDEX idx_work_detail_pub_year ON work_detail(pub_year);
CREATE INDEX idx_work_detail_doi ON work_detail(doi);
CREATE INDEX idx_work_detail_pmid ON work_detail(pmid);
CREATE INDEX idx_work_detail_n_cits ON work_detail(n_cits);

-- work_grant表索引
CREATE INDEX idx_work_grant_funder_id ON work_grant(funder_id);

-- work_keyword表索引
CREATE INDEX idx_work_keyword_keyword_id ON work_keyword(keyword_id);
CREATE INDEX idx_work_keyword_score ON work_keyword(score);

-- work_location表索引
CREATE INDEX idx_work_location_source_id ON work_location(source_id);
CREATE INDEX idx_work_location_is_primary ON work_location(is_primary_location);
CREATE INDEX idx_work_location_is_best_oa ON work_location(is_best_oa_location);
CREATE INDEX idx_work_location_version_id ON work_location(version_id);
CREATE INDEX idx_work_location_license_id ON work_location(license_id);
CREATE INDEX idx_work_location_is_oa ON work_location(is_oa);

-- work_mesh表索引
CREATE INDEX idx_work_mesh_descriptor_ui ON work_mesh(mesh_descriptor_ui);
CREATE INDEX idx_work_mesh_qualifier_ui ON work_mesh(mesh_qualifier_ui);
CREATE INDEX idx_work_mesh_is_major_topic ON work_mesh(is_major_topic);

-- work_reference表索引
CREATE INDEX idx_work_reference_cited_id ON work_reference(cited_work_id);

-- work_related表索引
CREATE INDEX idx_work_related_related_id ON work_related(related_work_id);

-- work_sustainable_development_goal表索引
CREATE INDEX idx_work_sdg_id ON work_sustainable_development_goal(sustainable_development_goal_id);
CREATE INDEX idx_work_sdg_score ON work_sustainable_development_goal(score);

-- work_title表索引
-- CREATE INDEX idx_work_title_text ON work_title(title) USING gin;

-- work_topic表索引
CREATE INDEX idx_work_topic_topic_id ON work_topic(topic_id);
CREATE INDEX idx_work_topic_score ON work_topic(score);
CREATE INDEX idx_work_topic_is_primary ON work_topic(is_primary_topic);

-- work_type表索引
CREATE INDEX idx_work_type_name ON work_type(work_type);
