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
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(_isFavorited: true)
            }, failure: { (error) in
                print("Could not favorite tweet: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(_isFavorited: false)
            }, failure: { (error) in
                print("Could not unfavorite tweet: \(error)")
            })
        }
            
            
            
            
    }
        
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(_isRetweeted: true) 
        }, failure: { (error) in
            print("Error retweeting tweet. \(error)")
        })
    }
    
    func setRetweeted (_isRetweeted: Bool){
        if (_isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
            
        }
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
