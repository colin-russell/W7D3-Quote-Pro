//
//  NetworkManager.swift
//  Quote Pro
//
//  Created by Colin on 2018-05-23.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

import UIKit
import Nuke

class NetworkManager: NSObject {
    
    func fetchImage() {
        
    }
    
    func getRandomQuote(handler: @escaping (_ quoteText : String, _ quoteAuthor : String) -> Void) {
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
        
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription)
            }
            
            guard let results = try! JSONSerialization.jsonObject(with: data!, options: []) as? [String : String] else {
                print("Invalid JSON")
                return
            }
            
            let text = results["quoteText"] ?? "nil"
            let author = results["quoteAuthor"] ?? "nil"
            
            handler(text, author)
            
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
