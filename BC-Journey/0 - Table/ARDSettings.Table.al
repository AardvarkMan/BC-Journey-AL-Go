namespace AardvarkLabs;

table 50002 ARD_Settings
{
    Caption = 'Settings';
    DataClassification = SystemMetadata;
    
    fields
    {
        field(1; "ARD_No."; Code[1])
        {
            Caption = 'No.';
            ToolTip = 'Settings No.';
        }
        field(2; ARD_DefaultWarranty; Integer)
        {
            Caption = 'Default Warranty';
            ToolTip = 'Default Warranty Value';
            TableRelation = ARD_Warranty;
        }
    }
    keys
    {
        key(PK; "ARD_No.")
        {
            Clustered = true;
        }
    }
}
