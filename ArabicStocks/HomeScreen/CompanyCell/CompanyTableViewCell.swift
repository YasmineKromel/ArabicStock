//
//  CompanyTableViewCell.swift
//  ArabicStocks
//
//  Created by Yasmina Sobhi on 12/6/19.
//  Copyright © 2019 Yasmina. All rights reserved.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var market: UILabel!
    @IBOutlet weak var sector: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var percentage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    func setup(company: Company?) {
        guard let com = company else {
            return
        }
        name.text = com.name
        market.text = com.market
        sector.text = com.sector
        price.text = String(describing: com.price ?? 0.0)
        percentage.text = String(describing: com.changePercentage ?? 0.0) + " %"
    }
    
}
