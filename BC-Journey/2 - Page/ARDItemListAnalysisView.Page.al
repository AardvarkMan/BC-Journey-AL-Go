namespace BCJourney.BCJourney;

using Microsoft.Inventory.Item;

page 50005 ARD_ItemListAnalysisView
{
    ApplicationArea = All;
    Caption = 'Item List Analysis View';
    PageType = List;
    SourceTable = Item;
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                }
                field("Item Type"; Rec.Type)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Inventory; Rec.Inventory)
                {
                }
                field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
                {
                }
                field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
                {
                }
                field("Qty. on Prod. Order"; Rec."Qty. on Prod. Order")
                {
                }
                field("Qty. on Job Order"; Rec."Qty. on Job Order")
                {
                }
            }
        }
    }
    analysisviews
    {
        analysisview(ItemAvailability)
        {
            DefinitionFile = './Analysis/ItemByType.analysis.json';
            Caption = 'Item Availability By Type';
            ToolTip = 'View item availability details.';
            Visible = true;
        }
    }
}
