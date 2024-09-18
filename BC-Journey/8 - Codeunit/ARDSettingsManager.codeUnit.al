namespace AardvarkLabs;

using System.Environment.Configuration;
using System.Globalization;
using System.Media;

codeunit 50003 ARD_SettingsManager
{
    EventSubscriberInstance = StaticAutomatic;

    trigger OnRun()
    begin
        OpenSettingsPage();
    end;

    procedure OpenSettingsPage()
    var
        SettingsRecord: Record ARD_Settings;
        SettingsPage: Page ARD_Settings;
    begin
        SettingsRecord := ConfigureSettings();
        SettingsPage.SetRecord(SettingsRecord);
        SettingsPage.Run();
    end;

    /// <summary>
    /// Configures the Settings file to have an empty string number
    /// Could be used to set other base configuration requirements
    /// </summary>
    /// <returns></returns>
    procedure ConfigureSettings(): Record ARD_Settings
    var
        SettingsRecord: Record ARD_Settings;
    begin
        if SettingsRecord.Get() = false then begin
            SettingsRecord.Init();
            SettingsRecord."ARD_No." := '';
            SettingsRecord.Insert();
        end;

        exit(SettingsRecord);
    end;

[EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', false, false)]
local procedure AddSetupWizard()
var
    GuidedExperience: Codeunit "Guided Experience";
    Language: Codeunit Language;
    AssistedSetupGroup: Enum "Assisted Setup Group";
    VideoCategory: Enum "Video Category";
    Info: ModuleInfo;
    CurrentGlobalLanguage: Integer;
    Title: Text[2048];
    ShortTitle: Text[50];
    Description: Text[1024];
    ExpectedDuration: Integer;
    ObjectTypeToRun: ObjectType;
    ObjectIDToRun: Integer;
    VideoURL: Text[250];
    HelpURL: Text[250];
begin
    ConfigureSettings();
    NavApp.GetCurrentModuleInfo(Info);
    CurrentGlobalLanguage := GLOBALLANGUAGE();

    Title := 'Warranty Setup';
    ShortTitle := 'Warranty Setup';
    Description := 'Setup for the Warranty Customizations';
    ExpectedDuration := 5;
    ObjectTypeToRun := ObjectType::Page;
    ObjectIDToRun := Page::ARD_Settings;
    AssistedSetupGroup := AssistedSetupGroup::Extensions;
    VideoURL := '';
    VideoCategory := VideoCategory::Uncategorized;
    HelpURL := 'http://AardvarkLabs.Blog';

    GuidedExperience.InsertAssistedSetup(Title, 
                                        ShortTitle, 
                                        Description,
                                        ExpectedDuration, 
                                        ObjectTypeToRun,
                                        ObjectIDToRun,
                                        AssistedSetupGroup,
                                        VideoURL, 
                                        VideoCategory,
                                        HelpURL);

    GLOBALLANGUAGE(Language.GetDefaultApplicationLanguageId());
    GLOBALLANGUAGE(CurrentGlobalLanguage);
end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterManualSetup', '', false, false)]
    local procedure AddManualSetup(var Sender: Codeunit "Guided Experience")
    var
        Info: ModuleInfo;
        Title: Text[2048];
        ShortTitle: Text[50];
        Description: Text[1024];
        ExpectedDuration: Integer;
        ObjectTypeToRun: ObjectType;
        ObjectIDToRun: Integer;
        ManualSetupCategory: Enum "Manual Setup Category";
        Keywords: Text[250];
    begin
        ConfigureSettings();

        NavApp.GetCurrentModuleInfo(Info);

        Title := 'Warranty Setup';
        ShortTitle := 'Warranty Setup';
        Description := 'Setup for the Warranty Customizations';
        ExpectedDuration := 5;
        ObjectTypeToRun := ObjectType::Page;
        ObjectIDToRun := Page::ARD_Settings;
        ManualSetupCategory := ManualSetupCategory::System;
        Keywords := 'Warranty, Custom';

        Sender.InsertManualSetup(Title, 
                                ShortTitle, 
                                Description, 
                                ExpectedDuration, 
                                ObjectTypeToRun, 
                                ObjectIDToRun, 
                                ManualSetupCategory, 
                                Keywords);
    end;
}
