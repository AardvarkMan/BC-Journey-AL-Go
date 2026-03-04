namespace AardvarkLabs;

using Microsoft.Inventory.Item;

pageextension 50006 "ARD_Item List" extends "Item List"
{
    actions
    {
        addafter("Inventory - Sales Back Orders")
        {
            action("ExportToExcel")
            {
                ApplicationArea = All;
                Caption = 'Export to Excel by Ref';
                Image = Export;

                trigger OnAction()
                var
                    SelectedItems: Record "Item";
                    RecRef: RecordRef;
                    ARDToExcelByRef: Codeunit ARD_ToExcelByRef;
                begin
                    Currpage.SetSelectionFilter(SelectedItems); // Get the selected records from the page
                    RecRef.GetTable(SelectedItems); // Get the record reference from the selected items
                    ARDToExcelByRef.ToExcelByRef(RecRef); // Call the codeunit to export to Excel
                end;
            }
        }
    }
}
