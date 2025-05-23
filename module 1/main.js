// JavaScript Exercises Implementation

// 1. Page Load Alert
window.addEventListener('load', () => {
  alert('Page fully loaded!');
  console.log('Welcome to the Community Portal');
});

// 2. Phone Number Validation
document.getElementById('phone').addEventListener('blur', function () {
  const phonePattern = /^\d{10}$/;
  if (!phonePattern.test(this.value)) {
    alert('Please enter a valid 10-digit phone number.');
    this.focus();
  }
});

// 3. Event Type Change Handler
document.getElementById('eventType').addEventListener('change', function () {
  const selectedEvent = this.value;
  alert(`You selected the ${selectedEvent} event.`);
});

// 4. Form Submission
document.getElementById('eventForm').addEventListener('submit', function (e) {
  e.preventDefault();
  const name = this.name.value;
  const email = this.email.value;
  const eventType = this.eventType.value;

  // Save preference to localStorage
  localStorage.setItem('preferredEvent', eventType);

  document.getElementById('confirmation').textContent = `Thank you, ${name}! You have registered for the ${eventType} event.`;
});

// 5. Video Ready Message
document.getElementById('eventVideo').addEventListener('canplay', function () {
  document.getElementById('videoStatus').textContent = 'Video ready to play';
});

// 6. Geolocation
document.getElementById('findEventsBtn').addEventListener('click', function () {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(
      position => {
        const coords = `Latitude: ${position.coords.latitude}, Longitude: ${position.coords.longitude}`;
        document.getElementById('locationDisplay').textContent = coords;
      },
      error => {
        document.getElementById('locationDisplay').textContent = 'Unable to retrieve your location.';
      },
      { enableHighAccuracy: true, timeout: 5000, maximumAge: 0 }
    );
  } else {
    document.getElementById('locationDisplay').textContent = 'Geolocation is not supported by your browser.';
  }
});

// 7. Clear Preferences
document.getElementById('clearPreferencesBtn').addEventListener('click', function () {
  localStorage.clear();
  sessionStorage.clear();
  alert('Preferences cleared.');
});

// 8. Pre-select Preferred Event on Load
window.addEventListener('DOMContentLoaded', () => {
  const preferredEvent = localStorage.getItem('preferredEvent');
  if (preferredEvent) {
    document.getElementById('eventType').value = preferredEvent;
  }
});
