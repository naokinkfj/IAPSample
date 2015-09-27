//
//  ViewController.swift
//  iapsample
//
//  Created by Naoki Fujii on 9/26/15.
//  Copyright © 2015 nfujii. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UITableViewController {
    let productIds = [ProductId.SubscriptionMontyly.rawValue]
    
    var availableProducts: [SKProduct] = [] {
        didSet(oldValue) {
            self.tableView.reloadData()
        }
    }
    
    
    let priceNumberFormatter: NSNumberFormatter = {
        let foramtter = NSNumberFormatter()
        foramtter.formatterBehavior = .Behavior10_4
        foramtter.numberStyle = .CurrencyStyle
        return foramtter
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProductInformation(productIds)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fetchProductInformation(productIds: [String]) {
        let set = Set(productIds)
        let request = SKProductsRequest(productIdentifiers: set)
        request.delegate = self
        request.start()
    }
    
    func configureCell(cell: ProductCell, atIndexPath indexPath: NSIndexPath) {
        let product = availableProducts[indexPath.row]
        cell.nameLabel.text = product.localizedTitle
        cell.priceLabel.text = priceString(product)
    }
    
    func priceString(product: SKProduct) -> String? {
        priceNumberFormatter.locale = product.priceLocale
        return priceNumberFormatter.stringFromNumber(product.price)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableProducts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell",forIndexPath: indexPath) as! ProductCell
        configureCell(cell, atIndexPath: indexPath)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

extension ViewController: SKProductsRequestDelegate {
    func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        availableProducts = response.products
        Logger.d(availableProducts.description)
    }
    
    func request(request: SKRequest, didFailWithError error: NSError) {
        
    }
}
