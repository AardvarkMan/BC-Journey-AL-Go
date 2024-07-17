/*
    Customized in BC AL Journey #5
    https://aardvarklabs.blog/2024/05/10/updating-sales-and-purchase-documents/

    Customized in BC AL Journey #6
*/
namespace AardvarkLabs;
using Microsoft.Sales.History;

pageextension 50003 ARDPostedSalesInvoice extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Document Date")
        {
            /*
            BC AL Journey #5
            */
            field(ARD_WarrantyExpDate; Rec.ARD_WarrantyExpDate)
            {
                ApplicationArea = All;
            }
            /*
            BC AL Journey #7
            */
            field(ARD_WarrantyNo; Rec.ARD_WarrantyNo)
            {
                ApplicationArea = All;
            }
            field(ARD_WarrantyName; Rec.ARD_WarrantyName)
            {
                ApplicationArea = All;
            }
        }
    }
}
