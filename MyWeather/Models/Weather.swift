import Foundation

struct Weather: Codable {
    let main: Main
    let wind: Wind
    let sys: Sys
    let name: String
}

struct Main: Codable {
    let temp: Double
    let pressure, humidity: Int
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}
