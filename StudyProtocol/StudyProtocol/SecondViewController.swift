//
//  SecondViewController.swift
//  StudyProtocol
//
//  Created by Doy Kim on 2022/04/04.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate{
    func doChange() {
        previousViewController?.label.text = self.textField.text
    }
    
    @IBOutlet weak var textField: UITextField!
    
    var previousViewController : ViewController?
    
    @IBAction func buttonDismiss(_ sender: Any) {
        doChange()
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //무슨 구조인지 아직 이해불가..
        previousViewController?.delegate = self
    }
    



}
