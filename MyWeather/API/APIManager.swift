import Alamofire
import MapKit

struct APIManager {
    static let instanse = APIManager()

    enum Costants {
        static let baseUrl = "https://api.openweathermap.org/data/2.5/weather?"
        static let apiKey = "79ccac55edbc144341cadde0476de449"
    }
    

    // MARK: - Get Weather

        func getCurrencysBy(completion: @escaping ((Weather) -> Void)) {
            AF.request("\(Costants.baseUrl)lat=\(Coordinates.latitude ?? 53.904541)&lon=\(Coordinates.longitude ?? 27.561523)&appid=79ccac55edbc144341cadde0476de449").responseDecodable(of: Weather.self) { response in
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
