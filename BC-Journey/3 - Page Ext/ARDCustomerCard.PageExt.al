/*
    Customized in BC AL Journey #13
*/

namespace AardvarkLabs;

using Microsoft.Sales.Customer;
using BCJourney.BCJourney;

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
    actions
    {
        addafter(Email_Promoted)
        {
            actionref(ARRShowPowerBIProm; ARDShowPowerBI)
            {}
        }
        addbefore("Aged Accounts Receivable")
        {
            action(ARDShowPowerBI)
            {
                Caption = 'Show Power BI';
                ToolTip = 'Displays the Power BI report';
                Image = PowerBI;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ReportPage: Page "ARD_HostControlToPBI";
                begin
                    ReportPage.SetCustomerNo(Rec."No.");
                    ReportPage.RunModal();
                end;
            }
        }
    }
}
