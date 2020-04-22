//
//  MenuViewController.swift
//  SlideInTransition
//
//  Created by Gary Tokman on 1/12/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home
    case camera
    case profile
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var didTapMenuType: ((String) -> Void)?
    
    
var names = ["Brent Berg", "Cody Preston", "Kareem Dixon", "Xander Clark",
             "Francis Frederick", "Carson Hopkins", "Anthony Nguyen", "Dean Franklin",
             "Jeremy Davenport", "Rigel Bradford", "John Ball", "Zachery Norman",
             "Valentine Lindsey", "Slade Thornton", "Jelani Dickson", "Vance Hurley",
             "Wayne Ellison", "Kasimir Mueller", "Emery Pruitt", "Lucius Lawrence",
             "Kenneth Mendez"]

var tableView: UITableView!
var selectedIndexPath: IndexPath?

override func viewDidLoad() {
    super.viewDidLoad()
    let width: CGFloat = view.bounds.width * 2 / 3
    view.frame = CGRect(x: 0, y: 0, width: width , height: self.view.bounds.height)
    tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NameCell")

    view.addSubview(tableView)
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell")!
    cell.textLabel?.text = names[indexPath.row]
    return cell
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selectedIndexPath = indexPath
    tableView.deselectRow(at: indexPath, animated: true)
    dismiss(animated: true) { [weak self] in
        print("Dismissing: \(self!.names[indexPath.row])")
        self?.didTapMenuType?(self!.names[indexPath.row])
    }
}
    
}
