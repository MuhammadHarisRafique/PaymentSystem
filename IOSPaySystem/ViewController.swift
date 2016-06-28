//
//  ViewController.swift
//  IOSPaySystem
//
//  Created by IOS Developer on 14/06/2016.
//  Copyright © 2016 Slash Global. All rights reserved.


import UIKit
import Alamofire
import Braintree






class ViewController: UIViewController,BTDropInViewControllerDelegate {
  
    
    @IBOutlet weak var payButton: UIButton!
    
   
   var braintree: Braintree?
 // var braintreeClient: BTAPIClient?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
      
//        Alamofire.request(.GET, "http://localhost:3000/client_token").responseJSON { (response) in
//        
//            
//     if let clientToken = response.data {
//        
//        
//        let str = String(data: clientToken, encoding: NSUTF8StringEncoding)
//        print(str!)
//       
//        self.braintreeClient = BTClient(clientToken: str!)
//    
//       
//            }
//            
//        }
        
        let clientTokenURL = NSURL(string: "http://localhost:3000/client_token")!
        let clientTokenRequest = NSMutableURLRequest(URL: clientTokenURL)
        clientTokenRequest.setValue("text/plain", forHTTPHeaderField: "Accept")
        
        NSURLSession.sharedSession().dataTaskWithRequest(clientTokenRequest) { (data, response, error) -> Void in
            // TODO: Handle errors
            let clientToken = String(data: data!, encoding: NSUTF8StringEncoding)
            
            // Initialize `Braintree` once per checkout session
            self.braintree = Braintree(clientToken: clientToken!)
            // As an example, you may wish to present our Drop-in UI at this point.
            // Continue to the next section to learn more...
            }.resume()
        
           }
    
    // Create a BTDropInViewController
    func tappedMyPayButton() {
        
        
        
     // let dropInViewController = BTDropInViewController(client: self.braintreeClient)
     // dropInViewController.delegate = self
      
  
        
        // This is where you might want to customize your view controller (see below)
        // The way you present your BTDropInViewController instance is up to you.
        // In this example, we wrap it in a new, modally-presented navigation controller:
        
        
//   dropInViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel,
//    target: self, action: #selector(ViewController.userDidCancelPayment))
//        
//        let navigationController = UINavigationController(rootViewController: dropInViewController)
//        presentViewController(navigationController, animated: true, completion: nil)
        
        
        let dropInViewController = braintree!.dropInViewControllerWithDelegate(self)
        
        // This is where you might want to customize your Drop-in. (See below.)
        
        // The way you present your BTDropInViewController instance is up to you.
        // In this example, we wrap it in a new, modally presented navigation controller:
        dropInViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: #selector(ViewController.userDidCancelPayment))
        
        let navigationController = UINavigationController(rootViewController: dropInViewController)
        self.presentViewController(navigationController, animated: true, completion: nil)
        
    }
    
    
    
    func dropInViewController(viewController: BTDropInViewController!, didSucceedWithPaymentMethod paymentMethod: BTPaymentMethod!) {
        self.postNonceToServer(paymentMethod.nonce)
        print(paymentMethod.nonce)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func dropInViewControllerDidCancel(viewController: BTDropInViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    
    func postNonceToServer(paymentMethodNonce: String) {
      
        let paymentURL = NSURL(string: "http://localhost:3000/checkout/")!
        let request = NSMutableURLRequest(URL: paymentURL)
        request.HTTPBody = "payment_method_nonce=\(paymentMethodNonce)".dataUsingEncoding(NSUTF8StringEncoding)
        request.HTTPMethod = "POST"
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            }.resume()
    
    }
    
    
    @IBAction func payPressed(sender: AnyObject) {
        
       self.tappedMyPayButton()
        
    }
    
    func userDidCancelPayment() {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


