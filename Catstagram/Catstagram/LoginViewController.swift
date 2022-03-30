//
//  LoginViewController.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/03/30.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email = String()
    var password = String()

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    //  텍스트필드가 변경될 때마다 이 메소드가 호출됨
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // 옵셔널: 값이 없을수도, 있을수도 있다.
        let text = sender.text ?? ""
        //print("email : \(text)")
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButtonDidTapped(_ sender: UIButton) {
    }
    
    @IBAction func registerButtonDidTapped(_ sender: UIButton) {
        // 화면전환
        // 1. 스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 2. 뷰컨트롤러를 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        // 3. 화면전환 메소드를 이용해서 화면을 전환
//        self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    
    
}
