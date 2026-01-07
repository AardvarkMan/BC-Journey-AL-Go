namespace AardvarkLabs;
using Microsoft.Sales.History;

pageextension 50005 "ARD_Posted Sales Invoices" extends "Posted Sales Invoices"
{
    analysisviews
    {
        addlast
        {
            analysisview(CustomerBalance)
            {
                DefinitionFile = './Analysis/Customer balance due date.analysis.json';
                Caption = 'Customer Balance Due Date';
            }
        }
    }
}
