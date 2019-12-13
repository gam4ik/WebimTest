//
//  NamesViewController.swift
//  WebimTest
//
//  Created by Gamid on 13.12.2019.
//  Copyright © 2019 Gam4ik. All rights reserved.
//

import UIKit

class NamesViewController: UIViewController {

    private var networkService: Networking = NetWorkService()
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var friendNameN1: UILabel!
    @IBOutlet weak var friendNameN2: UILabel!
    @IBOutlet weak var friendNameN3: UILabel!
    @IBOutlet weak var friendNameN4: UILabel!
    @IBOutlet weak var friendNameN5: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paramsForName = ["first_name": ""]
        networkService.request(path: API.getName, params: paramsForName) { (data, error) in
            if let error = error {
                print("Error received requeasting data: \(error.localizedDescription)")
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let data = data else { return }

            let response = try? decoder.decode(NameResponseWrapped.self, from: data)
            
            guard let userName = response?.response.firstName else { return }
            self.userNameLabel.text = userName
        }
        
        let paramsForFriends = ["count": "5", "fields": "first_name"]
        networkService.request(path: API.getFriends, params: paramsForFriends) { (data, error) in
            if let error = error {
                print("Error received requeasting data: \(error.localizedDescription)")
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let data = data else { return }
            
            let response = try? decoder.decode(FriendsResponseWrapped.self, from: data)
            
            guard let friendsNames = response?.response.items else { return }
            
            self.friendNameN1.text = friendsNames[0].firstName
            self.friendNameN2.text = friendsNames[1].firstName
            self.friendNameN3.text = friendsNames[2].firstName
            self.friendNameN4.text = friendsNames[3].firstName
            self.friendNameN5.text = friendsNames[4].firstName
        }
        
    }

    
    
}
