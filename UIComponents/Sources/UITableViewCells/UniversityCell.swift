//
//  UniversityCell.swift
//  
//
//  Created by Emad Habib on 14/07/2024.
//

import UIKit

public final class UniversityCell: UITableViewCell {

    @IBOutlet private weak var nameLbl: UILabel!
    @IBOutlet private weak var stateLbl: UILabel!
    
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configCell(with item: UniversityCellItemProtocol?) {
        guard let item else { return }
        nameLbl.text = item.universityName
        stateLbl.text = item.universityState
    }
    
}
