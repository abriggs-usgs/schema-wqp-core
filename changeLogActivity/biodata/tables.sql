--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-activity_swap_biodata
create table activity_swap_biodata
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,activity                       varchar2(4000 char)
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(4000 char)
,governmental_unit_code         varchar2(4000 char)
,organization_name              varchar2(4000 char)
,activity_id                    number
,activity_type_code             varchar2(4000 char)
,activity_media_subdiv_name     varchar2(4000 char)
,activity_start_time            varchar2(4000 char)
,act_start_time_zone            varchar2(4000 char)
,activity_stop_date             varchar2(4000 char)
,activity_stop_time             varchar2(4000 char)
,act_stop_time_zone             varchar2(4000 char)
,activity_relative_depth_name   varchar2(4000 char)
,activity_depth                 varchar2(4000 char)
,activity_depth_unit            varchar2(4000 char)
,activity_depth_ref_point       varchar2(4000 char)
,activity_upper_depth           varchar2(4000 char)
,activity_upper_depth_unit      varchar2(4000 char)
,activity_lower_depth           varchar2(4000 char)
,activity_lower_depth_unit      varchar2(4000 char)
,project_id                     varchar2(4000 char)
,activity_conducting_org        varchar2(4000 char)
,activity_comment               varchar2(4000 char)
,sample_aqfr_name               varchar2(4000 char)
,hydrologic_condition_name      varchar2(4000 char)
,hydrologic_event_name          varchar2(4000 char)
,activity_latitude              number
,activity_longitude             number
,activity_source_map_scale      number
,act_horizontal_accuracy        varchar2(4000 char)
,act_horizontal_accuracy_unit   varchar2(4000 char)
,act_horizontal_collect_method  varchar2(4000 char)
,act_horizontal_datum_name      varchar2(4000 char)
,assemblage_sampled_name        varchar2(4000 char)
,act_collection_duration        varchar2(4000 char)
,act_collection_duration_unit   varchar2(4000 char)
,act_sam_compnt_name            varchar2(4000 char)
,act_sam_compnt_place_in_series number
,act_reach_length               varchar2(4000 char)
,act_reach_length_unit          varchar2(4000 char)
,act_reach_width                varchar2(4000 char)
,act_reach_width_unit           varchar2(4000 char)
,act_pass_count                 number
,net_type_name                  varchar2(4000 char)
,act_net_surface_area           varchar2(4000 char)
,act_net_surface_area_unit      varchar2(4000 char)
,act_net_mesh_size              varchar2(4000 char)
,act_net_mesh_size_unit         varchar2(4000 char)
,act_boat_speed                 varchar2(4000 char)
,act_boat_speed_unit            varchar2(4000 char)
,act_current_speed              varchar2(4000 char)
,act_current_speed_unit         varchar2(4000 char)
,toxicity_test_type_name        varchar2(4000 char)
,sample_collect_method_id       varchar2(4000 char)
,sample_collect_method_ctx      varchar2(4000 char)
,sample_collect_method_name     varchar2(4000 char)
,act_sam_collect_meth_qual_type varchar2(4000 char)
,act_sam_collect_meth_desc      varchar2(4000 char)
,sample_collect_equip_name      varchar2(4000 char)
,act_sam_collect_equip_comments varchar2(4000 char)
,act_sam_prep_meth_id           varchar2(4000 char)
,act_sam_prep_meth_context      varchar2(4000 char)
,act_sam_prep_meth_name         varchar2(4000 char)
,act_sam_prep_meth_qual_type    varchar2(4000 char)
,act_sam_prep_meth_desc         varchar2(4000 char)
,sample_container_type          varchar2(4000 char)
,sample_container_color         varchar2(4000 char)
,act_sam_chemical_preservative  varchar2(4000 char)
,thermal_preservative_name      varchar2(4000 char)
,act_sam_transport_storage_desc varchar2(4000 char)
,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (event_date)
(partition activity_biodata_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
 partition activity_biodata_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
 partition activity_biodata_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
 partition activity_biodata_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
 partition activity_biodata_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
 partition activity_biodata_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
 partition activity_biodata_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
 partition activity_biodata_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
 partition activity_biodata_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
 partition activity_biodata_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
 partition activity_biodata_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
 partition activity_biodata_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
 partition activity_biodata_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
 partition activity_biodata_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
 partition activity_biodata_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
 partition activity_biodata_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
 partition activity_biodata_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
 partition activity_biodata_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
 partition activity_biodata_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
 partition activity_biodata_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
 partition activity_biodata_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
 partition activity_biodata_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
 partition activity_biodata_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
 partition activity_biodata_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
 partition activity_biodata_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
 partition activity_biodata_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
 partition activity_biodata_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
 partition activity_biodata_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
 partition activity_biodata_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
 partition activity_biodata_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
 partition activity_biodata_y_maxx values less than (maxvalue) tablespace result2
);
--rollback drop table activity_swap_biodata cascade constraints purge;

