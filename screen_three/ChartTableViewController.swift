//
//  ChartTableViewController.swift
//  screen_three
//
//  Created by Shawn Ng on 16/9/19.
//  Copyright © 2019 Shawn Ng. All rights reserved.
//

import UIKit

class ChartTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var signals = [Signal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        loadSampleCharts()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return signals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChartCell", for: indexPath) as? ChartTableViewCell else {
            fatalError("The dequeued cell is not an instance of ChartCell")
        }
        
        let signal = signals[indexPath.row]

        cell.signalChart.data = signal.data
        // Configure the cell...

        return cell
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
    
    //MARK: Private Methods
    private func loadSampleCharts() {
        //randomize scatter plot index
        let val1: [Double] = (0..<10).map { (i) -> Double in
            return Double.random(in: 10.0 ..< 20.0)
        }
        
        let val2: [Double] = (0..<10).map { (i) -> Double in
            return Double.random(in: 15.0 ..< 25.0)
        }
        
        let val3: [Double] = (0..<10).map { (i) -> Double in
            return Double.random(in: 5.0 ..< 15.0)
        }
        
        let signal1 = Signal(values: val1, label: "CHWST")
        let signal2 = Signal(values: val2, label: "CWST")
        let signal3 = Signal(values: val3, label: "CHWRT")
        
        signals += [signal1, signal2, signal3]
    }

}
