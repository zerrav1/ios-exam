//
//  Model.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//  
//

import Foundation

struct Users: Codable {

    enum CodingKeys: String, CodingKey {
        case results
        case info
    }

    var results: [Results]?
    var info: Info?

    //MARK: RESULTS
    struct Results: Codable {

        enum CodingKeys: String, CodingKey {
            case phone
            case name
            case cell
            case dob
            case email
            case location
        }

        var phone: String?
        var name: Name?
        var cell: String?
        var dob: Dob?
        var email: String?
        var location: Location?
        
        //MARK: NAME
        struct Name: Codable {

            enum CodingKeys: String, CodingKey {
                case last
                case title
                case first
            }

            var last: String?
            var title: String?
            var first: String?
        }
        
        //MARK: DATE OF BIRTH
        struct Dob: Codable {

            enum CodingKeys: String, CodingKey {
                case age
                case date
            }

            var age: Int?
            var date: String?
        }
        
        //MARK: LOCATION
        struct Location: Codable {

            enum CodingKeys: String, CodingKey {
                case coordinates
                case postcode
                case timezone
                case state
                case street
                case country
                case city
            }

            var coordinates: Coordinates?
            var postcode: String?
            var timezone: Timezone?
            var state: String?
            var street: Street?
            var country: String?
            var city: String?
            
            init(from decoder: Decoder) throws {
                
                let container = try decoder.container(keyedBy: CodingKeys.self)
                
                coordinates = try container.decodeIfPresent(Coordinates.self, forKey: .coordinates)
                timezone = try container.decodeIfPresent(Timezone.self, forKey: .timezone)
                state = try container.decodeIfPresent(String.self, forKey: .state)
                street = try container.decodeIfPresent(Street.self, forKey: .street)
                country = try container.decodeIfPresent(String.self, forKey: .country)
                city = try container.decodeIfPresent(String.self, forKey: .city)

                do {
                    postcode = try String(container.decode(Int.self,
                                                           forKey: .postcode))
                }
                catch DecodingError.typeMismatch {
                    postcode = try container.decode(String.self,
                                                    forKey: .postcode)
                }
            }
        }
        
        //MARK: COORDINATES
        struct Coordinates: Codable {

            enum CodingKeys: String, CodingKey {
                case latitude
                case longitude
            }

            var latitude: String?
            var longitude: String?
        }
        
        //MARK: TIMEZONE
        struct Timezone: Codable {

            enum CodingKeys: String, CodingKey {
                case descriptionValue = "description"
                case offset
            }

            var descriptionValue: String?
            var offset: String?
        }
        
        //MARK: STREET
        struct Street: Codable {

            enum CodingKeys: String, CodingKey {
                case number
                case name
            }

            var number: Int?
            var name: String?
        }
    }
    
    
    //MARK: INFO
    struct Info: Codable {

        enum CodingKeys: String, CodingKey {
            case version
            case results
            case seed
            case page
        }

        var version: String?
        var results: Int?
        var seed: String?
        var page: Int?
    }
}

//extension Users: ArrowParsable {
//
//    mutating func deserialize(_ json: JSON) {
//        info <-- json["info"]
//        results <-- json["info"]
//    }
//}
