//  CustomTableViewCell.swift
//  FavoriteBooks
//  Created by .b[u]mpagram on 9/25/23
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var lengthLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   func updateThisCell(with book: Book) {
       // that will set the labels properly for each book cell.
       titleLabel.text = book.title
       authorLabel.text = book.author
       genreLabel.text = book.genre
       lengthLabel.text = book.length
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
