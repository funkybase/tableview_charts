//
//  MLViewController.swift
//  screen_three
//
//  Created by Shawn Ng on 20/9/19.
//  Copyright © 2019 Shawn Ng. All rights reserved.
//

import UIKit
import iOSDropDown

class MLViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var ruleSelect: DropDown!
    
    var idToLoad : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureDropdown()
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
        }
    }
    
    //MARK: Private methods
    private func configureDropdown() {
        // Do any additional setup after loading the view.
        ruleSelect.optionArray = ["Spark 1", "Spark 2", "Spark 3", "Spark 4", "Spark 5", "Spark 6", "Spark 7"]
        //Its Id Values and its optional
        ruleSelect.optionIds = [1,2,3,4,5,6,7]
        
        ruleSelect.didSelect{(selectedText , index ,id) in
            self.idToLoad = id
        }
    }

}
