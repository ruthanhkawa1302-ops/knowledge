CREATE OR REPLACE FUNCTION generate_report(
    p_month date
)
RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
    v_lock_key bigint;
    v_file_name text;
BEGIN


    v_lock_key :=
        hashtext(
            'report_' ||
            to_char(p_month,'YYYY_MM')
        );


    IF NOT pg_try_advisory_lock(v_lock_key)
    THEN
        RETURN 'REPORT_ALREADY_RUNNING';
    END IF;


    BEGIN


        v_file_name :=
            'C:/temp/report_' ||
            to_char(p_month,'YYYY_MM')
            || '.csv';


        PERFORM pg_sleep(60);


        EXECUTE format(
            $copy$
            COPY (
                SELECT
                    id,
                    customer_name,
                    amount,
                    created_at
                FROM reports
                WHERE report_month = %L
            )
            TO %L
            WITH (
                FORMAT CSV,
                HEADER TRUE
            )
            $copy$,
            p_month,
            v_file_name
        );


        PERFORM pg_advisory_unlock(v_lock_key);


        RETURN 'REPORT_WRITTEN_TO: ' || v_file_name;


    EXCEPTION
        WHEN OTHERS THEN


            PERFORM pg_advisory_unlock(v_lock_key);


            RAISE;
    END;


END;
$$;