--changeset drsteini:WQP-913-create-act_metric_swap_biodata
create table act_metric_swap_biodata
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,activity                       varchar2(4000 char)
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(4000 char)
,governmental_unit_code         varchar2(4000 char)
,organization_name              varchar2(4000 char)
,activity_id                    number
,type_identifier                varchar2(4000 char)
,identifier_context             varchar2(4000 char)
,type_name                      varchar2(4000 char)
,resource_title                 varchar2(4000 char)
,resource_creator               varchar2(4000 char)
,resource_subject               varchar2(4000 char)
,resource_publisher             varchar2(4000 char)
,resource_date                  varchar2(4000 char)
,resource_identifier            varchar2(4000 char)
,type_scale                     varchar2(4000 char)
,formula_description            varchar2(4000 char)
,measure_value                  varchar2(4000 char)
,unit_code                      varchar2(4000 char)
,score                          varchar2(4000 char)
,comment_text                   varchar2(4000 char)
,index_identifier               varchar2(4000 char)
,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (event_date)
(partition act_metric_biodata_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_biodata_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_biodata_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_biodata_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_biodata_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_biodata_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_biodata_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_biodata_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_biodata_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_biodata_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_biodata_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_biodata_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_biodata_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_biodata_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_biodata_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_biodata_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_biodata_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_biodata_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_biodata_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_biodata_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_biodata_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_biodata_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_biodata_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_biodata_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_biodata_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_biodata_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_biodata_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_biodata_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_biodata_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_biodata_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_biodata_y_maxx values less than (maxvalue) tablespace result2
);
--rollback drop table act_metric_swap_biodata cascade constraints purge;

--changeset drsteini:WQP-932-create-activity_sum_swap_biodata
create table activity_sum_swap_biodata
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(12 char)
,governmental_unit_code         varchar2(9 char)
,activity_id                    number
,project_id                     varchar2(4000 char)
,act_metric_count               number
,result_count                   number
,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (event_date)
(partition act_sum_biodata_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
 partition act_sum_biodata_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
 partition act_sum_biodata_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
 partition act_sum_biodata_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
 partition act_sum_biodata_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
 partition act_sum_biodata_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
 partition act_sum_biodata_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
 partition act_sum_biodata_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
 partition act_sum_biodata_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
 partition act_sum_biodata_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
 partition act_sum_biodata_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
 partition act_sum_biodata_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
 partition act_sum_biodata_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
 partition act_sum_biodata_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
 partition act_sum_biodata_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
 partition act_sum_biodata_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
 partition act_sum_biodata_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
 partition act_sum_biodata_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
 partition act_sum_biodata_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
 partition act_sum_biodata_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
 partition act_sum_biodata_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
 partition act_sum_biodata_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
 partition act_sum_biodata_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
 partition act_sum_biodata_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
 partition act_sum_biodata_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
 partition act_sum_biodata_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
 partition act_sum_biodata_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
 partition act_sum_biodata_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
 partition act_sum_biodata_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
 partition act_sum_biodata_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
 partition act_sum_biodata_y_maxx values less than (maxvalue) tablespace result2
);
--rollback drop table activity_sum_swap_biodata cascade constraints purge;

