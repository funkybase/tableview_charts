//
//  Spark.swift
//  MultiLineChart
//
//  Created by Ariel on 18/9/19.
//  Copyright © 2019 Ariel. All rights reserved.
//

import Foundation
import Charts

class Spark {
    var data: LineChartData
    //MARK: Initialization
    init(sparkValues: [Double]...) {
        
        let data = LineChartData()
        
        let colours = [NSUIColor.blue, NSUIColor.black, NSUIColor.red, NSUIColor.yellow, NSUIColor.green, NSUIColor.purple, NSUIColor.gray, NSUIColor.orange, NSUIColor.brown, NSUIColor.magenta]
        
        var random = [Int]()
        
        for var i in 0 ..< colours.count {
            let randomNumber: Int = Int.random(in: 0 ..< colours.count)
            
            if random.contains(randomNumber) {
                i -= 1
            }
            else {
                random.append(randomNumber)
            }
        }
        var label: Int = 1
        var counter: Int = 0
        
        //Mapping Spark Value to Chart
        for sparkValue in sparkValues{
            var lineChartEntry = [ChartDataEntry]()
            
            let labelEntry = "Spark\(label)"
            for i in 0..<sparkValue.count {
                let value = ChartDataEntry(x: Double(i), y: sparkValue[i])
                lineChartEntry.append(value)
            }
            let line = LineChartDataSet(entries: lineChartEntry, label: labelEntry)
            line.colors = [colours[random[counter]]]
            line.setCircleColor(.black)
            line.circleRadius = 3
            data.addDataSet(line)
            counter += 1
            label += 1
        }
        
        self.data = data
        random = [Int]()
        
    }
}
