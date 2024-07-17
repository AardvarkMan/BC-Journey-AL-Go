/*
    Customized in BC AL Journey #12
*/
namespace AardvarkLabs;
using Microsoft.Sales.Customer;

codeunit 50001 ARDValidateCustomer
{
    procedure ValidateCustomer(CustomerRec: Record Customer): Boolean
    begin
        exit(ValidateCustomerDetails(CustomerRec));
    end;

    local procedure ValidateCustomerDetails(CustomerRec: Record Customer): Boolean
    var
        CustomerValid: Boolean;
        CustomerHasName: Boolean;
        CustomerHasEmail: Boolean;
    begin
        CustomerHasName := StrLen(CustomerRec.Name) > 0;
        CustomerHasEmail := ValidateEmail(CustomerRec."E-Mail");

        CustomerValid := CustomerHasName and CustomerHasEmail;
        exit(CustomerValid);
    end;

    local procedure ValidateEmail(EmailAddress: Text[80]): Boolean
    var
        EmailValid: Boolean;
    begin
        EmailValid := StrPos(EmailAddress, '@') > 1;
        exit(EmailValid);
    end;
}
