//
//  ViewController.swift
//  Quote Pro
//
//  Created by Colin on 2018-05-23.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, QuoteBuilderDelegate {
    
    var quotes = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didfinishSaving(quote: Quote) {
        print(quote.quoteText)
        quotes.append(quote)
        tableView.reloadData()
    }
    
    //MARK: UITableView Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0;//Choose your custom row height
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "Cell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? QuoteTableViewCell  else {
            fatalError("The dequeued cell is not an instance of QuoteTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let quote = quotes[indexPath.row]
        
        cell.quoteLabel.text = quote.quoteText
        cell.authorLabel.text = quote.quoteAuthor
        cell.quoteImage.image = quote.quoteImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = quotes[indexPath.row]
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        present(vc, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let vc: QuoteBuilderViewController = segue.destination as? QuoteBuilderViewController else {
            print("error segue.destination")
            return
        }
        vc.delegate = self        
    }
}

