//
//  DetailViewController.swift
//  HW_6
//
//  Created by Роман Важник on 09/08/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameSurnameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    var sourceStructure: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForLabels()
    }
    
    private func setupForLabels() {
        nameSurnameLabel.text = "\(sourceStructure.name) \(sourceStructure.surname)"
        emailLabel.text = sourceStructure.email
        phoneNumberLabel.text = sourceStructure.phoneNumber
    }
}
