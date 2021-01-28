//
//  MovieSearchTableViewCell.swift
//  MoovySearch
//
//  Created by Clerin on 1/28/21.
//

import UIKit

class MovieSearchTableViewCell: UITableViewCell {

    
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var movieLabel: UILabel!
    
    
    @IBOutlet weak var starImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
