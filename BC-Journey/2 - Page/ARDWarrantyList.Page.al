/*
    Customized in BC AL Journey #6
*/
namespace AardvarkLabs;

page 50001 ARD_WarrantyList
{
    ApplicationArea = All;
    Caption = 'Warranty List';
    PageType = List;
    SourceTable = ARD_Warranty;
    UsageCategory = Documents;
    CardPageId = ARD_WarrantyCard;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("ARD_No."; Rec."ARD_No.")
                {
                }
                field(ARD_Name; Rec.ARD_Name)
                {
                }
                field(ARD_Description; Rec.ARD_Description)
                {
                }
            }
        }
    }
}
