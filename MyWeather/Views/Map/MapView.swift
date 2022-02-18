import MapKit
import UIKit

final class MapView: UIView {
    // MARK: - Properties

    // MARK: Private

    private let map: MKMapView = .init()
    private let locationManager = CLLocationManager()
    private let locationButton = UIButton()

    // MARK: - LIfecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
        addSetups()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addConstraints() {
        addMapConstraints()
        addLocationButtonConstraints()
    }
    
    private func addMapConstraints() {
        map.translatesAutoresizingMaskIntoConstraints = false
        map.topAnchor.constraint(equalTo: topAnchor).isActive = true
        map.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        map.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func addLocationButtonConstraints() {
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.centerYAnchor.constraint(equalTo: map.centerYAnchor).isActive = true
        locationButton.trailingAnchor.constraint(equalTo: map.trailingAnchor, constant: -10).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        addSubview(map)
        map.addSubview(locationButton)
    }
    
    private func addSetups() {
        addViewSetups()
        addMapAndLocationButtonSetups()
    }
    
    private func addViewSetups() {
        backgroundColor = UIColor(red: 36/255, green: 34/255, blue: 49/255, alpha: 1.0)
        layer.cornerRadius = 15
    }
    
    private func addMapAndLocationButtonSetups() {
        map.layer.cornerRadius = 15
        let resultimage = UIImage(systemName: "location")
        locationButton.setImage(resultimage, for: .normal)
        locationButton.tintColor = .white
        locationButton.addAction(UIAction(handler: { _ in
            self.clickLocationButton()
        }), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    // MARK: Private
    
    private func clickLocationButton() {
        map.showsUserLocation = true
        let latitude = locationManager.location?.coordinate.latitude
        let longitude = locationManager.location?.coordinate.longitude
        let location = CLLocationCoordinate2D(latitude: latitude ?? 53.904541,
                                              longitude: longitude ?? 27.561523)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 2000, longitudinalMeters: 2000)
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        map.setRegion(region, animated: true)
    }
}
