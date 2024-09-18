namespace AardvarkLabs;

page 50004 ARD_Settings
{
    ApplicationArea = All;
    Caption = 'Warranty Settings';
    PageType = Worksheet;
    SourceTable = ARD_Settings;
    DeleteAllowed = false;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(ARD_DefaultWarranty; Rec.ARD_DefaultWarranty)
                {
                }
            }
        }
    }
}
