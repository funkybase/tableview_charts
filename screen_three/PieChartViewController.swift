//
//  PieChartViewController.swift
//  screen_three
//
//  Created by Shawn Ng on 25/9/19.
//  Copyright © 2019 Shawn Ng. All rights reserved.
//

import UIKit
import Charts

class PieChartViewController: UIViewController {
    
    
    @IBOutlet weak var chart: PieChartView!
    var buttonTapped: Int = 0
    var sparkList = ["Spark 1", "Spark 2", "Spark 3", "Spark 4", "Spark 5", "Spark 6", "Spark 7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCharts()
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
        self.buttonTapped = 2
        self.performSegue(withIdentifier: "showML", sender: self)
    }
    
    @IBAction func tappedChartThree(_ sender: Any) {
        self.buttonTapped = 3
        self.performSegue(withIdentifier: "showML", sender: self)
    }
    
    private func configureCharts() {
        //for chart in pieCharts {
        let entries = (0..<7).map { (i) -> PieChartDataEntry in
            return PieChartDataEntry(value: Double.random(in: 11.0 ..< 22.0),
                                     label: sparkList[i % sparkList.count])
        }
        //let dataset = PieChartDataSet(entries: entries, label: chillerList[pieCharts.firstIndex(of: chart)!])
        let dataset = PieChartDataSet(entries: entries, label: "Chiller 1")
        
        let data = PieChartData(dataSet: dataset)
        
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        data.setValueFormatter(formatter)
        
        self.chart.data = data
        //}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "showML") {
            if let destinationVC = segue.destination as? MLViewController {
                let chart = "Chart \(self.buttonTapped)"
                destinationVC.navigationItem.title = chart
            }
        }
    }
    
}
