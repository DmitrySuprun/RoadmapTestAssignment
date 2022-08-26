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
        
        let items = ["m", "ft"]
        let segmentControl = UISegmentedControl(items: items)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.tintColor = .white
        segmentControl.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        segmentControl.addTarget(self, action: #selector(segmentControlChangeValue(_:)), for: .valueChanged)
        return segmentControl
    }()
    
    @objc func segmentControlChangeValue(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: print(sender.titleForSegment(at: 0))
        case 1: print(sender.titleForSegment(at: 1))
        default: return
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .black
        
        contentView.addSubview(measurementType)
        measurementType.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        measurementType.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        contentView.addSubview(typeSegmentControl)
        typeSegmentControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        typeSegmentControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        typeSegmentControl.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 3 / 4).isActive = true
        typeSegmentControl.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
