create or replace package body etl_helper_project as

    procedure drop_indexes(p_table_suffix in user_tables.table_name%type) is
        table_name user_tables.table_name%type;
    begin

        table_name := dbms_assert.sql_object_name(upper('project_data_swap_' || p_table_suffix));
        etl_helper_main.drop_indexes(table_name);

    end drop_indexes;

    procedure create_indexes(p_table_suffix in user_tables.table_name%type) is
        stmt            varchar2(32000);
        table_name      user_tables.table_name%type;
    begin

        dbms_output.put_line('creating project_data indexes...');
        table_name := dbms_assert.sql_object_name(upper('project_data_swap_' || p_table_suffix));

        stmt := 'create bitmap index pdata_' || p_table_suffix || '_identifier on ' || table_name || '(project_identifier) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pdata_' || p_table_suffix || '_organization on ' || table_name || '(organization) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create unique index pdata_' || p_table_suffix || '_pk on ' || table_name || '(data_source_id, project_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

    end create_indexes;

    procedure analyze_tables(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

        suffix := dbms_assert.simple_sql_name(upper(p_table_suffix));

        dbms_output.put_line('analyze project...');
        dbms_stats.gather_table_stats(ownname => '${dataOwner}', tabname => 'PROJECT_DATA_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');

    end analyze_tables;

    function validate_transformation(p_table_suffix in user_tables.table_name%type)
        return boolean is
        end_job boolean := false;
    begin

        end_job := etl_helper_main.validate_table('project_data', 'project_data_', p_table_suffix);

        return end_job;

    end validate_transformation;

    procedure install(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

        suffix := dbms_assert.simple_sql_name(p_table_suffix);

        dbms_output.put_line('project_data');
        execute immediate 'alter table project_data exchange partition project_data_' || suffix ||
                          ' with table project_data_swap_' || suffix || ' including indexes';

    end install;

end etl_helper_project;
