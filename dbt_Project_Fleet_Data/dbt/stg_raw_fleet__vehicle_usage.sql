with 

source as (

    select * from {{ source('raw_fleet', 'Raw_VehicleUsage') }}

),

vehicle_usage as (

    select distinct
        id as VehicleUsage_Id,
        contractid as Contract_Id,
        start_date as Start_Date,
        end_date as End_Date,
        driverid as Driver_Id,
        createddate as Created_Date,
        usage_type as Usage_Type,
        odometer_start as Start_ODO,
        expected_km as Expected_Distance,

    from source

)

select * from vehicle_usage