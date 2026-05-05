import SwiftUI
import GameController

@main
struct GameHubApp: App {
    var body: some Scene {
        WindowGroup {
            MainContainerView()
        }
    }
}

struct MainContainerView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LibraryView()
                .tabItem { Label("Library", systemImage: "house.fill") }.tag(0)
            
            CloudStreamView()
                .tabItem { Label("Cloud", systemImage: "icloud.fill") }.tag(1)
            
            EmulatorView()
                .tabItem { Label("Emulator", systemImage: "cpu") }.tag(2)
            
            DiscoveryView()
                .tabItem { Label("Store", systemImage: "cart.fill") }.tag(3)
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Core Components

struct LibraryView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("PC Integrations") {
                    HStack { Image(systemName: "desktopcomputer"); Text("Steam Library Linked") }
                    HStack { Image(systemName: "shredder"); Text("Epic Games Store Sync") }
                }
            }
            .navigationTitle("My Games")
        }
    }
}

struct CloudStreamView: View {
    var body: some View {
        VStack {
            Text("Cloud Gaming Engine").font(.headline)
            Text("Low Latency Stream Active").font(.caption).foregroundColor(.green)
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
                .overlay(Text("Remote Session Preview"))
                .padding()
        }
    }
}

struct EmulatorView: View {
    var body: some View {
        VStack {
            Image(systemName: "terminal.fill").font(.largeTitle)
            Text("PC Environment Emulator")
            Button("Launch Offline Session") {
                // Logic for local .exe interpretation
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct DiscoveryView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Trending Now").font(.title2).bold().padding(.horizontal)
                ForEach(0..<5) { _ in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: 150)
                        .padding([.horizontal, .bottom])
                }
            }
        }
    }
}
