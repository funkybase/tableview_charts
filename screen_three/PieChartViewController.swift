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
    
    @IBOutlet weak var chart1: PieChartView!
    @IBOutlet weak var chart2: PieChartView!
    @IBOutlet weak var chart3: PieChartView!
    
    
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
        let entries1 = (0..<7).map { (i) -> PieChartDataEntry in
            return PieChartDataEntry(value: Double.random(in: 11.0 ..< 22.0),
                                     label: sparkList[i % sparkList.count])
        }
        //let dataset = PieChartDataSet(entries: entries, label: chillerList[pieCharts.firstIndex(of: chart)!])
        let dataset1 = PieChartDataSet(entries: entries1, label: "")
        dataset1.colors = colorsOfCharts(numberOfColor: 7)
        
        let data1 = PieChartData(dataSet: dataset1)
        
        let format1 = NumberFormatter()
        format1.numberStyle = .none
        let formatter1 = DefaultValueFormatter(formatter: format1)
        data1.setValueFormatter(formatter1)
        
        chart1.data = data1
        
        let entries2 = (0..<7).map { (i) -> PieChartDataEntry in
            return PieChartDataEntry(value: Double.random(in: 11.0 ..< 22.0),
                                     label: sparkList[i % sparkList.count])
        }
        //let dataset = PieChartDataSet(entries: entries, label: chillerList[pieCharts.firstIndex(of: chart)!])
        let dataset2 = PieChartDataSet(entries: entries2, label: "")
        dataset2.colors = colorsOfCharts(numberOfColor: 7)
        
        let data2 = PieChartData(dataSet: dataset2)
        
        let format2 = NumberFormatter()
        format2.numberStyle = .none
        let formatter2 = DefaultValueFormatter(formatter: format2)
        data2.setValueFormatter(formatter2)
        
        chart2.data = data2
        
        let entries3 = (0..<7).map { (i) -> PieChartDataEntry in
            return PieChartDataEntry(value: Double.random(in: 11.0 ..< 22.0),
                                     label: sparkList[i % sparkList.count])
        }
        //let dataset = PieChartDataSet(entries: entries, label: chillerList[pieCharts.firstIndex(of: chart)!])
        let dataset3 = PieChartDataSet(entries: entries3, label: "")
        dataset3.colors = colorsOfCharts(numberOfColor: 7)
        
        let data3 = PieChartData(dataSet: dataset3)
        
        let format3 = NumberFormatter()
        format3.numberStyle = .none
        let formatter3 = DefaultValueFormatter(formatter: format3)
        data3.setValueFormatter(formatter3)
        
        chart3.data = data3
        //}
    }
    
    private func colorsOfCharts(numberOfColor: Int) -> [UIColor] {
        var colors: [UIColor] = []
        for _ in 0..<numberOfColor {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        return colors
    }
    
    @IBAction func pressChartOne(_ sender: Any) {
        self.buttonTapped = 1
        self.performSegue(withIdentifier: "showML", sender: self)
    }
    
    @IBAction func pressChartTwo(_ sender: Any) {
        self.buttonTapped = 3
        self.performSegue(withIdentifier: "showML", sender: self)
    }
    
    @IBAction func pressChartThree(_ sender: Any) {
        self.buttonTapped = 2
        self.performSegue(withIdentifier: "showML", sender: self)
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
