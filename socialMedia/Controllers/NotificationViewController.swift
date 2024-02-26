//
//  NotificationViewController.swift
//  socialMedia
//
//  Created by Zhamilia Zhanakeeva on 25/2/24.
//

import UIKit
class NotificationViewController: UIViewController {
    private let tableView = UITableView()
    private let idCell = "cell"
    private var users: [User] = []
    private let navBar = NavigationBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notification"
        view.backgroundColor = .white
        setData()
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBar)
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            navBar.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: idCell)
    }
    private func setData() {
        users = [User(name: "Jane Cooper",image: UIImage(named: "jane"), foodImage: UIImage(named: "potato"), action: "has published on a new recipe", date: "09:24 AM", time: "Today"),
                 User(name: "Rachel",image: UIImage(named: "rachel"),foodImage: UIImage(named: "ragu"), action: "has commented on your recipe", date: "1 day ago", time: "14:43 PM"),
                 User(name: "Brad Wigington", image: UIImage(named: "brad"),foodImage: UIImage(named: "nanoosh"), action: "liked your comment", date: "1 day ago", time: "09:29 AM"),
                 User(name: "Katya Mike", image: UIImage(named: "katya"),foodImage: UIImage(named: "healthyFood"), action: "has published a new recipe!", date: "1 day ago", time: "09:45 AM"),
                 User(name: "Nana Hey", image: UIImage(named: "nana"),foodImage: UIImage(named: "meat"), action: "has published a new recipe!", date: "1 day ago", time: "15:30 PM"),
                 User(name: "Bekzat Bey", image: UIImage(named: "bekzat"),foodImage: UIImage(named: "fastFood"), action: "has commented on your recipe", date: "1 day ago", time: "23:45 PM"),
                 User(name: "Bekhan Zhan", image: UIImage(named: "bekhan"),foodImage: UIImage(named: "brewery"), action: "has commented on your recipe", date: "1 day ago", time: "20:30 PM")
        ]
    }
}
    
extension NotificationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! CustomTableViewCell
        cell.sendData(name: users[indexPath.row].name, image: users[indexPath.row].image, foodPicture: users[indexPath.row].foodImage, action: users[indexPath.row].action, date: users[indexPath.row].date, time: users[indexPath.row].time)
        return cell
    }
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

    

    

