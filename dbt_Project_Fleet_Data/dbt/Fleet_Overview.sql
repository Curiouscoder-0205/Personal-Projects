with 

contract as (

    select * from {{ ref('stg_raw_fleet__contract') }}

),

fleet_vehicle as (

    select * from {{ref('stg_raw_fleet__fleet_vehicle')}}

),

vehicle_usage as (

    select * from {{ ref('stg_raw_fleet__vehicle_usage') }}

),

driver as (

    select * from {{ ref('stg_raw_fleet__driver') }}
),

Final as (

    select 
    c.Contract_ID, 
    c.Contract_Type, 
    c.Contract_Status,
    coalesce(fv.LicensePlate,'TBD') as License_Plate, 
    fv.Make,
    fv.Model,
    fv.Build_Year,
    CONCAT(d.Last_Name, ', ', d.First_Name) as Driver_Identification,
    d.Email_Address as Driver_Email_Address
    from contract c
    left join vehicle_usage vu on vu.Contract_ID = c.Contract_ID
    left join fleet_vehicle fv on fv.VehicleUsage_ID = vu.VehicleUsage_ID
    left join driver d on d.Driver_ID = vu.Driver_ID

)

select * from Final