--changeset drsteini:WQP-913-drop-biodata_activity
drop table biodata_activity cascade constraints purge;
--rollback create table biodata_activity
--rollback (dw_effort_id                   number
--rollback ,station_id                     number
--rollback ,site_id                        varchar2(4000 char)
--rollback ,event_date                     date
--rollback ,analytical_method                varchar2(4000 char)
--rollback ,activity                       varchar2(4000 char)
--rollback ,sample_media                   varchar2(4000 char)
--rollback ,organization                   varchar2(4000 char)
--rollback ,site_type                      varchar2(4000 char)
--rollback ,huc                            varchar2(4000 char)
--rollback ,governmental_unit_code         varchar2(4000 char)
--rollback ,organization_name              varchar2(4000 char)
--rollback ,activity_type_code             varchar2(4000 char)
--rollback ,activity_media_subdiv_name     varchar2(4000 char)
--rollback ,activity_start_time            varchar2(4000 char)
--rollback ,act_start_time_zone            varchar2(4000 char)
--rollback ,activity_stop_date             varchar2(4000 char)
--rollback ,activity_stop_time             varchar2(4000 char)
--rollback ,act_stop_time_zone             varchar2(4000 char)
--rollback ,activity_relative_depth_name   varchar2(4000 char)
--rollback ,activity_depth                 varchar2(4000 char)
--rollback ,activity_depth_unit            varchar2(4000 char)
--rollback ,activity_depth_ref_point       varchar2(4000 char)
--rollback ,activity_upper_depth           varchar2(4000 char)
--rollback ,activity_upper_depth_unit      varchar2(4000 char)
--rollback ,activity_lower_depth           varchar2(4000 char)
--rollback ,activity_lower_depth_unit      varchar2(4000 char)
--rollback ,project_id                     varchar2(4000 char)
--rollback ,activity_conducting_org        varchar2(4000 char)
--rollback ,activity_comment               varchar2(4000 char)
--rollback ,activity_latitude              number
--rollback ,activity_longitude             number
--rollback ,activity_source_map_scale      number
--rollback ,act_horizontal_accuracy        varchar2(4000 char)
--rollback ,act_horizontal_accuracy_unit   varchar2(4000 char)
--rollback ,act_horizontal_collect_method  varchar2(4000 char)
--rollback ,act_horizontal_datum_name      varchar2(4000 char)
--rollback ,assemblage_sampled_name        varchar2(4000 char)
--rollback ,act_collection_duration        varchar2(4000 char)
--rollback ,act_collection_duration_unit   varchar2(4000 char)
--rollback ,act_sam_compnt_name            varchar2(4000 char)
--rollback ,act_sam_compnt_place_in_series number
--rollback ,act_reach_length               varchar2(4000 char)
--rollback ,act_reach_length_unit          varchar2(4000 char)
--rollback ,act_reach_width                varchar2(4000 char)
--rollback ,act_reach_width_unit           varchar2(4000 char)
--rollback ,act_pass_count                 number
--rollback ,net_type_name                  varchar2(4000 char)
--rollback ,act_net_surface_area           varchar2(4000 char)
--rollback ,act_net_surface_area_unit      varchar2(4000 char)
--rollback ,act_net_mesh_size              varchar2(4000 char)
--rollback ,act_net_mesh_size_unit         varchar2(4000 char)
--rollback ,act_boat_speed                 varchar2(4000 char)
--rollback ,act_boat_speed_unit            varchar2(4000 char)
--rollback ,act_current_speed              varchar2(4000 char)
--rollback ,act_current_speed_unit         varchar2(4000 char)
--rollback ,toxicity_test_type_name        varchar2(4000 char)
--rollback ,sample_collect_method_id       varchar2(4000 char)
--rollback ,sample_collect_method_ctx      varchar2(4000 char)
--rollback ,sample_collect_method_name     varchar2(4000 char)
--rollback ,act_sam_collect_meth_qual_type varchar2(4000 char)
--rollback ,act_sam_collect_meth_desc      varchar2(4000 char)
--rollback ,sample_collect_equip_name      varchar2(4000 char)
--rollback ,act_sam_collect_equip_comments varchar2(4000 char)
--rollback ,act_sam_prep_meth_id           varchar2(4000 char)
--rollback ,act_sam_prep_meth_context      varchar2(4000 char)
--rollback ,act_sam_prep_meth_name         varchar2(4000 char)
--rollback ,act_sam_prep_meth_qual_type    varchar2(4000 char)
--rollback ,act_sam_prep_meth_desc         varchar2(4000 char)
--rollback ,sample_container_type          varchar2(4000 char)
--rollback ,sample_container_color         varchar2(4000 char)
--rollback ,act_sam_chemical_preservative  varchar2(4000 char)
--rollback ,thermal_preservative_name      varchar2(4000 char)
--rollback ,act_sam_transport_storage_desc varchar2(4000 char)
--rollback ) parallel 4 compress pctfree 0 nologging cache;

