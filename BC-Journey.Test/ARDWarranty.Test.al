codeunit 60001 "ARD_Warranty.Test"
{
    Subtype = Test;

    [Test]
    procedure TestCustomerWarranty()
    var
        CustomerRec: Record Customer;
        WarrantyRec: Record ARDWarrantyClaim;
        CustomerCard: TestPage "Customer Card";
        Assert: Codeunit "Library Assert";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        LibrarySales: Codeunit "Library - Sales";
    begin
        //[Scenario] A customer is assigned a Warranty Claim
        //[Given] A customer record has a Warranty Claim Record associated with it.
        LibrarySales.CreateCustomer(CustomerRec);
        CreateWarrantyClaim(CustomerRec."No.", WarrantyRec);

        //[When] The Customer Card is viewed
        CustomerCard.OpenEdit();
        CustomerCard.GoToRecord(CustomerRec);

        //[Then] The Warranty Claim is visible and has the desired value
        Assert.IsTrue(CustomerCard.ARDCustomerClaims.Date.Visible(), 'Claim Date should be visible');
        Assert.AreEqual(CustomerCard.ARDCustomerClaims.Details, WarrantyRec.Details, 'Claim Details should be complete');
    end;

    procedure CreateWarrantyClaim(CustomerNo: Code[20]; var WarrantyRec: Record ARDWarrantyClaim)
    begin
        WarrantyRec.Init();
        WarrantyRec."CustomerNo." := CustomerNo;
        WarrantyRec.Details := 'Test';
        WarrantyRec.Date := DT2Date(CurrentDateTime);
    end;

}
