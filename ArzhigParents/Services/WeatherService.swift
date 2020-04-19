import Foundation

struct RainForecastEnvelope: Codable {
    struct FiveMinutesForecast: Codable {
        let niveauPluieText: String
        let niveauPluie: Int
        let color: String
    }
    
    let idLieu: String
    let echeance: String
    let lastUpdate: String
    let isAvailable: Bool
    let hasData: Bool
    let niveauPluieText: [String]
    let dataCadran: [FiveMinutesForecast]
}

struct WeatherService {
    func loadRainForecast() -> Endpoint<RainForecastEnvelope> {
        return Endpoint(
            json: .get,
            url: URL(string: "TODO")!
        )
    }
    
    static let data: RainForecastEnvelope = {
        let sampleJSON = """
        {
          "idLieu" : "751110",
          "echeance" : "202004031650",
          "lastUpdate" : "16h35",
          "isAvailable" : true,
          "hasData" : true,
          "niveauPluieText" : [ "De16h50 à 17h50 : Pas de précipitations" ],
          "dataCadran" : [ {
            "niveauPluieText" : "Pas de précipitations",
            "niveauPluie" : 1,
            "color" : "ffffff"
          }, {
            "niveauPluieText" : "Pas de précipitations",
            "niveauPluie" : 1,
            "color" : "ffffff"
          }, {
            "niveauPluieText" : "Pas de précipitations",
            "niveauPluie" : 1,
            "color" : "ffffff"
          }, {
            "niveauPluieText" : "Pas de précipitations",
            "niveauPluie" : 1,
            "color" : "ffffff"
          }, {
            "niveauPluieText" : "Pas de précipitations",
            "niveauPluie" : 1,
            "color" : "ffffff"
          }, {
            "niveauPluieText" : "Pas de précipitations",
            "niveauPluie" : 1,
            "color" : "ffffff"
          }, {
            "niveauPluieText" : "Pas de précipitations",
            "niveauPluie" : 1,
            "color" : "ffffff"
          }, {
            "niveauPluieText" : "Pas de précipitations",
            "niveauPluie" : 1,
            "color" : "ffffff"
          }, {
            "niveauPluieText" : "Pas de précipitations",
            "niveauPluie" : 1,
            "color" : "ffffff"
          }, {
            "niveauPluieText" : "Pas de précipitations",
            "niveauPluie" : 1,
            "color" : "ffffff"
          }, {
            "niveauPluieText" : "Pas de précipitations",
            "niveauPluie" : 1,
            "color" : "ffffff"
          }, {
            "niveauPluieText" : "Pas de précipitations",
            "niveauPluie" : 1,
            "color" : "ffffff"
          } ]
        }
        """.data(using: .utf8)!

        let res = try! JSONDecoder().decode(RainForecastEnvelope.self, from: sampleJSON)
        return res
    }()
}
