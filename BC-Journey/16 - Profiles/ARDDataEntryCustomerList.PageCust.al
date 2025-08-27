pagecustomization ARD_DataEntryCustomerList customizes "Customer List"
{
    layout
    {
        modify("Balance Due (LCY)")
        {
            Visible = false;
        }

        modify("Balance (LCY)")
        {
            Visible = false;
        }
    }

    actions
    {
        modify(Statistics)
        {
            Visible = false;
        }

        modify(CustomerLedgerEntries)
        {
            Visible = false;
        }
    }
}