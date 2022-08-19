//
//  ViewController.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 16.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    var model: DataModel!
    
    let measurementsCollectionView = MeasurementsCollectionView()
    
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
        button.setTitle("Hello", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupScrollView()
        setupViews()
        
        let randomItem = Int.random(in: 0...model.item.count - 1)
        let item = model.item[randomItem]
        measurementsCollectionView.measurementsData.append((String(item.height.meters ?? 0),"Height"))
        measurementsCollectionView.measurementsData.append((String(item.diameter.meters ?? 0),"Diameter"))
        measurementsCollectionView.measurementsData.append((String(item.mass.kg),"Mass"))
        measurementsCollectionView.measurementsData.append((String(item.payload_weights[0].kg),"Pay load"))

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
        
        contentView.addSubview(measurementsCollectionView)
        measurementsCollectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        measurementsCollectionView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        measurementsCollectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        measurementsCollectionView.heightAnchor.constraint(equalToConstant: 120).isActive = true


        contentView.addSubview(button)
        button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: measurementsCollectionView.bottomAnchor, constant: 20).isActive = true
        button.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/2).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

