/*
    Customized in BC AL Journey #13
*/
namespace AardvarkLabs;
table 50001 ARDWarrantyClaim
{
    Caption = 'WarrantyClaim';
    DataClassification = CustomerContent;
    DataCaptionFields = "WarrantyClaimNo.", "CustomerNo.";
    
    fields
    {
        field(1; "WarrantyClaimNo."; Integer)
        {
            Caption = 'Warranty Claim No.';
            ToolTip = 'Warranty Claim Number';
            AutoIncrement = true;
        }
        field(2; "CustomerNo."; Code[20])
        {
            Caption = 'Customer No.';
            ToolTip = 'Associated Customer Number';
        }
        field(3; Details; Text[255])
        {
            Caption = 'Details';
            ToolTip = 'Warranty claim details';
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
            ToolTip = 'Warranty Claim Date';
        }
        field(5; Resolved; Boolean)
        {
            Caption = 'Resolved';
            ToolTip = 'Indicate if the Claim has been resolved';
        }
    }
    keys
    {
        key(PK; "WarrantyClaimNo.","CustomerNo.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        Rec.Date := DT2Date(CurrentDateTime);
    end;
}
