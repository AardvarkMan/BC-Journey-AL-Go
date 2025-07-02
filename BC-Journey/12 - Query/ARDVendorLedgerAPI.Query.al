namespace BCJourney.BCJourney;
using Microsoft.Purchases.Vendor;
using Microsoft.Purchases.Payables;

query 50001 ARD_VendorLedgerAPI
{
    Caption = 'Vendor API';
    APIGroup = 'aardvarkLabs';
    APIPublisher = 'aardvarkLabs';
    APIVersion = 'v1.0';
    EntityName = 'vendorPurchase';
    EntitySetName = 'vendorPurchases';
    QueryType = API;
    
    elements
    {
        dataitem(ard_vendor; Vendor)
        {
            column(systemId; SystemId)
            {
            }
            column(no; "No.")
            {
            }
            column(name; Name)
            {
            }
            dataitem(ard_Vendor_Ledger_Entry; "Vendor Ledger Entry")
            {
                DataItemLink = "Vendor No." = ard_vendor."No.";
                SqlJoinType = LeftOuterJoin;
                DataItemTableFilter = "Document Type" = filter(Invoice | "Credit Memo");
                column(totalPurchaseAmount; "Purchase (LCY)")
                {
                    caption = 'Total Purchase Amount', Locked = true;
                    Method = Sum; 
                }
                filter(dateFilter; "Posting Date")
                {
                    Caption = 'Posting Date';
                }
            }
        }
    }
}
