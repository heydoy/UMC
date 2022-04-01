//
//  LoginViewController.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/03/30.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
    var email = String()
    var password = String()
    var userInfo: UserInfo?

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()

    }

    // MARK: - Action
    
    //  텍스트필드가 변경될 때마다 이 메소드가 호출됨
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // 옵셔널: 값이 없을수도, 있을수도 있다.
        let text = sender.text ?? ""
        //print("email : \(text)")
        
        self.loginButton.backgroundColor = text.isValidEmail() ? .facebookColor : .disabledButtonColor
        
        self.email = text

    }
    
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor =
            text.count > 2 ? .facebookColor : .disabledButtonColor
        
        self.password = text
    }
    
    @IBAction func loginButtonDidTapped(_ sender: UIButton) {
        // 회원가입 정보를 전달받아서 그것과 Text Field 데이터가 일치하면 로그인이 되어야 한다.
        guard let userInfo = self.userInfo else {
            return
        }  // userInfo에 정보가 없으면 로그인버튼이 실행 안됨.
        
        // 아이디, 비밀번호 확인
        if userInfo.email == self.email
            && userInfo.password == self.password {
            // print("다음화면으로 이동")
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
        } else {
            print("아이디 또는 패스워드가 일치하지 않습니다.")
        }
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
        
        // 회원가입 화면에서 정보를 전달받을 것
        // 클로저를 사용할  때는 참조에 대한 문제가 생길 수 있으므로 [weak self] 와 self? 옵셔널을 작성해준다.
        // ARC 개념에 대해 알아두면 도움이 될 것. SWIFT에서 처리하는 메모리 관리 방식 중 한가지
        // ARC - 강한 참조는 뷰 컨트롤러가 해제되도 메모리에 남아있어서 메모리 누수의 우려가 생김./약한 참조는 ARC 낮춰줌.
        registerViewController.userInfo = { [weak self](userInfo) in
            //print(userInfo)
            self?.userInfo = userInfo
        }
    }
    
    // MARK: - Helper
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
