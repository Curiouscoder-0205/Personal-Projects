with 

source as (

    select * from {{ source('raw_fleet', 'Raw_Contract') }}

),

contract as(
    
    select distinct
    ID as Contract_Id,
    contractstatus as Contract_Status,
    contracttype as Contract_Type,
    startdate as Start_Date,
    enddate as End_Date,
    createddate as Created_Date

    from source
)

select * from contract