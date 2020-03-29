//
//  RPAppBoardViewController.swift
//
//  Created by Ryan Peters on 2/1/19.
//  Copyright © 2019 Ryan Peters. All rights reserved.
//

import UIKit

class RPAppBoardViewController: UIViewController {
    
    var tableView = UITableView()
    var appArray = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appArray = readPropertyList()

        setupTableView()
    }

    func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.register(RPAppBoardTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
        
        view.addSubview(tableView)
    }

    func readPropertyList() -> [[String:AnyObject]] {
        let url = Bundle.main.url(forResource: "apps", withExtension: "plist")!
        let soundsData = try! Data(contentsOf: url)
        do {
            let pListData = try PropertyListSerialization.propertyList(from: soundsData, options: [], format: nil)
            guard let unwrappedPListData = pListData as? [[String:AnyObject]] else { return [[String:AnyObject]]() }
            return unwrappedPListData
        }
        catch {
            return [[String:AnyObject]]()
        }
    }
}

extension RPAppBoardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RPAppBoardTableViewCell
        let thisApp = appArray[indexPath.row]
        
        if let title = thisApp["name"] as? String, let description = thisApp["description"] as? String, let image = thisApp["iconFilename"] as? String {
            
            let appInfo = RPAppInfo(iconFilename: image,
                                    title: title,
                                    description: description)
            cell.updateViews(with: appInfo)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thisApp = appArray[indexPath.row]
        guard let urlString = thisApp["link"] as? String, let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
}
