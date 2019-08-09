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
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTableViewCell", for: indexPath)
        
        let currentPerson =  personsArray[indexPath.row]
        cell.textLabel?.text = "\(currentPerson.name) \(currentPerson.surname)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            vc.sourceStructure = personsArray[indexPath.row]
        }
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
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
