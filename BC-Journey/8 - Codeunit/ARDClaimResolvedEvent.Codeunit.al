/*
    Customized in BC AL Journey #15
*/
namespace AardvarkLabs;
using System.Integration;
using Microsoft.Sales.Customer;

codeunit 50002 ARD_ClaimResolvedEvent
{
    var
    EventCategory: Enum EventCategory;

    /// <summary>
    /// On after validate resolved compete procedure that handles the change event on the resolved flag
    /// </summary>
    /// <param name="Rec"></param>
    [EventSubscriber(ObjectType::Table, Database::ARDWarrantyClaim, 'OnAfterValidateEvent', 'Resolved', false, false)]
    local Procedure OnAfterValidateResolvedComplete(var Rec: Record ARDWarrantyClaim)
    var
        Customer: Record Customer;
    begin
        if Customer.Get(Rec."CustomerNo.") then
            ClaimResolvedBusinessEvent(Rec.SystemId, Customer.SystemId, Rec.Resolved);
    end;

    /// <summary>
    /// Business event for the handling of the resoved business event
    /// </summary>
    /// <param name="ClaimID">GUID of the Claim record</param>
    /// <param name="CustomerNo">GUID of the Customer record</param>
    /// <param name="Complete">Complete flag status</param>
    [ExternalBusinessEvent('ClaimResolved', 'Claim Resolved', 'This Business Event is triggered when a Claims resolution state has changed.', EventCategory::"Ardvark Labs Events")]
    local procedure ClaimResolvedBusinessEvent(ClaimID: Guid; CustomerNo: Guid; Complete: Boolean)
    begin
    end;
}
