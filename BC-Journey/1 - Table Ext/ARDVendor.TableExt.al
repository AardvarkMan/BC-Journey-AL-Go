namespace AardvarkLabs;

using Microsoft.Purchases.Vendor;

tableextension 50010 ARDVendor extends Vendor
{
    fields
    {
        field(50010; ARD_VendorRating; Integer)
        {
            Caption = 'Vendor Rating';
            DataClassification = CustomerContent;
            ToolTip = 'A 1-to-5 star rating for the vendor.';
            MinValue = 1;
            MaxValue = 5;
        }
    }
}
