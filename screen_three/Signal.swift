//
//  Signal.swift
//  screen_three
//
//  Created by Shawn Ng on 16/9/19.
//  Copyright © 2019 Shawn Ng. All rights reserved.
//

import Foundation
import Charts

class Signal {
    
    //MARK: Properties
    var data: CombinedChartData
    
    //MARK: Initialization
    init(values: [Double], suppressIndex: [Int], alarmIndex: [Int]) {//add scatter overlay in future
        var entries = [ChartDataEntry]()
        var suppressEntries = [ChartDataEntry]()
        var alarmEntries = [ChartDataEntry]()
        
        for index in 1...values.count {
            let entry = ChartDataEntry(x: Double(index - 1), y: values[index - 1])
            entries.append(entry)
        }
        
        for index in 0..<suppressIndex.count {
            let suppressEntry = ChartDataEntry(x: Double(suppressIndex[index]), y: values[suppressIndex[index]])
            suppressEntries.append(suppressEntry)
        }
        
        for index in 0..<alarmIndex.count {
            let alarmEntry = ChartDataEntry(x: Double(alarmIndex[index]), y: values[alarmIndex[index]])
            alarmEntries.append(alarmEntry)
        }
        
        let chartDataSet = LineChartDataSet(entries: entries, label: "signal")
        chartDataSet.colors = [NSUIColor.black]
        chartDataSet.drawCirclesEnabled = false
        chartDataSet.drawValuesEnabled = false
        let lineData = LineChartData(dataSet: chartDataSet)
        
        let suppressScatterDataSet = ScatterChartDataSet(entries: suppressEntries, label: "suppressed")
        suppressScatterDataSet.colors = [NSUIColor.blue]
        let alarmScatterDataSet = ScatterChartDataSet(entries: alarmEntries, label: "alarm")
        alarmScatterDataSet.colors = [NSUIColor.red]
        let scatterData = ScatterChartData(dataSets: [suppressScatterDataSet, alarmScatterDataSet])
        
        let combinedData = CombinedChartData()
        combinedData.lineData = lineData
        combinedData.scatterData = scatterData
        
        self.data = combinedData
        //add scatterchartdata: dataSets
        //change to combinedchartdata
    }
    
    
}
