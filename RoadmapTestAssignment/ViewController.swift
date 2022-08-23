//
//  ViewController.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 16.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    var modelItem: DataModel.Item
    
    let measurements = MeasurementsCollectionView()
    
    let info = InfoTableView()
    
    let scrollView = UIView()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Falcon Heavy"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let setupButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        var config = UIImage.SymbolConfiguration(pointSize: 40, weight: UIImage.SymbolWeight.medium)
        button.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        button.tintColor = .white
        return button
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Show info", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(data: DataModel.Item) {
        self.modelItem = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupScrollView()
        setupViews()
        
        measurements.measurementsData.append((String(modelItem.height.meters ?? 0),"Height"))
        measurements.measurementsData.append((String(modelItem.diameter.meters ?? 0),"Diameter"))
        measurements.measurementsData.append((String(modelItem.mass.kg),"Mass"))
        measurements.measurementsData.append((String(modelItem.payloadWeights[0].kg),"Pay load"))
        
        info.data.append(("First flight", String(modelItem.firstFlight)))
        info.data.append(("Country", String(modelItem.country)))
        info.data.append(("Cost", String(modelItem.costPerLaunch)))
        
        info.data.append(("Engines count", String(modelItem.firstStage.engines)))
        info.data.append(("Fuel amount", String(modelItem.firstStage.fuelAmountTons)))
        info.data.append(("Burn time", String(modelItem.firstStage.burnTimeSec ?? 0)))
        
        info.data.append(("Engines count", String(modelItem.secondStage.engines)))
        info.data.append(("Fuel amount", String(modelItem.secondStage.fuelAmountTons)))
        info.data.append(("Burn time", String(modelItem.secondStage.burnTimeSec ?? 0)))
                
        DispatchQueue.main.async {
            self.info.reloadData()
        }

    }
    
    func setupScrollView() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
    }
    
    func setupViews(){
        
        contentView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        contentView.addSubview(setupButton)
        setupButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
        setupButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        setupButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        setupButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        contentView.addSubview(measurements)
        measurements.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        measurements.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        measurements.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        measurements.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        contentView.addSubview(button)
        button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/2).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        contentView.addSubview(info)
        info.translatesAutoresizingMaskIntoConstraints = false
        info.topAnchor.constraint(equalTo: measurements.bottomAnchor).isActive = true
        info.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        info.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        info.bottomAnchor.constraint(equalTo: button.topAnchor).isActive = true
    }
}

