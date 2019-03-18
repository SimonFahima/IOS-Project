//
//  ViewController.swift
//  IOSProject_chaimFahima
//
//  Created by hackeru on 11/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDataDelegate, URLSessionDelegate{
    
    var color: UIColor!
    var imageBalls: UIImage!
    var imageCrazy: UIImage!
    var imageViewCeazy: UIImageView!
    var imageLotto: UIImage!
    var imageView: UIImageView!
    var luckyBtn: UIButton!
    var luckyNum1: UILabel!
    var luckyNum2: UILabel!
    var luckyNum3: UILabel!
    var luckyNum4: UILabel!
    var luckyNum5: UILabel!
    var luckyNum6: UILabel!
    var luckyNum7: UILabel!
    var flag: Bool = true
    var imgFlag: Bool = true
    var counterImgFlag: Int = 0
    var imgArray: [String] = ["crazyblue", "crazyorange", "crazyred", "crazybastard", "crazyblueblue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getAnswerFromServer()
        imageBalls = UIImage(named: "balls")
        luckyBtn = UIButton(type: .system)
        luckyBtn.frame = CGRect(x: 5, y: 100, width: 400, height: 200)
        luckyBtn.setBackgroundImage(imageBalls, for: .normal)
        luckyBtn.titleColor(for: .highlighted)
        luckyBtn.tintColor = .black
        luckyBtn.backgroundColor = .lightGray
        luckyBtn.setTitle("Feeling lucky?" +
            " click here for lucky numbers!" , for: .normal)
        luckyBtn.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        view.addSubview(luckyBtn)
        
        
        
        imageLotto = UIImage(named: "lotto")
        imageView = UIImageView(frame: CGRect(x: 0, y: 523, width: 400, height: 300))
        imageView.image = imageLotto
        imageView.startAnimating()
        view.addSubview(imageView)
        
        
        
        
    
        
        
    }
    
    @objc func buttonClicked(sender: UIButton){
        
    
        luckyNum1 = UILabel(frame: CGRect(x: 0, y: 310, width: 60, height: 100))
        luckyNum2 = UILabel(frame: CGRect(x: 70, y: 310, width: 60, height: 100))
        luckyNum3 = UILabel(frame: CGRect(x: 140, y: 310, width: 60, height: 100))
        luckyNum4 = UILabel(frame: CGRect(x: 210, y: 310, width: 60, height: 100))
        luckyNum5 = UILabel(frame: CGRect(x: 280, y: 310, width: 60, height: 100))
        luckyNum6 = UILabel(frame: CGRect(x: 350, y: 310, width: 60, height: 100))
        
        luckyNum7 = UILabel(frame: CGRect(x: 220, y: 420, width: 200, height: 100))
        
        
        
        luckyNum1.textAlignment = .center
        luckyNum2.textAlignment = .center
        luckyNum3.textAlignment = .center
        luckyNum4.textAlignment = .center
        luckyNum5.textAlignment = .center
        luckyNum6.textAlignment = .center
        luckyNum7.textAlignment = .center
        
        var array: [Int] = []
        var counter: Int = 0
        var currentNum: Int = 0
        while flag{
            if counter == 0{
                currentNum = Int.random(in: 1...37)
                array.append(currentNum)
                counter += 1
            }else{
                currentNum = Int.random(in: 1...37)
                if !array.contains(currentNum){
                    array.append(currentNum)
                    counter += 1
                }
            }
            if counter == 6{
                flag = false
            }
            
        }
        flag = true
        
        
        luckyNum1.text = String(array[0])
        luckyNum2.text = String(array[1])
        luckyNum3.text = String(array[2])
        luckyNum4.text = String(array[3])
        luckyNum5.text = String(array[4])
        luckyNum6.text = String(array[5])
        luckyNum7.text = String(Int.random(in: 1...7))
        luckyNum7.textColor = .white
        
        
        luckyNum1.font = luckyNum1.font.withSize(40)
        luckyNum2.font = luckyNum2.font.withSize(40)
        luckyNum3.font = luckyNum3.font.withSize(40)
        luckyNum4.font = luckyNum4.font.withSize(40)
        luckyNum5.font = luckyNum5.font.withSize(40)
        luckyNum6.font = luckyNum6.font.withSize(40)
        luckyNum7.font = luckyNum7.font.withSize(100)
        
        
        luckyNum1.backgroundColor = determineColor(number: array[0])
        luckyNum2.backgroundColor = determineColor(number: array[1])
        luckyNum3.backgroundColor = determineColor(number: array[2])
        luckyNum4.backgroundColor = determineColor(number: array[3])
        luckyNum5.backgroundColor = determineColor(number: array[4])
        luckyNum6.backgroundColor = determineColor(number: array[5])
        luckyNum7.backgroundColor = .blue
        
        if counterImgFlag == 5{
            counterImgFlag = 0
        }
        imageLotto = UIImage(named: imgArray[counterImgFlag])
        counterImgFlag += 1
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 415, width: 200, height: 100))
        imageView.image = imageLotto
        view.addSubview(imageView)
        
        
        
        view.addSubview(luckyNum1)
        view.addSubview(luckyNum2)
        view.addSubview(luckyNum3)
        view.addSubview(luckyNum4)
        view.addSubview(luckyNum5)
        view.addSubview(luckyNum6)
        view.addSubview(luckyNum7)
        
        
    }
    
    func determineColor(number: Int)-> UIColor{
        print("number is \(number)")
        if number > 0 && number < 10{
            color = .yellow
            print("yellow")
        }else if number > 9 && number < 20{
            color = .red
            print("red")
        }else if number > 19 && number < 30{
            color = .orange
            print("orange")
        }else if number > 29 && number < 38{
            color = .cyan
            print("cyan")
        }

        return color
    }
   
//    func randomNumbersForFirstSix()-> Int{
//        var min: Int = 1
//        var max: Int = 37
//        var number = { ( min: Int,max: Int) -> Int in
//
//        }
//        return number
//    }
    
    
    
//    func getAnswerFromServer(){
//        session = URLSession(configuration: URLSessionConfiguration.default)
//        let url = URL(string: "http://localhost:8080/MainServlet")!
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "GET"
//        let s = "num1=3&num2=4&operator=+"
//        let data = s.data(using: String.Encoding.utf8)!
//        let task = session.uploadTask(with: urlRequest, from: data) { (data: Data?, urlResponse: URLResponse?, error: Error?) in
//            if error == nil{
//                if let theData = data{
//                    print(String(data: theData, encoding: String.Encoding.utf8)!)
//                    print("is main thread ? \(Thread.current.isMainThread)")
//                }
//            }
//            self.session.finishTasksAndInvalidate()
//        }
//
//        task.resume()
//    }
    
//    func getAnswerFromServer(){
//        session = URLSession(configuration: URLSessionConfiguration.default)
//        let url = URL(string: "http://localhost:8081/IOSServlet")!
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "GET"
////        let dog = Dog(name: "Snoopy", age: 100)
//        let task = session.uploadTask(with: urlRequest, from: dog.getData()) { (data: Data?, urlResponse: URLResponse?, error: Error?) in
//            if error == nil{
//                if let theData = data{
//                    print(String(data: theData, encoding: String.Encoding.utf8)!)
//                    print("is main thread ? \(Thread.current.isMainThread)")
//                }
//            }
//            self.session.finishTasksAndInvalidate()
//        }
//
//        task.resume()
//    }
}
