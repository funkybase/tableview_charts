//
//  ChartTableViewController.swift
//  screen_three
//
//  Created by Shawn Ng on 16/9/19.
//  Copyright © 2019 Shawn Ng. All rights reserved.
//

import UIKit
import Charts
class ChartTableViewController: UITableViewController {
    
    //TODO
    // change the color and shape of scatter overlay
    
    //MARK: Properties
    
    var signals = [Signal]()
    var signalCharts = [CombinedChartView]()
    var flagToDisplay: Int = 0
    var inputs = [[Double]]()
    var axisNames = [String]()
    var dragDist = CGFloat()
    let numOfInputs: Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        loadSampleCharts()
        
    }
    
    //    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
    //        // translation: distance panned by user
    @objc func draggedView(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        dragDist = translation.x
        
        chartTranslated(Charts: signalCharts, dX: dragDist, dY: 0.0)
       
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
        let axisName = axisNames[indexPath.row]
        
        cell.signalChart.data = signal.data
        cell.yAxis.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        // set text by calling the function
        cell.yAxis.text = axisName
        cell.signalChart.dragXEnabled = true
        cell.signalChart.setVisibleXRangeMaximum(20)
        cell.signalChart.moveViewToX(15)
        cell.signalChart.doubleTapToZoomEnabled = false
        signalCharts.append(cell.signalChart)
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(ChartTableViewController.draggedView(recognizer:)))
        cell.signalChart.addGestureRecognizer(recognizer)
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
    //Assigning mainChart scroll properties to other charts' scroll properties
    func chartTranslated(Charts: [ChartViewBase], dX: CGFloat, dY: CGFloat) {
        
        var currentMatrix = CGAffineTransform()
        
        for Chart in Charts {
            currentMatrix = __CGAffineTransformMake(Chart.viewPortHandler.touchMatrix.a, Chart.viewPortHandler.touchMatrix.b, Chart.viewPortHandler.touchMatrix.c, Chart.viewPortHandler.touchMatrix.d, dX, dY)
            Chart.viewPortHandler.refresh(newMatrix: currentMatrix, chart: Chart, invalidate: true)
            }
        
    }
    

        

    

    private func loadSampleCharts() {
        generateInputValues(numOfInputs)
        
        //randomize array of indices from 0 to count - 1 of values
        var randomArray = [Int]()
        for var index in 0 ..< (numOfInputs/3) {
            let randomNumber: Int = Int.random(in: 0 ..< numOfInputs)
            
            if randomArray.contains(randomNumber) {
                index = index - 1
            } else {
                randomArray.append(randomNumber)
            }
        }
        
        let suppress = Array(randomArray[..<(randomArray.count/2)]).sorted()
        let alarm = Array(randomArray[((randomArray.count/2) + 1)...]).sorted()
        
        for input in inputs {
            signals += [Signal(values: input, suppressIndex: suppress, alarmIndex: alarm)]
        }
        // make a set axis names method
        setAxisNames()
    }
    
    
    private func generateInputValues(_ num: Int) {
        
        var val1 = [Double]()
        var val2 = [Double]()
        var val3 = [Double]()
        
        switch flagToDisplay {
        case 1:
            //simulate rule_ch2
            //CHWST
            val1 = (0..<num).map { (i) -> Double in
                return Double.random(in: 7.5 ..< 12.0)
            }
            //CHWRT
            val2 = (0..<num).map { (i) -> Double in
                return Double.random(in: 12.0 ..< 15.0)
            }
            //FLOWRATE
            val3 = (0..<num).map { (i) -> Double in
                return Double.random(in: 35.0 ..< 55.0)
            }
            
        case 2:
            //simulate rule_ch8
            //runstat
            val1 = (0..<num).map { (i) -> Double in
                return Double.random(in: 0 ..< 40.0)
            }
            //efficiency
            val2 = (0..<num).map { (i) -> Double in
                return Double(Int.random(in: 0 ... 1)) * 12.8
            }
            
        case 3,4:
            //simulate rule_chwp1
            (val1, val2) = inputsForChwpOneAndTwo(num)
        
//        case 4:
//            //simulate rule_chwp2
//            (val1, val2) = inputsForChwpOneAndTwo(num)
            
        case 5:
            //simulate rule_chwp6
            //VSD
            val1 = (0..<num).map { (i) -> Double in
                return Double(Int.random(in: 0 ... 1)) * 16.8
            }
            //differential pressure
            val2 = (0..<num).map { (i) -> Double in
                return Double.random(in: 3.0 ..< 125.0)
            }
        
        case 6,7:
            //simulate rule_ct2
            (val1, val2, val3) = inputsForCtTwoAndThree(num)
        
//        case 7:
//            //simulate rule_ct3
//            (val1, val2, val3) = inputsForCtTwoAndThree(num)
            
        default:
            //arbitrary sentence
            print("Nothing to do here")
        }
        
        if val3.isEmpty {
            inputs += [val1, val2]
        } else {
            inputs += [val1, val2, val3]
        }
    }
    
    private func inputsForChwpOneAndTwo(_ num: Int) -> ([Double], [Double]) {
        //differential pressure
        let val1: [Double] = (0..<num).map { (i) -> Double in
            return Double.random(in: 3.0 ..< 125.0)
        }
        //setpoint pressure
        let val2: [Double] = (0..<50).map { (i) -> Double in
            return Double(Int.random(in: 0 ... 1)) * 80
        }
        return (val1, val2)
    }
    
    private func inputsForCtTwoAndThree(_ num: Int) -> ([Double], [Double], [Double]) {
        //CWST
        let val1: [Double] = (0..<num).map { (i) -> Double in
            return Double.random(in: 27.0 ..< 31.0)
        }
        //CWRT
        let val2: [Double] = (0..<num).map { (i) -> Double in
            return Double.random(in: 31.0 ..< 34.0)
        }
        //FLOWRATE
        let val3: [Double] = (0..<num).map { (i) -> Double in
            return Double.random(in: 35.0 ..< 55.0)
        }
        return (val1, val2, val3)
    }
    
    private func setAxisNames() {
        switch flagToDisplay {
        case 1:
            axisNames += ["CHWST", "CHWRT", "FLOWRATE"]
        case 2:
            axisNames += ["RUN STATUS", "Efficiency"]
        case 3,4:
            axisNames += ["Differential Pressure", "Setpoint Pressure"]
        case 5:
            axisNames += ["CHWP VSD CMD", "Differential Pressure"]
        case 6,7:
            axisNames += ["CWST", "CWRT", "FLOWRATE"]
        default:
            print("Nothing to do here")
        }
    }
}
