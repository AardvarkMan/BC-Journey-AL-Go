(function () {
    var container = document.getElementById('controlAddIn') || document.currentScript.parentElement;
    if (!container) return;
    
    // Ensure container styles
    container.style.overflow = 'hidden';
    container.style.height = '100%';

    // Initialize rating control within container
    if (window.ARDVendorRating && typeof window.ARDVendorRating.initialize === 'function') {
        window.ARDVendorRating.initialize(container);
    }

    // Signal that the control is ready
    if (Microsoft && Microsoft.Dynamics && Microsoft.Dynamics.NAV && Microsoft.Dynamics.NAV.InvokeExtensibilityMethod) {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnControlReady', []);
    }
})();
