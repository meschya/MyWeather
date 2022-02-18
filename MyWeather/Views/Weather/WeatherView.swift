import UIKit

final class WeatherView: UIView {
    // MARK: - Properties

    // MARK: Private

    private let stackView: UIStackView = .init()
    private let geolocationLabel: UILabel = .init()
    private let scaleLabel: UILabel = .init()

    // MARK: - LIfecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addSetups()
        addStackViewConstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addStackViewConstraint() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(geolocationLabel)
        stackView.addArrangedSubview(scaleLabel)
    }
    
    private func addSetups() {
        addViewSetups()
        addStackViewSetups()
        addGeolocationLabelSetups()
        addScaleLabelSetups()
    }
    
    private func addViewSetups() {
        backgroundColor = UIColor(red: 36/255, green: 34/255, blue: 49/255, alpha: 1.0)
        layer.cornerRadius = 15
    }
    
    private func addStackViewSetups() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
    }
    
    private func addGeolocationLabelSetups() {
        geolocationLabel.text = "Minsk"
        geolocationLabel.textAlignment = .left
        geolocationLabel.textColor = .white
        geolocationLabel.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private func addScaleLabelSetups() {
        scaleLabel.text = "9º"
        scaleLabel.textAlignment = .right
        scaleLabel.textColor = .white
        scaleLabel.font = .systemFont(ofSize: 60, weight: .bold)
    }
}
