//
//  ViewController.swift
//  StudyProtocol2
//
//  Created by Doy Kim on 2022/04/04.
//

import UIKit
// protocol을 통해 Person 클래스에 기능을 부여할 것
protocol Flyable {
    func fly()
}

protocol Runnable {
    func run()
}

class Person : Flyable, Runnable {
    func fly() {
        print("난다")
    }
    
    func run() {
        print("뛴다")
    }

}

class ViewController: UIViewController {
    
    let person = Person()

    override func viewDidLoad() {
        super.viewDidLoad()

        person.fly()
        person.run()
    }


}

