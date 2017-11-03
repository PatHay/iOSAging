//
//  ViewController.swift
//  agingPeople
//
//  Created by Patrick Hayes on 11/2/17.
//  Copyright © 2017 Patrick Hayes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var people = ["Adam", "Bill", "Chuck", "David", "Elva", "Fred", "George", "Hector", "Ivan", "Jimbo", "Keith", "Lauren"]
    
    var ages: [String] = []
    
    func randomAgeGenerator() {
        var x: Int = 0
        while x < people.count {
            ages.append(String(Int(arc4random_uniform(UInt32(99))+1)))
            x += 1
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        randomAgeGenerator()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = people[indexPath.row]
        cell.detailTextLabel?.text = ages[indexPath.row] + " years old"

        return cell
    }
    
}
