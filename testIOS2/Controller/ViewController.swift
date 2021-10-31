//
//  ViewController.swift
//  testIOS2
//
//  Created by Mauricio Zarate on 07/01/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, segueManda {
    
    func llevaOtra() {
        performSegue(withIdentifier: "lolismo", sender: self)
    }
     
    private let tableAssasin: UITableView = {
        let table  = UITableView()
        table.register(SimpleTableViewCell.nib(), forCellReuseIdentifier: SimpleTableViewCell.identifier)
        table.register(imageTableViewCell.nib(), forCellReuseIdentifier: imageTableViewCell.identifier)
        table.register(InputTableViewCell.nib(), forCellReuseIdentifier: InputTableViewCell.identifier)
        table.register(GraphTableViewCell.nib(), forCellReuseIdentifier: GraphTableViewCell.identifier)
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableAssasin)
        tableAssasin.delegate = self
        tableAssasin.dataSource = self

        requestCall()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            tableAssasin.frame = view.bounds
    }
    
    func requestCall(){
        let url = "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld"
        AF.request(url,method: .get, encoding : JSONEncoding.default).responseDecodable { (response: AFDataResponse<RequestModel>) in
            print("res: \(String(describing: response.value?.colors))")
            }
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
            let cell = tableAssasin.dequeueReusableCell(withIdentifier: imageTableViewCell.identifier, for: indexPath) as? imageTableViewCell
            cell?.delegate = self
            return cell!
        }
        
        if indexPath.row < 3 {
            let cell = tableAssasin.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier, for: indexPath) as! SimpleTableViewCell
            return cell
        }
     
        
        let cell = tableAssasin.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier, for: indexPath)
        return cell
    }
    func goToNextScene() {
        performSegue(withIdentifier: "lolismo", sender: self)
    }
    
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
