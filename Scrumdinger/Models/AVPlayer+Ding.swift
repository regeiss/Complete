//
//  AVPlayer+Ding.swift
//  Scrumdinger
//
//  Created by Roberto Edgar Geiss on 05/05/22.
//

import Foundation
import AVFoundation

extension AVPlayer
{
    static let sharedDingPlayer: AVPlayer =
    {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}
