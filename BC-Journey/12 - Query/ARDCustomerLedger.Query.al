// BC AL Journey #25
namespace BCJourney.BCJourney;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Receivables;

query 50000 ARD_CustomerLedger
{
    Caption = 'Customer Ledger';
    Description = 'Query to retrieve customer ledger entries with total sales amount.';
    QueryType = Normal;
    UsageCategory = ReportsAndAnalysis;
    
    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
                Caption = 'Customer No.';
            }
            column(Name; Name)
            {
                Caption = 'Customer Name';
            }
            dataitem(CustomerLedgerEntry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Customer."No.";
                SqlJoinType = LeftOuterJoin;
                DataItemTableFilter = "Document Type" = filter(Invoice | "Credit Memo");
                
                column(SalesAmount; "Sales (LCY)")
                {
                    Caption = 'Sales Amount';
                }
                column(postingDate; "Posting Date")
                {
                    Caption = 'Posting Date';
                }
            }
        }
    }
}
