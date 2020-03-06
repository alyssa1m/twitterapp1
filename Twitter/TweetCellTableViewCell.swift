//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Student on 2/25/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var tweetContent: UILabel!
    
    @IBOutlet var retweetButton: UIButton!
    @IBOutlet var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetId: Int = -1
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: self.setFavorite(_isFavorited: true), failure: {(error) in
                print("Favorite did not succeed: \(error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: self.setFavorite(false), failure: {(error) in
                print("unfavorite did not succeed: \(error)")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
    }
    
   
    func setFavorite(_isFavorited:Bool){
        favorited = _isFavorited
    if (favorited) {
        favButton.setImage(UIImage(named:"favor-icon"), for: UIControlState.normal);
    }
}
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