--changeset drsteini:WQP-932-alter-result_swap_biodata-activity_id
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_tab_columns where table_name = 'RESULT_SWAP_BIODATA' and column_name = 'ACTIVITY_ID'
alter table result_swap_biodata add activity_id number;
--rollback select 'cannot rollback add on compressed table need manually drop table and re-create using changeset changeLog1/biodata/tables/drsteini:1BiodataTablesAB manually' from dual;

--changeset drsteini:WQP-932-drop-result_ct_sum_swap_biodata
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:1 select count(*) from user_tables where table_name = 'RESULT_CT_SUM_SWAP_BIODATA'
drop table result_ct_sum_swap_biodata cascade constraints purge;
--rollback create table result_ct_sum_swap_biodata
--rollback (data_source_id                 number
--rollback ,data_source                    varchar2(8 char)
--rollback ,station_id                     number
--rollback ,site_id                        varchar2(4000 char)
--rollback ,analytical_method              varchar2(4000 char)
--rollback ,p_code                         varchar2(4000 char)
--rollback ,characteristic_name            varchar2(4000 char)
--rollback ,characteristic_type            varchar2(4000 char)
--rollback ,sample_media                   varchar2(4000 char)
--rollback ,organization                   varchar2(4000 char)
--rollback ,site_type                      varchar2(4000 char)
--rollback ,huc                            varchar2(12 char)
--rollback ,governmental_unit_code         varchar2(9 char)
--rollback ,project_id                     varchar2(4000 char)
--rollback ,assemblage_sampled_name        varchar2(4000 char)
--rollback ,result_count                   number
--rollback ,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
--rollback ,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
--rollback ,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
--rollback ,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
--rollback ,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
--rollback ,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
--rollback ,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
--rollback ,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
--rollback ,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
--rollback ,sample_tissue_taxonomic_name   varchar2(4000 char)
--rollback ,constraint rcts_station_fk_biodata
--rollback    foreign key (data_source_id, station_id)
--rollback      references station_sum_swap_biodata (data_source_id, station_id)
--rollback        rely enable novalidate
--rollback ) parallel 4 compress pctfree 0 nologging cache
--rollback partition by list (characteristic_type)
--rollback     (partition rcts_biodata_biol values ('Biological'),
--rollback      partition rcts_biodata_info values ('Information'),
--rollback      partition rcts_biodata_inorg1 values ('Inorganics, Major, Metals'),
--rollback      partition rcts_biodata_inorg2 values ('Inorganics, Major, Non-metals'),
--rollback      partition rcts_biodata_inorg3 values ('Inorganics, Minor, Metals'),
--rollback      partition rcts_biodata_inorg4 values ('Inorganics, Minor, Non-metals'),
--rollback      partition rcts_biodata_micro values ('Microbiological'),
--rollback      partition rcts_biodata_na values ('Not Assigned'),
--rollback      partition rcts_biodata_nut values ('Nutrient'),
--rollback      partition rcts_biodata_org1 values ('Organics, Other'),
--rollback      partition rcts_biodata_org2 values ('Organics, PCBs'),
--rollback      partition rcts_biodata_org3 values ('Organics, Pesticide'),
--rollback      partition rcts_biodata_phys values ('Physical'),
--rollback      partition rcts_biodata_pop values ('Population/Community'),
--rollback      partition rcts_biodata_radio values ('Radiochemical'),
--rollback      partition rcts_biodata_sed values ('Sediment'),
--rollback      partition rcts_biodata_iso values ('Stable Isotopes'),
--rollback      partition rcts_biodata_tox values ('Toxicity'),
--rollback      partition rcts_biodata_def values (default)
--rollback );
--rollback create bitmap index rcts_biodata_analytical on result_ct_sum_swap_biodata(analytical_method) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_assemblage on result_ct_sum_swap_biodata(assemblage_sampled_name) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_char_name on result_ct_sum_swap_biodata(characteristic_name) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_char_type on result_ct_sum_swap_biodata(characteristic_type) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_country on result_ct_sum_swap_biodata(country_code) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_county on result_ct_sum_swap_biodata(county_code) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_huc10 on result_ct_sum_swap_biodata(huc_10) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_huc12 on result_ct_sum_swap_biodata(huc_12) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_huc2 on result_ct_sum_swap_biodata(huc_2) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_huc4 on result_ct_sum_swap_biodata(huc_4) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_huc6 on result_ct_sum_swap_biodata(huc_6) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_huc8 on result_ct_sum_swap_biodata(huc_8) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_organization on result_ct_sum_swap_biodata(organization) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_project on result_ct_sum_swap_biodata(project_id) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_p_code on result_ct_sum_swap_biodata(p_code) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_sample_media on result_ct_sum_swap_biodata(sample_media) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_site on result_ct_sum_swap_biodata(site_id) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_site_type on result_ct_sum_swap_biodata(site_type) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_state on result_ct_sum_swap_biodata(state_code) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_station on result_ct_sum_swap_biodata(station_id) local parallel 4 nologging;
--rollback create bitmap index rcts_biodata_taxa_name on result_ct_sum_swap_biodata(sample_tissue_taxonomic_name) local parallel 4 nologging;

