//
//  Model.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 18.08.22.
//

import Foundation

struct DataModel: Decodable {
    
    var item: [Item]
    
    struct LengthUnit: Decodable {
        var meters: Double?
        var feet: Double?
    }
    struct MassUnit: Decodable {
        var kg: Double
        var lb: Double
    }
    struct TorqueUnit: Decodable {
        var kN: Double
        var lbf: Double
    }
    
    struct Item: Decodable {
        var height: LengthUnit
        var diameter: LengthUnit
        var mass: MassUnit
        
        var firstStage: FirstStage
        struct FirstStage: Decodable {
            var thrustSeaLevel: TorqueUnit
            var thrustVacuum: TorqueUnit
            var reusable: Bool
            var engines: Int
            var fuelAmountTons: Double
            var burnTimeSec: Int?
            
            enum CodingKeys: String, CodingKey {
                case thrustSeaLevel = "thrust_sea_level"
                case thrustVacuum = "thrust_vacuum"
                case reusable, engines
                case fuelAmountTons = "fuel_amount_tons"
                case burnTimeSec = "burn_time_sec"
            }
        }
        
        var secondStage: SecondStage
        struct SecondStage: Decodable {
            var thrust: TorqueUnit
            var payloads: Payloads
            struct Payloads: Decodable {
                var compositeFairing: CompositeFairing
                struct CompositeFairing: Decodable {
                    var height: LengthUnit
                    var diameter: LengthUnit
                }
                var option1: String
                
                enum CodingKeys: String, CodingKey {
                    case compositeFairing = "composite_fairing"
                    case option1 = "option_1"
                }
            }
            var reusable: Bool
            var engines: Int
            var fuelAmountTons: Double
            var burnTimeSec: Int?
            
            enum CodingKeys: String, CodingKey {
                case thrust, payloads, reusable, engines
                case fuelAmountTons = "fuel_amount_tons"
                case burnTimeSec = "burn_time_sec"
            }
        }
        
        
        var engines: Engines
        struct Engines: Decodable {
            var isp: Isp
            struct Isp: Decodable {
                var sea_level: Int
                var vacuum: Int
            }
            var thrustSeaLevel: TorqueUnit
            var thrustVacuum: TorqueUnit
            var number: Int
            var type: String
            var version: String
            var layout: String?
            var engineLossMax: Int?
            var propellant1: String
            var propellant2: String
            var thrustToWeight: Double
            
            enum CodingKeys: String, CodingKey {
                case isp, number, type, version, layout
                case thrustSeaLevel = "thrust_sea_level"
                case thrustVacuum = "thrust_vacuum"
                case engineLossMax = "engine_loss_max"
                case propellant1 = "propellant_1"
                case propellant2 = "propellant_2"
                case thrustToWeight = "thrust_to_weight"
                
            }
        }
        
        var landingLegs: LandingLegs
        struct LandingLegs: Decodable {
            var number: Int
            var material: String?
        }
        
        var payloadWeights: [PayloadWeight]
        struct PayloadWeight: Decodable {
            var id: String
            var name: String
            var kg: Int
            var lb: Int
        }
        
        var flickrImages: [String]
        
        var name: String
        var type: String
        var active: Bool
        var stages: Int
        var boosters: Int
        var costPerLaunch: Int
        var successRatePct: Int
        var firstFlight: String
        var country: String
        var company: String
        var wikipedia: String
        var description: String
        var id: String
        
        enum CodingKeys: String, CodingKey {
            case height, diameter, mass, engines, name, type, active, stages, boosters, country, company, wikipedia, description, id
            case firstStage = "first_stage"
            case secondStage = "second_stage"
            case landingLegs = "landing_legs"
            case payloadWeights = "payload_weights"
            case flickrImages = "flickr_images"
            case costPerLaunch = "cost_per_launch"
            case successRatePct = "success_rate_pct"
            case firstFlight = "first_flight"
            
        }
    }
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var array = [Item]()
        while !container.isAtEnd {
            let item = try container.decode(Item.self)
            array.append(item)
        }
        self.item = array
    }
}
