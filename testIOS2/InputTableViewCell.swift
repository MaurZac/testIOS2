//
//  InputTableViewCell.swift
//  testIOS2
//
//  Created by Mauricio Zarate on 10/01/21.
//

import UIKit

class InputTableViewCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var userName: UITextField!
    static let identifier  = "InputTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "InputTableViewCell", bundle: nil)
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        userName.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
                    do {
                        let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
                        if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                            return false
                        }
                        guard let textFieldText = userName.text,
                                    let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                                        return false
                                }
                                let substringToReplace = textFieldText[rangeOfTextToReplace]
                                let count = textFieldText.count - substringToReplace.count + string.count
                                return count <= 10
                    }
                    catch {
                        print("ERROR")
                    }
                
                return true
        }
    
}
