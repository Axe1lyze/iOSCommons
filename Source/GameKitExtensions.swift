//
//  GameKitExtensions.swift
//  iOSUtils
//
//  Created by Masaharu Tsukamoto on 2022/04/15.
//

import Foundation
import GameKit

extension GameKitUtils {
    var playerLevelLeaderBoard:String { #function }
    var vsRankLeaderBoard:String { #function }
}

class GameKitUtils {
    
    static let shared = GameKitUtils()
    
    var keyWindow: UIWindow? { UIApplication.shared.windows.first { $0.isKeyWindow } }
    var rootViewController:UIViewController? { keyWindow?.rootViewController }
    var player:GKLocalPlayer { GKLocalPlayer.localPlayer() }
    
    func login(authenticateHandler:@escaping (Bool, Error?)->Void) {
        if player.isAuthenticated {
            authenticateHandler(true, nil);
            return
        }
        player.authenticateHandler = {[self] viewController, error in
            guard let viewController = viewController else  {
                authenticateHandler(error != nil, error)
                return
            }
            rootViewController?.present(viewController, animated: true, completion: nil)
        }
    }
    
    func reportScores(_ scores: [GKScore], completionHandler:((Error?)->Void)?){
        GKScore.report(scores, withCompletionHandler: completionHandler)
    }
    
    func loadLeaderboardScores(_ leaderboard:GKLeaderboard, completionHandler: @escaping (GKLeaderboard, [GKScore]?, Error?)->Void) {
        leaderboard.loadScores { completionHandler(leaderboard, $0, $1) }
    }
    
    func matchRequest(_ request:GKMatchRequest, delegate:GKMatchmakerViewControllerDelegate, viewController:UIViewController) {
        guard let matchmakerViewController = GKMatchmakerViewController(matchRequest: request) else { return }
        matchmakerViewController.matchmakerDelegate = delegate
        rootViewController?.present(matchmakerViewController, animated: true, completion: nil)
    }
    
}
