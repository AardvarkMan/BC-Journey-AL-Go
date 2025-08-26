namespace BCJourney.BCJourney;
using System.Integration;

page 50006 ARD_HostControlToPBI
{
    ApplicationArea = All;
    Caption = 'Host Control PBI Demo';
    AboutText = 'This is a demo page for the Host Control displaying Power BI content.';
    AboutTitle = 'Host Control PBI Demo';
    UsageCategory = Documents;
    PageType = UserControlHost;
    
    layout
    {
        area(Content)
        {
            usercontrol(Webpageview; WebPageViewer)
            {
                ApplicationArea = All;

                trigger ControlAddInReady(callback: text)
                begin
                    CurrPage.Webpageview.Navigate(PBIHyperLink);
                end;

                trigger Refresh(CallbackUrl: Text)
                begin
                    CurrPage.Webpageview.Navigate(PBIHyperLink)
                end;
            }
        }
    }
    var
        PBIHyperLink: Text;
        HyperLinkTxt: Label 'https://app.powerbi.com/groups/8ce54d73-2fc0-4860-a7fd-4812ab7340d6/reports/0c7c34da-17bb-40bf-9b90-677e55178fab/33644ef709c5de3d300d?filter=CustomerNo eq ''%1''';

    procedure SetCustomerNo(CustomerNo: Code[20])
    begin
        PBIHyperLink := StrSubstNo(HyperLinkTxt, CustomerNo);
    end;
}