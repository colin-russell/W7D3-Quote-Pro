//
//  ViewController.swift
//  Quote Pro
//
//  Created by Colin on 2018-05-23.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, QuoteBuilderDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didfinishSaving(quote: Quote) {
        print(quote.quoteText)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let vc: QuoteBuilderViewController = segue.destination as? QuoteBuilderViewController else {
            print("error segue.destination")
            return
        }
        vc.delegate = self        
    }
}

