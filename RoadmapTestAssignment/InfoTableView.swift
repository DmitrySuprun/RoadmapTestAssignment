//
//  InfoTableView.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 22.08.22.
//

import UIKit

class InfoTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var data = [(String, String)]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super .init(frame: frame, style: style)
        register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.reuseID)
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: InfoTableViewCell.reuseID, for: indexPath) as! InfoTableViewCell
        cell.name.text = data[indexPath.row].0
        cell.value.text = data[indexPath.row].1
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1: return "First stage"
        case 2: return "Second stage"
        default: return ""
        }
    }
}
