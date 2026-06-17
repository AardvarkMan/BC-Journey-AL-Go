/// <summary>
/// Vendor Rating Control Add-In
/// Provides a 1-5 star rating UI control for use on pages.
/// Events: OnControlReady (fired when the control is initialized), OnRatingChanged (fired when user clicks a star)
/// Procedures: SetRating (set rating value), SetMaxStars (set maximum star count)
/// </summary>
controladdin "ARDVendorRatingControl"
{
    RequestedWidth = 200;
    RequestedHeight = 36;
    Scripts = './js/ARDVendorRating.js';
    StartupScript = './js/ARDVendorRatingStartup.js';
    StyleSheets = './css/ARDVendorRating.css';

    // Event that identifies that the control is ready to receive data from AL
    event OnControlReady();
    // Event that is fired when the user clicks a star to change the rating
    event OnRatingChanged(Rating: integer);
    // Procedure that AL can call to set the current rating on the control
    procedure SetRating(Rating: integer);
    // Procedure that AL can call to set the maximum number of stars on the control (default is 5)
    procedure SetMaxStars(MaxStars: integer);
}
