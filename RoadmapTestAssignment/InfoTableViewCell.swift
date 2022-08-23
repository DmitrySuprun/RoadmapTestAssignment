//
//  InfoTableViewCell.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 22.08.22.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    static let reuseID = "InfoTableViewCell"
    
    let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let value: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .black
        
        contentView.addSubview(name)
        name.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        contentView.addSubview(value)
        value.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        value.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
