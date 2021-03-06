create table org_data_swap_stewards
(data_source_id                 number
,data_source                    varchar2(8 char)
,organization_id                number
,organization                   varchar2(4000 char)
,organization_name              varchar2(4000 char)
,organization_description       varchar2(4000 char)
,tribal_code                    varchar2(4000 char)
,electronic_address             varchar2(4000 char)
,telephonic                     varchar2(4000 char)
,address_type_1                 varchar2(4000 char)
,address_text_1                 varchar2(4000 char)
,supplemental_address_text_1    varchar2(4000 char)
,locality_name_1                varchar2(4000 char)
,postal_code_1                  varchar2(10 char)
,country_code_1                 varchar2(2 char)
,state_code_1                   varchar2(2 char)
,county_code_1                  varchar2(3 char)
,address_type_2                 varchar2(4000 char)
,address_text_2                 varchar2(4000 char)
,supplemental_address_text_2    varchar2(4000 char)
,locality_name_2                varchar2(4000 char)
,postal_code_2                  varchar2(10 char)
,country_code_2                 varchar2(2 char)
,state_code_2                   varchar2(2 char)
,county_code_2                  varchar2(3 char)
,address_type_3                 varchar2(4000 char)
,address_text_3                 varchar2(4000 char)
,supplemental_address_text_3    varchar2(4000 char)
,locality_name_3                varchar2(4000 char)
,postal_code_3                  varchar2(10 char)
,country_code_3                 varchar2(2 char)
,state_code_3                   varchar2(2 char)
,county_code_3                  varchar2(3 char)
) parallel 4 compress pctfree 0 nologging cache;
