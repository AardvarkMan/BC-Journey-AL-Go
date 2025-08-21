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
        HyperLinkTxt: Label 'https://aardvarklabs.blog/%1';

    procedure SetCustomerNo(CustomerNo: Code[20])
    begin
        PBIHyperLink := StrSubstNo(HyperLinkTxt, CustomerNo);
    end;
}