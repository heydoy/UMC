import UIKit

/* 1. 변수와 상수 */
// 1.1 상수
let name: String = "San"
let catName = "San"

// option키를 누르고 변수를 클릭하면 타입을 확인할 수 있다.

// 1.2 변수
// 값을 수정할 수 있다.
var year: Int = 2022
year = 2023
print(year)

/* 2. 함수 */

func sum (a: Int, b: Int) -> Int {
    return a + b
}

print(sum(a:3, b:7))

// return 값을 생략해도 정상적으로 출력되는 것을 볼 수 있다.

func multiply(a: Int, b: Int) -> Int {
    a * b
}

print(multiply(a: 4, b: 3))

/* 3. 이름짓기*/
// 3.1 Lower Camel Case - 인스턴스/메소드/함수 생성할 때 사용
// 시작은 소문자, 나머지 단어의 시작글자가 대문자

let viewController = UIViewController()

// 3.2 Upper Camel Case - 구조체/클래스/프로토콜 선언 시 사용
// 시작도 대문자, 나머지 단어의 시작글자도 대문자

struct Person {
    let a: Int
    let b: Int
}

class Operator {
    let a: Int
    let b: Int
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
}

protocol Flyable {
    func fly()
    // 해당 프로토콜을 채택한 객체가 구체적인 코드를 구현 
}

