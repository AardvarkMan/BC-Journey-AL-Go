/*
    Customized in BC AL Journey #13
*/

namespace AardvarkLabs;

using Microsoft.Sales.Customer;

pageextension 50004 ARDCustomerCard extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group(ARDWarrantyClaims)
            {
                Caption = 'Warranty Claims';
                part(ARDCustomerClaims; ARDCustomerClaims)
                {
                    ApplicationArea = All;
                    SubPageLink = "CustomerNo." = field("No.");
                }
            }
        }
    }
}
