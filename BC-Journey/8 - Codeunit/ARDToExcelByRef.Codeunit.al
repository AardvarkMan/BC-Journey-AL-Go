namespace AardvarkLabs;
using System.IO;

codeunit 50005 ARD_ToExcelByRef
{
    Procedure ToExcelByRef(RecRef: RecordRef)
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        FieldRef: FieldRef;
        FileName: Text;
        i: Integer;
    begin
        // --- Add headers dynamically ---
        for i := 1 to RecRef.FieldCount do begin
            FieldRef := RecRef.FieldIndex(i);
            TempExcelBuffer.AddColumn(
                FieldRef.Caption, // Column header
                false, '', true, false, false, '',
                TempExcelBuffer."Cell Type"::Text
            );
        end;
        
        //Add a new row after adding headers
        TempExcelBuffer.NewRow();

        // --- Add data rows dynamically ---
        if RecRef.FindSet() then
            repeat
                for i := 1 to RecRef.FieldCount do begin
                    FieldRef := RecRef.FieldIndex(i);
                    FieldRef.Value := RecRef.Field(FieldRef.Number);
                    TempExcelBuffer.AddColumn(
                        Format(FieldRef.Value),
                        false, '', false, false, false, '',
                        TempExcelBuffer."Cell Type"::Text
                    );
                end;
                TempExcelBuffer.NewRow();
            until RecRef.Next() = 0;

        // --- Create and download Excel file ---
        FileName := Format(RecRef.Name) + '_Export.xlsx';
        TempExcelBuffer.CreateNewBook('Export');
        TempExcelBuffer.WriteSheet('Data', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(FileName);
        TempExcelBuffer.OpenExcel();

        RecRef.Close();
    end;
}
