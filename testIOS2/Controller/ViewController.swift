//
//  ViewController.swift
//  testIOS2
//
//  Created by Mauricio Zarate on 07/01/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, segueManda {
    func llevaOtra() {
        performSegue(withIdentifier: "lolismo", sender: self)
    }
    
   
     
    private let tableAssasin: UITableView = {
        let table  = UITableView()
        table.register(SimpleTableViewCell.self, forCellReuseIdentifier: SimpleTableViewCell.identifier)
        table.register(imageTableViewCell.nib(), forCellReuseIdentifier: imageTableViewCell.identifier)
        
        table.register(InputTableViewCell.nib(), forCellReuseIdentifier: InputTableViewCell.identifier)
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableAssasin)
        tableAssasin.delegate = self
        tableAssasin.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            tableAssasin.frame = view.bounds
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 1 {
            let cell = tableAssasin.dequeueReusableCell(withIdentifier: InputTableViewCell.identifier, for: indexPath) as! InputTableViewCell
            
            return cell
            
        }
        if indexPath.row < 2 {
            let cell = tableAssasin.dequeueReusableCell(withIdentifier: imageTableViewCell.identifier, for: indexPath) as! imageTableViewCell
            cell.delegate = self
            return cell
            
        }
        let cell = tableAssasin.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier, for: indexPath)
        cell.textLabel?.text = "Fuck"
        return cell
    }
    func goToNextScene() {
        performSegue(withIdentifier: "lolismo", sender: self)
    }
    
}



