namespace AardvarkLabs;

using Microsoft.Sales.Document;
using Microsoft.Sales.History;

codeunit 50004 ARD_ByRefExample
{
procedure SumTotalAmount(SalesHeader: Record "Sales Header"; var TotalAmount: Decimal)
begin
    SalesHeader.CalcFields(Amount);
    TotalAmount += SalesHeader.Amount;
end;

procedure SumTotalAmount(SalesInvHeader: Record "Sales Invoice Header"; var TotalAmount: Decimal)
begin
    SalesInvHeader.CalcFields(Amount);
    TotalAmount += SalesInvHeader.Amount;
end;

procedure SumTotalAmountByRef(SalesHeader: Record "Sales Header"; var TotalAmount: Decimal)
var
    SalesRecordsRef: RecordRef;
begin
    SalesRecordsRef.GetTable(SalesHeader);
    SumTotalAmount(SalesRecordsRef, TotalAmount);
end;

procedure SumTotalAmountByRef(SalesHeader: Record "Sales Invoice Header"; var TotalAmount: Decimal)
var
    SalesRecordsRef: RecordRef;
begin
    SalesRecordsRef.GetTable(SalesHeader);
    SumTotalAmount(SalesRecordsRef, TotalAmount);
end;

    procedure SumTotalAmount(SalesRecordsRef: RecordRef; var TotalAmount: Decimal)
    var
        AmountFieldRef: FieldRef;
        TempDecimal: Decimal;
    begin
        AmountFieldRef := SalesRecordsRef.Field(60); // Assuming field 60 is the Amount field
        AmountFieldRef.CalcField();
        Evaluate(TempDecimal, AmountFieldRef.Value());
        TotalAmount += TempDecimal;
    end;
}
