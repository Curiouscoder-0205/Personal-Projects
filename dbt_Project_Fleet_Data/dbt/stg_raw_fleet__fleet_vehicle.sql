with 

source as (

    select * from {{ source('raw_fleet', 'Raw_FleetVehicle') }}

),

fleet_vehicle as (

    select distinct
        id as FleetVehicle_ID,
        licenseplate as LicensePlate,
        vehicleusageid as VehicleUsage_ID,
        vehiclestatus as Vehicle_Status,
        createddate as Created_Date,
        make as Make,
        model as Model,
        year_model as Build_Year,
        vin as VIN,
        fuel_type as Fuel_Type

    from source

)

select * from fleet_vehicle