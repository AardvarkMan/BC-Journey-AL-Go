// This code is part of the Business Central Journey project.
// It is designed to create a report for customer activity, including sales amounts and posting dates.
// The report uses an Excel layout for better presentation and analysis.
// For more information, visit the blog post at:
//https://aardvarklabs.blog/2025/07/18/mastering-excel-reporting-in-business-central/

namespace BCJourney.BCJourney;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Receivables;

report 50000 ARD_CustomerActivity
{
    ApplicationArea = All;
    Caption = 'Customer Activity';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Excel;
    ExcelLayout = 'Layouts\ARD_CustomerActivityLayout.xlsx';

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
