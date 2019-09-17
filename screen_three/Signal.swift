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
    var data: LineChartData
    
    //MARK: Initialization
    init(values: [Double], label: String) {//add scatter overlay in future
    
        let entries = values.map { (i) -> ChartDataEntry in
            return ChartDataEntry(x: Double(values.firstIndex(of: i)!), y: i)
        }
        let chartDataSet = LineChartDataSet(entries: entries, label: label)
        self.data = LineChartData(dataSet: chartDataSet)
    
    }
    
    
}
