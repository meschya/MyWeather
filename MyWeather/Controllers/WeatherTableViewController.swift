import UIKit

final class WeatherTableViewController: UITableViewController {
    // MARK: - Properties

    // MARK: Private

    private let sections: [String] = ["Weather", "Map"]
    private var weather: Weather? {
        didSet {
            self.tableView.reloadData()
        }
    }

    // MARK: - LIfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addTableViewSetups()
        getWeather()
    }

    // MARK: - API

    private func getWeather() {
        APIManager.instanse.getCurrencysBy { weather in
            self.weather = weather
            print(weather)
        }
    }

    // MARK: - Setups

    // MARK: Private

    private func addTableViewSetups() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 35/255, alpha: 1.0)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section] == "Weather" {
            return 150
        } else if sections[indexPath.section] == "Map" {
            return 400
        }
        return 150
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: header.bounds.width, height: header.bounds.height)
        header.textLabel?.textAlignment = .left
        header.textLabel?.textColor = .white
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if sections[indexPath.section] == "Weather" {
            tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
            if let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell {
                cell.weatherView.set(weather?.name ?? "None", weather?.main.temp ?? 0, weather?.sys.country ?? "None")
                return cell
            }
        }
        if sections[indexPath.section] == "Map" {
            tableView.register(MapTableViewCell.self, forCellReuseIdentifier: MapTableViewCell.identifier)
            if let cell = tableView.dequeueReusableCell(withIdentifier: MapTableViewCell.identifier, for: indexPath) as? MapTableViewCell {
                return cell
            }
        }
        return UITableViewCell()
    }
}
