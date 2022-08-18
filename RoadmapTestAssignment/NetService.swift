//
//  NetService.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 18.08.22.
//

import Foundation

class NetService {
    func loadData() {
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(DataModel.self, from: data)
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
}
