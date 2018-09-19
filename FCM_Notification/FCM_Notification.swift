//
//  FCMNotification.swift
//
//  Created by Cyril Garcia on 5/31/17.
//  Copyright © 2017 By Cyril. All rights reserved.
//

import UIKit

class FCMNotification {
    
    private var serverKey: String?
    private var myToken: String?
    
    init(_ serverKey: String) {
        self.serverKey = key
    }
    
    public func sendMessage(title: String, body: String, toKey: String) {
        
        print("mykey \(String(describing: serverKey))")
        let url = NSURL(string: "https://fcm.googleapis.com/fcm/send")

        let postParams = ["to": "\(toKey)", "notification": ["body": body, "title": title, "sound": "enable", "badge": 1]] as [String : Any]
        
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("key=\(serverKey!)", forHTTPHeaderField: "Authorization")
        
        do
        {
            request.httpBody = try JSONSerialization.data(withJSONObject: postParams, options: JSONSerialization.WritingOptions())
            print("My paramaters: \(postParams)")
        }
        catch
        {
            print("Caught an error: \(error)")
        }
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if let realResponse = response as? HTTPURLResponse
            {
                if realResponse.statusCode != 200
                {
                    print("Not a 200 response")
                }
            }
            
            if let postString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as String?
            {
                print("POST: \(postString)")
            }
        }
        
        task.resume()
    }

}
