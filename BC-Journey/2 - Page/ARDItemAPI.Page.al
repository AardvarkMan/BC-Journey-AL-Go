/*
    Customized in BC AL Journey #8
*/
namespace AardvarkLabs;
using Microsoft.Inventory.Item;

page 50002 "ARD_ItemAPI"
{
    PageType = API;
    SourceTable = Item;

    APIGroup = 'aardvarkLabs';
    APIPublisher = 'aardvarkLabs';
    APIVersion = 'v1.0';
    Caption = 'ardItemAPI';
    EntityName = 'item';
    EntitySetName = 'items';
    ODataKeyFields = SystemId;

    Extensible = false;
    DelayedInsert = true;
    /*
        Removing Delayed insert and uncommenting the following lines will
        convert this API to a read-only API that uses the replica database
        for improved reporting operations.
    */
    //Editable = false
    //DataAccessIntent = ReadOnly;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId) { }
                field(no; Rec."No.") { }
                field(description; Rec.Description) { }
                field(ardColor; Rec.ARD_Color) { }
                field(ardLength; Rec.ARD_Length) { }
                field(ardHeight; Rec.ARD_Height) { }
                field(ardWeight; Rec.ARD_Weight) { }
                field(ardWidth; Rec.ARD_Width) { }
                field(lastModifiedDateTime; Rec.SystemModifiedAt) { }
            }
        }
    }
}
