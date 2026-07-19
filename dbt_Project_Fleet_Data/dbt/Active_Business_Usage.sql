with 

contract as (

    select * from {{ ref('stg_raw_fleet__contract') }}
    where lower(Contract_Type) = 'novated'
    and lower(Contract_Status) = 'active'

),

fleet_vehicle as (

    select * from {{ref('stg_raw_fleet__fleet_vehicle')}}

),

vehicle_usage as (

    select * from {{ ref('stg_raw_fleet__vehicle_usage') }}
    where lower(Usage_Type) = 'business'

),

Final as (

    select 
    c.Contract_ID, 
    c.Contract_Type, 
    coalesce(fv.LicensePlate,'TBD') as License_Plate, 
    Date(vu.Start_Date) as Usage_Start_Date,
    Date(vu.End_Date) as Usage_End_Date,
    vu.Usage_Type,
    cast(vu.Start_ODO as INT64) as Start_ODO,
    cast(vu.Expected_Distance as INT64) as Expected_Disatnce
    from contract c
    inner join vehicle_usage vu on vu.Contract_ID = c.Contract_ID
    left join fleet_vehicle fv on fv.VehicleUsage_ID = vu.VehicleUsage_ID

)

select * from Final
