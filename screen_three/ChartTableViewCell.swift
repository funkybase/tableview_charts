//
//  ChartTableViewCell.swift
//  screen_three
//
//  Created by Shawn Ng on 16/9/19.
//  Copyright © 2019 Shawn Ng. All rights reserved.
//

import UIKit
import Charts

class ChartTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var signalChart: LineChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
