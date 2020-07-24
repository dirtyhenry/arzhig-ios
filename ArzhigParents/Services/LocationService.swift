import Foundation
import Combine
import CoreLocation

enum LocationError: Error {
    case significantLocationChangeMonitoringUnavailable
}

protocol Proutable {
    func locations() -> AnyPublisher<CLLocation, LocationError>
}

class LocationService: NSObject {
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
    }
    
    func start() throws {
        guard CLLocationManager.significantLocationChangeMonitoringAvailable() else {
            throw LocationError.significantLocationChangeMonitoringUnavailable
        }

        locationManager.delegate = self
    }
    
    func authorize() {
        let currentAuthorizationStatus = CLLocationManager.authorizationStatus()
        switch currentAuthorizationStatus {
        case .notDetermined, .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
        default:
            debugPrint("authorization can not be requested with the current authorization status \(currentAuthorizationStatus)")
        }
    }
    
    let locationManager: CLLocationManager
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint("location manager did fail with error: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        debugPrint("location manager did change authorization: \(status)")
    }
}
