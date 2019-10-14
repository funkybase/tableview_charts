//
//  PieChartViewController.swift
//  screen_three
//
//  Created by Shawn Ng on 25/9/19.
//  Copyright © 2019 Shawn Ng. All rights reserved.
//

import UIKit
import Charts
import SideMenu

class PieChartViewController: UIViewController {
    
    @IBOutlet weak var chart1: PieChartView!
    @IBOutlet weak var chart2: PieChartView!
    @IBOutlet weak var chart3: PieChartView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var mappingTable: UITextView!
    
    var alertTimer: Timer?
    
    var buttonTapped: Int = 0
    var sparkList = ["Alarm 1", "Alarm 2", "Alarm 3", "Alarm 4", "Alarm 5", "Alarm 6", "Alarm 7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCharts()
        self.title = "Summation of Alarms per Chiller"
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
        button1.setTitle("\t\t\tChiller 1:\nTotal number of Alarms over 2 weeks: 99\nDate of last downtime: 1st Aug 2019", for: UIControl.State.normal)
        
        button2.setTitle("\t\t\tChiller 2:\nTotal number of Alarms over 2 weeks: 100\nDate of last downtime: 3rd Sept 2019", for: UIControl.State.normal)
        
        button3.setTitle("\t\t\tChiller 3:\nTotal number of Alarms over 2 weeks: 70\nDate of last downtime: 3rd Sept 2019", for: UIControl.State.normal)
        
        alertTimer = Timer.scheduledTimer(timeInterval: 150, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
        mappingTable.text = "Alarm 1:\t\tChilled Water temp high\nAlarm 2:\t\tChiller cycling\nAlarm 3:\t\tPressure differential low\nAlarm 4:\t\tPressure differential high\nAlarm 5:\t\tVSD speeding\nAlarm 6:\t\tCondenser Water temp low\nAlarm 7:\t\tCondenser Water temp high"
        
        mappingTable.font = UIFont(name: mappingTable.font!.fontName, size: 20)
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
        
        //chart1.drawEntryLabelsEnabled = false
        chart1.legend.enabled = false
        chart1.centerText = "Chiller 1"
        
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
        
        //chart2.drawEntryLabelsEnabled = false
        chart2.legend.enabled = false
        chart2.centerText = "Chiller 2"

        
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
        
        //chart3.drawEntryLabelsEnabled = false
        chart3.legend.enabled = false
        chart3.centerText = "Chiller 3"

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
                let chiller = "Alarm Trend Chart for Chiller \(self.buttonTapped)"
                destinationVC.navigationItem.title = chiller
            }
        }
    }
    
    @objc private func runTimedCode() {
        let alertView = UIAlertController(title: "Alarm", message: "New alarm 3 with CWST reading of 8.55 celsius.", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Suppress", style: .cancel, handler: nil))

        alertView.addAction(UIAlertAction(title: "Allow", style: .default, handler: nil))

        self.present(alertView, animated: true) {
            alertView.view.superview?.isUserInteractionEnabled = true
            alertView.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
        }
    }
    
    @objc func alertControllerBackgroundTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
