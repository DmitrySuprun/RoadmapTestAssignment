//
//  MeasurementsCollectionView.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 19.08.22.
//

import UIKit

class MeasurementsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var measurementsData = [(String, String)]()
    
    let dataItem: DataModel.Item
    
    init (_ item: DataModel.Item) {
        
        self.dataItem = item
        self.measurementsData.append((String(self.dataItem.height.meters ?? 0),"Height"))
        self.measurementsData.append((String(self.dataItem.diameter.meters ?? 0),"Diameter"))
        self.measurementsData.append((String(self.dataItem.mass.kg),"Mass"))
        self.measurementsData.append((String(self.dataItem.payloadWeights[0].kg),"Pay load"))
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)

        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        backgroundColor = .black
        register(MeasurementsCollectionViewCell.self, forCellWithReuseIdentifier: MeasurementsCollectionViewCell.reuseID)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return measurementsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MeasurementsCollectionViewCell.reuseID, for: indexPath) as! MeasurementsCollectionViewCell
        cell.parameterName.text = measurementsData[indexPath.row].0
        cell.parameterValue.text = measurementsData[indexPath.row].1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
