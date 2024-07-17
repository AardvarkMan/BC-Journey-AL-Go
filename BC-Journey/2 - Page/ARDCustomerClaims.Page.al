/*
    Customized in BC AL Journey #13
*/
namespace AardvarkLabs;

page 50003 ARDCustomerClaims
{
    ApplicationArea = All;
    Caption = 'Customer Claims';
    PageType = ListPart;
    SourceTable = ARDWarrantyClaim;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Date"; Rec."Date")
                {
                }
                field(Details; Rec.Details)
                {
                }
                field(Resolved; Rec.Resolved)
                {
                }
            }
        }
    }
}
