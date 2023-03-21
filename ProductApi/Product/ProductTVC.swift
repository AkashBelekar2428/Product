//
//  ProductTVC.swift
//  ProductApi
//
//  Created by Akash Belekar on 16/03/23.
//

import UIKit

class ProductTVC: UITableViewCell {
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var descriptionLbl:UILabel!
    @IBOutlet weak var priceLbl:UILabel!
    @IBOutlet weak var ratingLbl:UILabel!
    @IBOutlet weak var stockLbl:UILabel!
    @IBOutlet weak var brandLBl:UILabel!
    @IBOutlet weak var categoriLbl:UILabel!
    @IBOutlet weak var productImg:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
