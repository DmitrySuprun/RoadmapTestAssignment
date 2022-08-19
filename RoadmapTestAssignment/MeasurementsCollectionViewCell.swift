//
//  MeasurementsCollectionViewCell.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 19.08.22.
//

import UIKit

class MeasurementsCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "MeasurementsCollectionViewCell"
    
    var parameterName: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var parameterValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 35
        clipsToBounds = true
        backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        addSubview(parameterName)
        addSubview(parameterValue)
        
        parameterName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        parameterName.centerYAnchor.constraint(equalTo: topAnchor, constant: frame.height / 3).isActive = true
        
        parameterValue.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        parameterValue.centerYAnchor.constraint(equalTo: topAnchor, constant: frame.height * 2 / 3).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
