namespace BCJourney.BCJourney;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Receivables;

report 50000 ARD_CustomerActivity
{
    ApplicationArea = All;
    Caption = 'Customer Activity';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Excel;
    ExcelLayout = 'Layouts\TMG_CustomerActivityLayout.xlsx';

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            dataitem(CustomerLedgerEntry; "Cust. Ledger Entry")
            {
                RequestFilterFields = "Posting Date";
                
                dataitemlink = "Customer No." = Field("No.");
                DataItemTableView = sorting("Customer No.", "Posting Date", "Currency Code")
                                      where("Document Type" = FILTER(Invoice | "Credit Memo"));
                                
                column(SalesAmount; "Sales (LCY)")
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
