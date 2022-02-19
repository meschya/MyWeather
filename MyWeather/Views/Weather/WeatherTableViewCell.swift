import UIKit

final class WeatherTableViewCell: UITableViewCell {
    // MARK: - Identifier

    static let identifier = "WeatherTableViewCell"

    // MARK: - Properties

    // MARK: Private

    let weatherView = WeatherView()

    // MARK: - LIfecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(weatherView)
        contentView.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 35/255, alpha: 1.0)
        addWeatherViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Constraints

    // MARK: Private

    private func addWeatherViewConstraints() {
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        weatherView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        weatherView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        weatherView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        weatherView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
