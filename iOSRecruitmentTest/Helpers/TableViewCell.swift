//
//  TableViewCell.swift
//  iOSRecruitmentTest
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var item: Item? {
        didSet {
            if item == nil {
                iconView.image = nil
                itemTitleLabel.text = ""
                itemDescLabel.text = ""
            } else {
                iconView.image = nil
                itemTitleLabel.text = item?.name
                itemDescLabel.text = item?.name
            }
        }
    }
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = 4
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.item = nil
    }
    
}
