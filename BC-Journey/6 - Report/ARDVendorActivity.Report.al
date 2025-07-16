namespace BCJourney.BCJourney;

using Microsoft.Purchases.Vendor;
using Microsoft.Purchases.Payables;

report 50001 ARD_VendorActivity
{
    ApplicationArea = All;
    Caption = 'Vendor Activity';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    WordLayout = 'Layouts\ARD_VendorActivityLayout.docx';
    dataset
    {
        dataitem(Ard_Vendor; Vendor)
        {
            RequestFilterFields = "No.";
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            dataitem(Ard_VendorLedgerEntry; "Vendor Ledger Entry")
            {
                RequestFilterFields = "Posting Date";

                DataItemLink = "Vendor No." = Field("No.");
                DataItemTableView = sorting("Vendor No.", "Posting Date", "Currency Code")
                                      where("Document Type" = FILTER(Invoice | "Credit Memo"));

                column(PurchaseAmount; "Purchase (LCY)")
                {
                }
                column(PostingDate; "Posting Date")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
