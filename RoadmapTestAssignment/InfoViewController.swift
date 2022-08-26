//
//  InfoViewController.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 26.08.22.
//

import UIKit

class InfoViewController: UIViewController {
    
    var dataItem: DataModel.Item?
    
    let textDescription: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .black
        textView.textColor = .white
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(textDescription)
        textDescription.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        textDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        textDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textDescription.text = dataItem?.description
    }
}
