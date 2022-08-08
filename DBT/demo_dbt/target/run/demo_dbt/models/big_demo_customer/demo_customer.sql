

  create or replace view `staging-bikayi`.`test_dataset`.`demo_customer`
  OPTIONS()
  as with src_customer as (
    select * from `staging-bikayi`.`raw`.`_airbyte_raw_customers`      
)
select
    JSON_VALUE(A._airbyte_data, '$.default_address.zip') as zipcode,
    JSON_VALUE(A._airbyte_data, '$.first_name') AS userName,
    JSON_EXTRACT(A._airbyte_data, '$.phone') AS phoneNum,
    -- PARSE_JSON(`{A._airbyte_data,'$.default_address'}`) as default_address
    -- PARSE_JSON('{"coordinates":[10,20],"id":1}') AS json_data
from src_customer AS A;