--changeset drsteini:WQP-932-drop-result_nr_sum_swap_biodata
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:1 select count(*) from user_tables where table_name = 'RESULT_NR_SUM_SWAP_BIODATA'
drop table result_nr_sum_swap_biodata cascade constraints purge;
--rollback create table result_nr_sum_swap_biodata
--rollback (data_source_id                 number
--rollback ,data_source                    varchar2(8 char)
--rollback ,station_id                     number
--rollback ,event_date                     date
--rollback ,analytical_method              varchar2(4000 char)
--rollback ,p_code                         varchar2(4000 char)
--rollback ,characteristic_name            varchar2(4000 char)
--rollback ,characteristic_type            varchar2(4000 char)
--rollback ,sample_media                   varchar2(4000 char)
--rollback ,project_id                     varchar2(4000 char)
--rollback ,assemblage_sampled_name        varchar2(4000 char)
--rollback ,result_count                   number
--rollback ,sample_tissue_taxonomic_name   varchar2(4000 char)
--rollback ,constraint rnrs_station_fk_biodata
--rollback    foreign key (data_source_id, station_id)
--rollback      references station_sum_swap_biodata (data_source_id, station_id)
--rollback        rely enable novalidate
--rollback ) parallel 4 compress pctfree 0 nologging cache
--rollback partition by range (event_date)
--rollback     (partition res_nr_sum_biodata_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')),
--rollback      partition res_nr_sum_biodata_y_maxx values less than (maxvalue)
--rollback     );
--rollback create bitmap index rnrs_biodata_analytical on result_nr_sum_swap_biodata(analytical_method) local parallel 4 nologging;
--rollback create bitmap index rnrs_biodata_assemblage on result_nr_sum_swap_biodata(assemblage_sampled_name) local parallel 4 nologging;
--rollback create bitmap index rnrs_biodata_char_name on result_nr_sum_swap_biodata(characteristic_name) local parallel 4 nologging;
--rollback create bitmap index rnrs_biodata_char_type on result_nr_sum_swap_biodata(characteristic_type) local parallel 4 nologging;
--rollback create bitmap index rnrs_biodata_project on result_nr_sum_swap_biodata(project_id) local parallel 4 nologging;
--rollback create bitmap index rnrs_biodata_p_code on result_nr_sum_swap_biodata(p_code) local parallel 4 nologging;
--rollback create bitmap index rnrs_biodata_sample_media on result_nr_sum_swap_biodata(sample_media) local parallel 4 nologging;
--rollback create bitmap index rnrs_biodata_station on result_nr_sum_swap_biodata(station_id) local parallel 4 nologging;
--rollback create bitmap index rnrs_biodata_taxa_name on result_nr_sum_swap_biodata(sample_tissue_taxonomic_name) local parallel 4 nologging;

