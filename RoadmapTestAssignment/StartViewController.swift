//
//  StartViewController.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 19.08.22.
//

import UIKit

class StartViewController: UIViewController {
    
    let service = NetService()
    var model: DataModel!
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .white
        button.tintColor = .darkGray
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(startButtonPressed(_:)), for: .touchUpInside)
        // disable button while load data
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        service.loadData { model in
            self.model = model
            
            let item = model.item[Int.random(in: 0..<model.item.count)]
            let imageUrl = item.flickrImages[Int.random(in: 0..<item.flickrImages.count)]
            
            self.service.loadImage(url: imageUrl) { data in
                DispatchQueue.main.async {
                    self.backgroundImageView.image = UIImage(data: data)
                    self.startButton.isEnabled = true
                }
            }
        }
    }
    
    @objc func startButtonPressed(_ sender: UIButton) {
        
        let viewController = PageViewController(data: model)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }
    
    private func setupViews() {
        
        view.addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(startButton)
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        startButton.heightAnchor.constraint(equalTo: startButton.widthAnchor, multiplier: 1/2).isActive = true
        
        
    }
}
