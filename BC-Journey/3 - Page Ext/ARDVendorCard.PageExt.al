namespace AardvarkLabs;

using Microsoft.Purchases.Vendor;

/// <summary>
/// Vendor Card Page Extension
/// Adds a vendor rating control to the Vendor Card page.
/// The rating is stored in the ARD_VendorRating field on the Vendor table.
/// </summary>
pageextension 50011 ARDVendorCard extends "Vendor Card"
{
    layout
    {
        addafter(General)
        {
            group(ARDVendorRatingGroup)
            {
                Caption = 'Vendor Rating';
                usercontrol(VendorRatingControl; ARDVendorRatingControl)
                {
                    ApplicationArea = All;

                    trigger OnControlReady()
                    begin
                        FormIsReady := true;
                        SendDataToForm();
                    end;

                    trigger OnRatingChanged(Rating: Integer)
                    begin
                        // Prevent recursion when updating control from AL
                        UpdatingFromForm := true;
                        Rec.Validate(ARD_VendorRating, Rating);
                        Rec.Modify(true);
                        CurrPage.Update(false);
                        UpdatingFromForm := false;
                    end;
                }
            }
        }
    }

    var
        FormIsReady: Boolean;
        UpdatingFromForm: Boolean;

    trigger OnAfterGetCurrRecord()
    begin
        if FormIsReady and not UpdatingFromForm then
            SendDataToForm();
    end;

    local procedure SendDataToForm()
    begin
        if not FormIsReady then
            exit;

        if UpdatingFromForm then
            exit;

        UpdatingFromForm := true;
        CurrPage.VendorRatingControl.SetRating(Rec.ARD_VendorRating);
        UpdatingFromForm := false;
    end;
}
