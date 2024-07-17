namespace AardvarkLabs;

page 50000 ARD_WarrantyCard
{
    ApplicationArea = All;
    Caption = 'Warranty Card';
    PageType = Card;
    SourceTable = ARD_Warranty;
    UsageCategory = Documents;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field(ARD_Name; Rec.ARD_Name)
                {
                    InstructionalText = 'Warranty Name';
                }
                field(ARD_Description; Rec.ARD_Description)
                {
                    InstructionalText = 'Warranty details description.';
                }
            }
        }
    }
}
