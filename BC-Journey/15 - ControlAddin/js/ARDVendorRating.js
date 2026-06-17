(function () {
    var ratingContainer;
    var currentRating = 0;
    var maxStars = 5;

    // Render the star rating UI based on the current rating
    function renderStars(rating) {
        if (!ratingContainer) {
            return;
        }

        ratingContainer.innerHTML = '';
        for (var i = 1; i <= maxStars; i++) {
            var star = document.createElement('span');
            star.className = 'ard-rating-star';
            star.innerText = i <= rating ? '★' : '☆';
            star.dataset.value = i;
            star.style.cursor = 'pointer';
            
            // Store the rating value in data attribute for event delegation
            star.dataset.starValue = i;
            
            ratingContainer.appendChild(star);
        }
    }
    
    // Use event delegation to handle click, hover, and leave events on the container
    function attachEventListeners() {
        if (!ratingContainer) {
            return;
        }
        
        // Remove old listeners to avoid duplicates
        ratingContainer.removeEventListener('click', onStarClick);
        ratingContainer.removeEventListener('mouseenter', onStarHover);
        ratingContainer.removeEventListener('mouseleave', onStarMouseLeave);
        
        // Attach delegated event listeners
        ratingContainer.addEventListener('click', onStarClick);
        ratingContainer.addEventListener('mouseenter', onStarHover);
        ratingContainer.addEventListener('mouseleave', onStarMouseLeave);
    }
    
    // Handle click on a star: update rating and notify AL
    function onStarClick(event) {
        var star = event.target;
        if (star.classList && star.classList.contains('ard-rating-star')) {
            var value = parseInt(star.dataset.starValue, 10);
            currentRating = value;
            renderStars(currentRating);
            notifyRatingChanged(currentRating);
        }
    }
    
    // Handle hover over a star: preview the rating
    function onStarHover(event) {
        var star = event.target;
        if (star.classList && star.classList.contains('ard-rating-star')) {
            var value = parseInt(star.dataset.starValue, 10);
            renderStars(value);
        }
    }
    
    // Handle mouse leaving the container: revert to current rating
    function onStarMouseLeave(event) {
        renderStars(currentRating);
    }

    // Notify AL that the rating has changed via InvokeExtensibilityMethod
    function notifyRatingChanged(rating) {
        try {
            if (typeof Microsoft !== 'undefined' && 
                Microsoft.Dynamics && 
                Microsoft.Dynamics.NAV && 
                Microsoft.Dynamics.NAV.InvokeExtensibilityMethod) {
                Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnRatingChanged', [rating]);
                return;
            }
        } catch (e) {
            // Fall back to window.external.notify if available
        }

        try {
            if (window.external && window.external.notify) {
                window.external.notify('rating:' + rating);
                return;
            }
        } catch (e) {
            // No fallback available
        }
    }

    // Set the current rating value (called from AL via CurrPage.VendorRatingControl.SetRating)
    function setRating(rating) {
        if (typeof rating === 'number') {
            currentRating = rating;
            renderStars(currentRating);
            attachEventListeners();
        }
    }

    // Set the maximum number of stars (called from AL via CurrPage.VendorRatingControl.SetMaxStars)
    function setMaxStars(stars) {
        if (typeof stars === 'number' && stars > 0) {
            maxStars = stars;
            renderStars(currentRating);
            attachEventListeners();
        }
    }

    // Public interface for the control
    window.ARDVendorRating = {
        initialize: function (container) {
            ratingContainer = container || document.getElementById('ard-rating');
            if (!ratingContainer) {
                // Create container if not provided
                var host = (container || document.body);
                ratingContainer = document.createElement('div');
                ratingContainer.id = 'ard-rating';
                ratingContainer.className = 'ard-rating';
                host.appendChild(ratingContainer);
            }
            renderStars(currentRating);
            attachEventListeners();
        },
        setRating: setRating,
        setMaxStars: setMaxStars
    };
})();

// Expose global functions so AL can call control methods directly
window.SetRating = function (rating) {
    var r = parseInt(rating, 10);
    if (!isNaN(r) && window.ARDVendorRating) {
        window.ARDVendorRating.setRating(r);
    }
};

window.SetMaxStars = function (stars) {
    var s = parseInt(stars, 10);
    if (!isNaN(s) && window.ARDVendorRating) {
        window.ARDVendorRating.setMaxStars(s);
    }
};
