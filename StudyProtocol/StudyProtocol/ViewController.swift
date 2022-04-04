//
//  ViewController.swift
//  StudyProtocol
//
//  Created by Doy Kim on 2022/04/04.
//

import UIKit

// 라벨을 바꿔주는 프로토콜을 선언
protocol ChangeLabelDelegate {
    func doChange()
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBAction func buttonGoNextVC(_ sender: Any) {
        
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    var delegate: ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }


}

