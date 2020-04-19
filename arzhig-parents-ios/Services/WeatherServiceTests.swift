#if os(iOS)
@testable import ArzhigParents
#elseif os(macOS)
@testable import ArzhigParentsMac
#endif
import XCTest

class WeatherServiceTests: XCTestCase {
    func testSampleJSONDecoding() {
        do {
            let sut = try JSONDecoder().decode(RainForecastEnvelope.self, from: sampleJSON)

            XCTAssertEqual(sut.idLieu, "751110")
            XCTAssertEqual(sut.echeance, "202004031650")
            XCTAssertEqual(sut.lastUpdate, "16h35")
            XCTAssertEqual(sut.isAvailable, true)
            XCTAssertEqual(sut.niveauPluieText.count, 1)
            XCTAssertEqual(sut.niveauPluieText.first!, "De16h50 à 17h50 : Pas de précipitations")
            XCTAssertEqual(sut.dataCadran.count, 12)
            XCTAssertEqual(sut.dataCadran.first!.niveauPluieText, "Pas de précipitations")
            XCTAssertEqual(sut.dataCadran.first!.niveauPluie, 1)
            XCTAssertEqual(sut.dataCadran.first!.color, "ffffff")
        } catch {
            XCTFail("Unexpected error \(error)")
        }
    }
    
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
}
