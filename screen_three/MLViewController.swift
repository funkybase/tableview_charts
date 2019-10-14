//
//  MLViewController.swift
//  screen_three
//
//  Created by Shawn Ng on 20/9/19.
//  Copyright © 2019 Shawn Ng. All rights reserved.
//

import UIKit
import iOSDropDown
import Charts

class MLViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var ruleSelect: DropDown!
    @IBOutlet weak var MLChart: LineChartView!
    @IBOutlet weak var axisLabel: UILabel!
    @IBOutlet weak var mapTable: UITextView!
    
    var idToLoad : Int = 1
    var numbers = [Double]()
    var numbers2 = [Double]()
    var numbers3 = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureDropdown()
        
        configureChart()
        
        axisLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        mapTable.text = "Alarm 1:\t\t\tChilled Water temp high\nAlarm 2:\t\t\tChiller cycling\nAlarm 3:\t\t\tPressure differential low\nAlarm 4:\t\t\tPressure differential high\nAlarm 5:\t\t\tVSD speeding\nAlarm 6:\t\t\tCondenser Water temp low\nAlarm 7:\t\t\tCondenser Water temp high"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ChartTableViewController {
            destinationVC.flagToDisplay = self.idToLoad
            destinationVC.navigationItem.title = "Alarm \(self.idToLoad) Associated Signals over two week period"
        }
    }
    
    //MARK: Private methods
    private func configureDropdown() {
        // Do any additional setup after loading the view.
        ruleSelect.optionArray = ["Alarm 1", "Alarm 2", "Alarm 3", "Alarm 4", "Alarm 5", "Alarm 6", "Alarm 7"]
        //Its Id Values and its optional
        ruleSelect.optionIds = [1,2,3,4,5,6,7]
        
        ruleSelect.didSelect{(selectedText , index ,id) in
            self.idToLoad = id
        }
        
        //ruleSelect.textColor = NSUIColor.black
        ruleSelect.borderColor = UIColor.black
        ruleSelect.rowBackgroundColor = UIColor.black
    }
    
    private func randomiseInputs(){
        numbers = (0..<20).map { (i) -> Double in
            return Double.random(in: 10.0 ..< 20.0)}
        
        numbers2 = (0..<20).map { (i) -> Double in
            return Double.random(in: 10.0 ..< 20.0)}
        
        numbers3 = (0..<20).map { (i) -> Double in
            return Double.random(in: 10.0 ..< 20.0)}
    }
    
    private func configureChart() {
        randomiseInputs()
        
        let chart = Spark(sparkValues: numbers, numbers2, numbers3)
        
        MLChart.data = chart.data
        
        MLChart.xAxis.labelTextColor = UIColor.white
        MLChart.leftAxis.labelTextColor = UIColor.white
        MLChart.legend.textColor = UIColor.white
        
    }

}