--changeset drsteini:WQP-932-alter-result_sum_swap_biodata-activity_id
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_tab_columns where table_name = 'RESULT_SUM_SWAP_BIODATA' and column_name = 'ACTIVITY_ID'
alter table result_sum_swap_biodata add activity_id number;
--rollback select 'cannot rollback add on compressed table need manually drop table and re-create using changeset changeLog1/biodata/tables/drsteini:1BiodataTablesAD and 1BiodataTablesAW manually' from dual;

--changeset drsteini:WQP-932-alter-station_sum_swap_biodata-activity_count
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_tab_columns where table_name = 'STATION_SUM_SWAP_BIODATA' and column_name = 'ACTIVITY_COUNT'
alter table station_sum_swap_biodata add activity_count number;
--rollback select 'cannot rollback add on compressed table need manually drop table and re-create using changeset changeLog1/biodata/tables/drsteini:1BiodataTablesAC manually' from dual;

--changeset drsteini:alter-result_swap_biodata-split-2017-2018
alter table result_swap_biodata split partition result_biodata_y_maxx into 
(partition result_biodata_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2
,partition result_biodata_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3
,partition result_biodata_y_maxx);
--rollback alter table result_swap_biodata merge partitions result_biodata_y_2017, result_biodata_y_2018, result_biodata_y_maxx into partition result_biodata_y_maxx;

--changeset drsteini:alter-result_sum_swap_biodata-split-2017-2018
alter table result_sum_swap_biodata split partition result_sum_biodata_y_maxx into 
(partition result_sum_biodata_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2
,partition result_sum_biodata_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3
,partition result_sum_biodata_y_maxx);
--rollback alter table result_sum_swap_biodata merge partitions result_sum_biodata_y_2017, result_sum_biodata_y_2018, result_sum_biodata_y_maxx into partition result_sum_biodata_y_maxx;

--changeset drsteini:WQP-1033.create.r_detect_qnt_lmt_swap_biodata
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_tables where table_name = 'r_detect_qnt_lmt_SWAP_BIODATA';
create table r_detect_qnt_lmt_swap_biodata
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,activity                       varchar2(4000 char)
,analytical_method              varchar2(4000 char)
,p_code                         varchar2(4000 char)
,characteristic_name            varchar2(4000 char)
,characteristic_type            varchar2(4000 char)
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(12 char)
,governmental_unit_code         varchar2(9 char)
,project_id                     varchar2(4000 char)
,assemblage_sampled_name        varchar2(4000 char)
,sample_tissue_taxonomic_name   varchar2(4000 char)
,activity_id                    number
,result_id                      number
,organization_name              varchar2(4000 char)
,detection_limit_id             number
,detection_limit                varchar2(4000 char)
,detection_limit_unit           varchar2(4000 char)
,detection_limit_desc           varchar2(4000 char)
,huc_2                          varchar2(2 char) generated always as (case  when length(huc)>1 then substr(huc,1,2) else null end)
,huc_4                          varchar2(4 char) generated always as (case  when length(huc)>3 then substr(huc,1,4) else null end)
,huc_6                          varchar2(6 char) generated always as (case  when length(huc)>5 then substr(huc,1,6) else null end)
,huc_8                          varchar2(8 char) generated always as (case  when length(huc)>7 then substr(huc,1,8) else null end)
,huc_10                         varchar2(10 char) generated always as (case  when length(huc)>9 then substr(huc,1,10) else null end)
,huc_12                         varchar2(12 char) generated always as (case length(huc) when 12 then substr(huc,1,12) else null end)
,country_code                   varchar2(9 char) generated always as (regexp_substr (governmental_unit_code,'[^:]+'))
,state_code                     varchar2(9 char) generated always as (regexp_substr (governmental_unit_code,'[^:]+:[^:]+'))
,county_code                    varchar2(9 char) generated always as (regexp_substr (governmental_unit_code,'[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table r_detect_qnt_lmt_swap_biodata cascade constraints purge;
