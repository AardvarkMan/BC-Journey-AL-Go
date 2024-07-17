/*
    Customized in BC AL Journey #11
*/

namespace AardvarkLabs;

using Microsoft.Sales.Posting;
using Microsoft.Sales.Document;

codeunit 50000 "ARD_WarrantyDateHandler"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', false, false)]
    local procedure "Sales-Post_OnBeforePostSalesDoc"(var Sender: Codeunit "Sales-Post"; var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var HideProgressWindow: Boolean; var IsHandled: Boolean; var CalledBy: Integer)
    var
        WarrantyDateFormula: Text[30];
        WarrantyExpDate: Date;
    begin
        if PreviewMode then exit;

        If (SalesHeader.ARD_WarrantyNo > 0) AND (SalesHeader.ARD_WarrantyExpDate = 0D) then begin
            WarrantyDateFormula := '<+2Y>';
            WarrantyExpDate := CalcDate(WarrantyDateFormula, DT2Date(CurrentDateTime()));
            SalesHeader.ARD_WarrantyExpDate := WarrantyExpDate;
        end;
    end;
}
