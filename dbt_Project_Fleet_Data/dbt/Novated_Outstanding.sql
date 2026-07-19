with 

contract as (

    select * from {{ ref('stg_raw_fleet__contract') }}
    where lower(Contract_Type) = 'novated'

),

invoice as (

    select * from {{ ref('stg_raw_fleet__invoice') }}
    where Outstanding_Amount > 0
),

fleet_vehicle as (

    select * from {{ref('stg_raw_fleet__fleet_vehicle')}}

),

vehicle_usage as (

    select * from {{ ref('stg_raw_fleet__vehicle_usage') }}

),

Final as (

    select 
    c.Contract_ID, 
    c.Contract_Type, 
    coalesce(fv.LicensePlate,'TBD') as License_Plate, 
    i.Invoice_Number, 
    i.Payment_Status,
    i.Due_Date
    from contract c
    inner join invoice i on i.Contract_ID = c.Contract_ID
    left join vehicle_usage vu on vu.Contract_ID = c.Contract_ID
    left join fleet_vehicle fv on fv.VehicleUsage_ID = vu.VehicleUsage_ID

)

select * from Final
