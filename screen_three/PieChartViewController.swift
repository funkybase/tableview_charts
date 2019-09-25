//
//  PieChartViewController.swift
//  screen_three
//
//  Created by Shawn Ng on 25/9/19.
//  Copyright © 2019 Shawn Ng. All rights reserved.
//

import UIKit

class PieChartViewController: UIViewController {
    
    var buttonTapped: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Actions
    @IBAction func tappedChartOne(_ sender: Any) {
        self.buttonTapped = 1
        self.performSegue(withIdentifier: "showML", sender: self)
    }
    
    @IBAction func tappedChartTwo(_ sender: Any) {
        self.buttonTapped = 1
        self.performSegue(withIdentifier: "showML", sender: self)
    }
    
    @IBAction func tappedChartThree(_ sender: Any) {
        self.buttonTapped = 1
        self.performSegue(withIdentifier: "showML", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "showML") {
            if let destinationVC = segue.destination as? MLViewController {
                let chart = "Chart\(self.buttonTapped)"
                destinationVC.chartTitle = chart
            }
        }
    }
    
}
