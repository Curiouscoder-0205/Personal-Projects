with 

source as (

    select * from {{ source('raw_fleet', 'Raw_Driver') }}

),

driver as (

    select distinct
        driverid as Driver_Id,
        first_name as First_Name,
        last_name as Last_Name,
        email as Email_Address,
        contactnumber as Contact_Number,
        address as Home_Address,
        license_number as License_Number,
        license_expiry_date as License_Expiry_Date,
        createddate as Created_Date

    from source

)

select * from driver