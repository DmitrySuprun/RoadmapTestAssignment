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
        super .init(frame: frame, style: .insetGrouped)
        register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.reuseID)
        delegate = self
        dataSource = self
        backgroundColor = .black
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView()
        var content = header.defaultContentConfiguration()
        content.textProperties.font = .preferredFont(forTextStyle: .title1)
        content.textProperties.alignment = .natural
        content.textProperties.color = .white
        switch section {
        case 1: content.text = "First stage"
        case 2: content.text =  "Second stage"
        default: content.text = ""
        }
        header.contentConfiguration = content
        return header
    }
}
