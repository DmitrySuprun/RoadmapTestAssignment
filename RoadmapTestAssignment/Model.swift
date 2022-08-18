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
        
        var first_stage: FirstStage
        struct FirstStage: Decodable {
            var thrust_sea_level: TorqueUnit
            var thrust_vacuum: TorqueUnit
            var reusable: Bool
            var engines: Int
            var fuel_amount_tons: Double
            var burn_time_sec: Int?
        }
        
        var second_stage: SecondStage
        struct SecondStage: Decodable {
            var thrust: TorqueUnit
            var payloads: Payloads
            struct Payloads: Decodable {
                var composite_fairing: CompositeFairing
                struct CompositeFairing: Decodable {
                    var height: LengthUnit
                    var diameter: LengthUnit
                }
                var option_1: String
            }
            var reusable: Bool
            var engines: Int
            var fuel_amount_tons: Double
            var burn_time_sec: Int?
        }
        
        
        var engines: Engines
        struct Engines: Decodable {
            var isp: Isp
            struct Isp: Decodable {
                var sea_level: Int
                var vacuum: Int
            }
            var thrust_sea_level: TorqueUnit
            var thrust_vacuum: TorqueUnit
            var number: Int
            var type: String
            var version: String
            var layout: String?
            var engine_loss_max: Int?
            var propellant_1: String
            var propellant_2: String
            var thrust_to_weight: Double
        }
        
        var landing_legs: LandingLegs
        struct LandingLegs: Decodable {
            var number: Int
            var material: String?
        }
        
        var payload_weights: [PayloadWeight]
        struct PayloadWeight: Decodable {
            var id: String
            var name: String
            var kg: Int
            var lb: Int
        }
        
        var flickr_images: [String]
        
        var name: String
        var type: String
        var active: Bool
        var stages: Int
        var boosters: Int
        var cost_per_launch: Int
        var success_rate_pct: Int
        var first_flight: String
        var country: String
        var company: String
        var wikipedia: String
        var description: String
        var id: String
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
