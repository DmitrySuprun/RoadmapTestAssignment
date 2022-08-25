//
//  SettingsTableViewCell.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 24.08.22.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    static let reuseID = "SettingsTableViewCell"
    
    let measurementType: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TEST"
        label.textColor = .white
        return label
    }()
    
    let typeSegmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl()
        return segmentControl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        
        contentView.addSubview(measurementType)
        measurementType.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        measurementType.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        contentView.addSubview(typeSegmentControl)
        typeSegmentControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        typeSegmentControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
