/*
    Customized in BC AL Journey #4
    https://aardvarklabs.blog/2024/05/01/first-steps-on-a-coding-journey/
*/
namespace AardvarkLabs;
using Microsoft.Inventory.Item;
tableextension 50000 "ARD_Item" extends Item
{
    fields
    {
        field(50000; ARD_Color; Text[50])
        {
            Caption = 'Color';
            DataClassification = CustomerContent;
            ToolTip = 'Item Color.';
        }
        field(50001; ARD_Length; Decimal)
        {
            Caption = 'Length';
            DataClassification = CustomerContent;
            ToolTip = 'Item Length';

            /*
            BC AL Journey #10
            */
            trigger OnValidate()
            var
                ErrMsg: Label 'Length must be greater than zero.';
            begin
                if Rec.ARD_Length < 0 then
                    Error(ErrMsg);
            end;
        }
        field(50002; ARD_Width; Decimal)
        {
            Caption = 'Width';
            DataClassification = CustomerContent;
            ToolTip = 'Item Width';

            /*
            BC AL Journey #10
            */
            trigger OnValidate()
            var
                ErrMsg: Label 'Width must be greater than zero.';
            begin
                if Rec.ARD_Width < 0 then
                    Error(ErrMsg);
            end;
        }
        field(50003; ARD_Height; Decimal)
        {
            Caption = 'Height';
            DataClassification = CustomerContent;
            ToolTip = 'Item Height';

            /*
            BC AL Journey #10
            */
            trigger OnValidate()
            var
                ErrMsg: Label 'Height must be greater than zero.';
            begin
                if Rec.ARD_Height < 0 then
                    Error(ErrMsg);
            end;
        }
        field(50004; ARD_Weight; Decimal)
        {
            Caption = 'Weight';
            DataClassification = CustomerContent;
            ToolTip = 'Item Weight';

            /*
            BC AL Journey #10
            */
            trigger OnValidate()
            var
                ErrMsg: Label 'Weight must be greater than zero.';
            begin
                if Rec.ARD_Weight < 0 then
                    Error(ErrMsg);
            end;
        }
    }
}
