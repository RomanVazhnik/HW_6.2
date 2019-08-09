//
//  ListTableViewController.swift
//  HW_6
//
//  Created by Роман Важник on 09/08/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var namesArray = ["Roman", "Dima", "Alex", "Bob", "Steve"]
    var surnamesArray = ["Abramson", "Backer", "Davidson", "Gilson", "Carter"]
    var phoneNumbersArray = ["1405122", "5670133", "1256200", "9563833", "4510432"]
    var emailsArray = ["aaa@gmail.ru", "bbb@gmail.ru", "ссс@gmail.ru", "ddd@gmail.ru", "fff@gmail.ru"]
    
    var personsArray: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createRandomStructure(countOfIterations: namesArray.count)
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return personsArray.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(personsArray[section].name) \(personsArray[section].surname)"
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            headerView.textLabel?.textColor = .white
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.font = UIFont(name: "Kailasa", size: 18)
        cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTableViewCell", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = personsArray[indexPath.section].email
            cell.imageView?.image = UIImage(named: "email")
        } else {
            cell.textLabel?.text = personsArray[indexPath.section].phoneNumber
            cell.imageView?.image = UIImage(named: "phone")
        }
        return cell
    }
    
    private func getRandomNumberFromArray(_ range: Int) -> Int {
        let randomInt = Int.random(in: 0..<range)
        return randomInt
    }

    private func createRandomStructure(countOfIterations: Int) {
        for _ in 0..<countOfIterations {
            
            let range = namesArray.count
            
            let randomNumberForName = getRandomNumberFromArray(range)
            let randomNumberForSurname = getRandomNumberFromArray(range)
            let randomNumberForPhoneNumber = getRandomNumberFromArray(range)
            let randomNumberForEmail = getRandomNumberFromArray(range)
            
            let name = namesArray.remove(at: randomNumberForName)
            let surname = surnamesArray.remove(at: randomNumberForSurname)
            let phoneNumber = phoneNumbersArray.remove(at: randomNumberForPhoneNumber)
            let email = emailsArray.remove(at: randomNumberForEmail)
            
            let newPerson = Person(name: name, surname: surname, phoneNumber: phoneNumber, email: email)
            personsArray.append(newPerson)
            
        }
    }
    
}
