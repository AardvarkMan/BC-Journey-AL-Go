pagecustomization ARD_DataEntryCustomerCard customizes "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field(SearchName; Rec."Search Name")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
        
        moveafter("Privacy Blocked"; "Customized Calendar")

        modify(Invoicing)
        {
            Visible = false;
        }

        modify(Statistics)
        {
            Visible = false;
        }

        modify(Payments)
        {
            Visible = false;
        }

        modify(ARDWarrantyClaims)
        {
            Visible = false;
        }

        modify("Balance (LCY)")
        {
            Visible = false;
        }

        modify("Balance Due (LCY)")
        {
            Visible = false;
        }

        modify("Credit Limit (LCY)")
        {
            Visible = false;
        }
        modify(TotalSales2)
        {
            Visible = false;
        }

        modify(AdjProfitPct)
        {
            Visible = false;
        }

        modify("CustSalesLCY - CustProfit - AdjmtCostLCY")
        {
            Visible = false;
        }

        modify(AdjCustProfit)
        {
            Visible = false;
        }

        modify(BalanceAsVendor)
        {
            Visible = false;
        }
    }
}