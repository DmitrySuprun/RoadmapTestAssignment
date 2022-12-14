//
//  InfoTableView.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 22.08.22.
//

import UIKit

class InfoTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var dataItem: DataModel.Item?
    
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
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView()
        let showInfoButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Show info", for: .normal)
            button.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
            button.tintColor = .white
            button.layer.cornerRadius = 5
            button.clipsToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(showInfoButtonPressed(_:)), for: .touchUpInside)
            return button
        }()
        view.addSubview(showInfoButton)
        showInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showInfoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        showInfoButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4).isActive = true
        showInfoButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        return section == 2 ? view : nil
    }
    
    @objc func showInfoButtonPressed(_ sender: UIButton) {
        
        //Get current UINavigationViewController
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        let window = sceneDelegate?.window
        guard let navigationViewController = window?.rootViewController?.presentedViewController as? UINavigationController else { return }
        let viewController = InfoViewController()
        viewController.dataItem = self.dataItem
        navigationViewController.pushViewController(viewController, animated: true)
    }
}
