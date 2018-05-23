//
//  Quote.swift
//  Quote Pro
//
//  Created by Colin on 2018-05-23.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

import UIKit

class Quote: NSObject {
    var quoteText = ""
    var quoteAuthor = ""
    var photo = Photo()
    
    func getRandomQuote(handler: @escaping () -> Void) {
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
            
            print(results["quoteText"]!)
            self.quoteText = results["quoteText"] ?? "nil"
            self.quoteAuthor = results["quoteAuthor"] ?? "nil"
            handler()
            
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
