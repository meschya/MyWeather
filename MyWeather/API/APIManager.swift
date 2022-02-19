import Alamofire
import MapKit

struct APIManager {
    static let instanse = APIManager()

    enum Costants {
        static let baseUrl = "https://api.openweathermap.org/data/2.5/weather?"
        static let apiKey = "APPID=79ccac55edbc144341cadde0476de449"
    }

    private let params = ["lat": Coordinates.latitude, "lon": Coordinates.longitude]

    // MARK: - Get Weather

    func getCurrencysBy(completion: @escaping ((Weather) -> Void)) {
        AF.request(Costants.baseUrl + Costants.apiKey, method: .get, parameters: params).responseDecodable(of: Weather.self) { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error)
            }
        }
    }

    private init() {}
}
