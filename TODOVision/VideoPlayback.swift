import SwiftUI
import AVKit


struct VideoPlayerView: View {
    let videoURL: URL
    @Binding var isPlaying: Bool // Binding to track video playing state
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: videoURL))
            .onAppear {
                self.isPlaying = true // Update the video playing state when the view appears
            }
            .onDisappear {
                self.isPlaying = false // Update the video playing state when the view disappears
            }
            .edgesIgnoringSafeArea(.all)
    }
}
