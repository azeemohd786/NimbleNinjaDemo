//
//  LionGenerator.swift
//  Nimble Ninja
//
//  Created by Mohammed Azeem Azeez on 28/08/2021.
//  Copyright © 2021 CrashCourseCode. All rights reserved.
//

import Foundation
import SpriteKit

class LionGenerator: SKSpriteNode {
    
    var generationTimer: Timer?
    var lions = [Lion]()
    var lionsTrackers = [Lion]()
    
    func startGeneratingLionsEvery(seconds: TimeInterval) {
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(generateLion), userInfo: nil, repeats: true)
        
    }
    
    func stopGenerating() {
        generationTimer?.invalidate()
    }
    
    @objc func generateLion() {
        var scale: CGFloat
        let rand = arc4random_uniform(2)
        if rand == 0 {
            scale = 1.0
        } else {
            scale = 1.0
        }
        
        let enemy = Lion()
        enemy.position.x = size.width/2 + enemy.size.width/2
        enemy.position.y = scale * (kMLGroundHeight/2 + enemy.size.height/2)
        lions.append(enemy)
        lionsTrackers.append(enemy)
        addChild(enemy)
    }
    
    func stopLions() {
        stopGenerating()
        for enemy in lions {
            enemy.stopMoving()
        }
    }
    
}

