- name: Generate App Files
  run: |
    mkdir -p GameHub
    
    # Generate Info.plist (Keep your existing Info.plist logic here)
    cat <<'EOF' > GameHub/Info.plist
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>CFBundleExecutable</key>
      <string>GameHub</string>
      <key>CFBundleIdentifier</key>
      <string>com.gamehub.emulator.pro</string>
      <key>CFBundleName</key>
      <string>GameHub</string>
      <key>CFBundlePackageType</key>
      <string>APPL</string>
      <key>CFBundleShortVersionString</key>
      <string>1.1</string>
      <key>CFBundleVersion</key>
      <string>1</string>
      <key>LSRequiresIPhoneOS</key>
      <true/>
      <key>UILaunchStoryboardName</key>
      <string>LaunchScreen</string>
    </dict>
    </plist>
    EOF

    # Create the App Entry Point (This fixes the _main error)
    cat <<'EOF' > GameHub/App.swift
    import SwiftUI

    @main
    struct GameHubApp: App {
        var body: some Scene {
            WindowGroup {
                Text("GameHub Initializing...")
                    .font(.headline)
            }
        }
    }
    EOF

    # Generate Xcode Project
    xcodegen generate
