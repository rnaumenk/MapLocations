//
//  ListController.swift
//  MapLocations
//
//  Created by Ruslan on 12/20/18.
//  Copyright © 2018 Ruslan Naumenko. All rights reserved.
//

import UIKit
import MapKit

class ListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate : SetLocationDelegate?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Locations.location.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Locations.location[indexPath.row].0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.delegate?.setNewLocationIndex(indexPath.row)
        self.tabBarController!.selectedViewController = self.tabBarController!.viewControllers?[0]
    }
    
}
