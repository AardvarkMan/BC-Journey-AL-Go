/*
    Customized in BC AL Journey #4
    https://aardvarklabs.blog/2024/05/01/first-steps-on-a-coding-journey/
*/
namespace AardvarkLabs;
using Microsoft.Inventory.Item;

pageextension 50000 ARD_ItemCard extends "Item Card"
{
    layout
    {
        addafter(Type)
        {
            field(ARD_Color; Rec.ARD_Color)
            {
                ApplicationArea = All;
            }

            field(ARD_Length; Rec.ARD_Length)
            {
                ApplicationArea = All;
            }

            field(ARD_Width; Rec.ARD_Width)
            {
                ApplicationArea = All;
            }

            field(ARD_Height; Rec.ARD_Height)
            {
                ApplicationArea = All;
            }

            field(ARD_Weight; Rec.ARD_Weight)
            {
                ApplicationArea = All;
            }
        }
    }
}

        