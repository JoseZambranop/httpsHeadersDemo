//
//  ViewController.swift
//  httpsHeadersDemo
//
//  Created by Jose Luis Zambrano on 29/12/21.
//

import UIKit

class ViewController: UIViewController {

    var authorization: String = encodeBase64Credentials(user: "jon", password: "Cenpos@2014")
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://test.cenpos.net:9443/apis/merchants/10000009/login")
            var request = URLRequest(url: url!)
            //request.httpMethod = "GET"
            request.addValue("Basic \(authorization)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            URLSession.shared.dataTask(with: request){(data,response,error) in
                if let data = data {
                    if let jsonString = String(data: data, encoding: .utf8){
                        print(jsonString)
                    }
                }
            }.resume()
    }
    private static func encodeBase64Credentials(user: String, password: String) -> String {
            guard let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8) else {
                return ""
            }
            return credentialData.base64EncodedString(options: [])
    }



}

