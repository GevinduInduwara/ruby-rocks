#include <iostream>
#include <thread>
#include <chrono>

// Simulated location data structure
struct Location {
    double latitude;
    double longitude;
};

// Function to get the current location
Location getCurrentLocation() {
    // In a real application, you would use a geolocation API or hardware to get location data.
    // For this example, we will simulate location updates.
    static double lat = 40.7128; // New York City latitude
    static double lon = -74.0060; // New York City longitude

    // Simulate location changes
    lat += 0.001;
    lon += 0.001;

    return {lat, lon};
}

int main() {
    while (true) {
        Location currentLocation = getCurrentLocation();

        // Print the current location
        std::cout << "Latitude: " << currentLocation.latitude << ", Longitude: " << currentLocation.longitude << std::endl;

        // Sleep for a few seconds to simulate location updates
        std::this_thread::sleep_for(std::chrono::seconds(5));
    }

    return 0;
}
