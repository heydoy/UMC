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

    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()

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
    
    private func setupAttribute() {
        // register button 글자별 색상 변경
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor!
        
        let attributes = generateButtonAttribute(
            self.registerButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal) // 버튼의 일반적인 상태에서 적용한다는 뜻
        
    }
    
}
