/*
    Customized in BC AL Journey #6
*/
namespace AardvarkLabs;
table 50000 ARD_Warranty
{
    Caption = 'Warranty';
    DataClassification = CustomerContent;
    DataCaptionFields = "ARD_No.", ARD_Name;

    fields
    {
        field(1; "ARD_No."; Integer)
        {
            Caption = 'No.';
            ToolTip = 'Warranty record is number.';
            AutoIncrement = true;
        }
        field(2; ARD_Name; Text[100])
        {
            Caption = 'Name';
            ToolTip = 'Warranty offering name.';
        }
        field(3; ARD_Description; Text[255])
        {
            Caption = 'Description';
            ToolTip = 'Warranty offering description.';
        }
    }
    keys
    {
        key(PK; "ARD_No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "ARD_No.", ARD_Name)
        {
        }
        fieldgroup(Brick; "ARD_No.", ARD_Name)
        {
        }
    }
}
