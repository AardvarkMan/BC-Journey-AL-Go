/*
    Customized in BC AL Journey #5
    https://aardvarklabs.blog/2024/05/10/updating-sales-and-purchase-documents/

    Customized in BC AL Journey #6
*/
namespace AardvarkLabs;
using Microsoft.Sales.Document;

tableextension 50001 ARDSalesHeader extends "Sales Header"
{
    fields
    {
        /*
        BC AL Journey #5
        */
        field(50000; ARD_WarrantyExpDate; Date)
        {
            Caption = 'Warranty Exp Date';
            ToolTip = 'Warranty Expiration Date';
            DataClassification = CustomerContent;
        }
        /*
        BC AL Journey #7
        */
        field(50001; ARD_WarrantyNo; Integer)
        {
            Caption = 'Warranty';
            ToolTip = 'Selected order warranty';
            DataClassification = CustomerContent;
            TableRelation = ARD_Warranty."ARD_No.";
        }
        Field(50002; ARD_WarrantyName; Text[100])
        {
            Caption = 'Warranty Name';
            ToolTip = 'Name of the selected Warranty';
            FieldClass = FlowField;
            CalcFormula = lookup(ARD_Warranty.ARD_Name WHERE("ARD_No." = field(ARD_WarrantyNo)));
        }
    }
}
