import Foundation
import AVFoundation
struct PromptSound {
	let right_sound: AVAudioPlayer
	let wrong_sound: AVAudioPlayer
	init() {
		let soundPath_0 = URL(fileURLWithPath: Bundle.main.path(forResource: "right", ofType: "caf")!)
		right_sound = try! AVAudioPlayer(contentsOf: soundPath_0)
		let soundPath_1 = URL(fileURLWithPath: Bundle.main.path(forResource: "wrong", ofType: "caf")!)
		wrong_sound = try! AVAudioPlayer(contentsOf: soundPath_1)
	}
	func play(_ play: Bool, sound: AVAudioPlayer) {
		sound.stop()
		if play {
			sound.currentTime = 0
			sound.volume = 0.8
			sound.prepareToPlay()
			sound.play()
		}
	}
}
