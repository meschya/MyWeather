import UIKit

final class MapTableViewCell: UITableViewCell {
    // MARK: - Identifier

    static let identifier = "MapTableViewCell"

    // MARK: - Properties

    // MARK: Private

    private let mapView = MapView()

    // MARK: - LIfecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mapView)
        contentView.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 35/255, alpha: 1.0)
        addMapViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Constraints

    // MARK: Private

    private func addMapViewConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        mapView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
