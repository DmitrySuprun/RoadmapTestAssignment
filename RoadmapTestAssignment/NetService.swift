//
//  NetService.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 18.08.22.
//

import Foundation

class NetService {
    
    func loadData(completion: @escaping (DataModel) -> ()) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
            do {
                let model = try JSONDecoder().decode(DataModel.self, from: data)
                completion(model)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func loadImage(url: String, completion: @escaping(Data) -> ()) {
        guard let validURL = URL(string: url) else { return }
        URLSession.shared.dataTask(with: validURL) { data, _, _ in
            guard let data = data else { return }
            completion(data)
        }.resume()
    }
    
}
