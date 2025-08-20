namespace BCJourney.BCJourney;
using System.Integration;

page 50005 ARD_HostControlDemo
{
    ApplicationArea = All;
    Caption = 'Host Control Demo';
    AboutText = 'This is a demo page for the Host Control.';
    AboutTitle = 'Host Control Demo';
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
                    CurrPage.Webpageview.Navigate(HyperLinkTxt);
                end;

                trigger Refresh(CallbackUrl: Text)
                begin
                    CurrPage.Webpageview.Navigate(HyperLinkTxt)
                end;
            }
        }
    }
    //No Actions Permitted!

    var
        HyperLinkTxt: Label 'https://aardvarklabs.blog';
}
