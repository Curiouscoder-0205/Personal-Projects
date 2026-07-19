with 

source as (

    select * from {{ source('raw_fleet', 'Raw_Invoice') }}

),

invoice as (

    select distinct
        id as Invoice_ID,
        invoicenumber as Invoice_Number,
        invoicedate as Invoice_Date,
        contractid as Contract_ID,
        round(amountexclgst,2) as Amount_Excl_Gst,
        round(gst,2) as GST,
        round(amountinclgst,2) as Amount_Incl_Gst,
        round(outstandingamount,2) as Outstanding_Amount,
        round((amountinclgst - outstandingamount),2) as Paid_Amount,
        paymentstatus as Payment_Status,
        duedate as Due_Date,
        createddate as Created_Date,

    from source

)

select * from invoice