//
//  DummyData.swift
//  FoldableCellExample
//
//  Created by 김민성 on 3/24/25.
//

import UIKit

let dummySettings: [DataModel] = [
    DataModel(
        title: "Wi-Fi",
        icon: UIImage(systemName: "wifi"),
        summary: "Connected to Home Network",
        details: "Your device is connected to 'Home Network'. The connection is stable, and the internet speed is optimal. Tap to switch networks or manage settings."
    ),
    DataModel(
        title: "Bluetooth",
        icon: UIImage(systemName: "bolt.horizontal"),
        summary: "On - Connected to AirPods",
        details: "Your Bluetooth is enabled, and you are currently connected to 'AirPods Pro'. Other available devices will be listed when searching."
    ),
    DataModel(
        title: "Airplane Mode",
        icon: UIImage(systemName: "airplane"),
        summary: "Disabled",
        details: "Airplane Mode is currently turned off. Enabling it will disable Wi-Fi, Bluetooth, and cellular connections temporarily."
    ),
    DataModel(
        title: "Notifications",
        icon: UIImage(systemName: "bell"),
        summary: "Enabled - 5 unread",
        details: "Your notifications are turned on. You have 5 unread notifications from various apps. Adjust settings to customize alert styles and sounds."
    ),
    DataModel(
        title: "Sound & Haptics",
        icon: UIImage(systemName: "speaker.wave.2"),
        summary: "Volume: 50%, Haptics: On",
        details: "Your system volume is set to 50%. Haptic feedback is enabled for interactions. Adjust settings for ringtones, alerts, and vibrations."
    ),
    DataModel(
        title: "Screen Time",
        icon: UIImage(systemName: "hourglass"),
        summary: "Daily Average: 3h 15m",
        details: "You have spent an average of 3 hours and 15 minutes on your device today. Set app limits and downtime to manage screen usage."
    ),
    DataModel(
        title: "General",
        icon: UIImage(systemName: "gear"),
        summary: "Software Update Available",
        details: "A new software update (iOS 17.1) is available for download. Keeping your device updated ensures security and new features."
    ),
    DataModel(
        title: "Privacy & Security",
        icon: UIImage(systemName: "lock.shield"),
        summary: "Location Services: On",
        details: "Your location services are enabled. Some apps may request access to your location for better functionality and personalization."
    ),
    DataModel(
        title: "Battery",
        icon: UIImage(systemName: "battery.100"),
        summary: "Battery Health: 85%",
        details: "Your battery health is at 85%. To extend battery lifespan, consider using optimized charging and avoiding extreme temperatures."
    ),
    DataModel(
        title: "Display & Brightness",
        icon: UIImage(systemName: "sun.max"),
        summary: "Brightness: 75%, Dark Mode: Off",
        details: "Your screen brightness is set at 75%. Dark Mode is currently disabled. Adjust settings to reduce eye strain in low-light conditions."
    ),
    DataModel(
        title: "Wallpaper",
        icon: UIImage(systemName: "photo"),
        summary: "Current: Default, Zoom: On",
        details: "You are using the default wallpaper with perspective zoom enabled. Choose from dynamic, still, or live wallpapers for a personalized look."
    ),
    DataModel(
        title: "Siri & Search",
        icon: UIImage(systemName: "mic"),
        summary: "Hey Siri: On",
        details: "Siri is enabled and always listening for 'Hey Siri'. You can adjust voice commands, shortcuts, and app suggestions in the settings."
    ),
    DataModel(
        title: "Face ID & Passcode",
        icon: UIImage(systemName: "faceid"),
        summary: "Face ID: Enabled, Passcode: Set",
        details: "Face ID is set up for secure authentication. A passcode is also required for added security when biometric authentication is unavailable."
    ),
    DataModel(
        title: "Emergency SOS",
        icon: UIImage(systemName: "exclamationmark.triangle"),
        summary: "Hold Side Button: On",
        details: "Emergency SOS is enabled. Holding the side button will quickly call emergency services and notify your emergency contacts."
    ),
    DataModel(
        title: "App Store",
        icon: UIImage(systemName: "app.badge"),
        summary: "Auto Updates: On",
        details: "Your apps are set to update automatically when connected to Wi-Fi. Manage settings to enable or disable updates for specific apps."
    ),
    DataModel(
        title: "Wallet & Apple Pay",
        icon: UIImage(systemName: "creditcard"),
        summary: "Cards: 3, Transactions: Enabled",
        details: "You have 3 payment cards added to Apple Pay. Transactions are enabled, allowing for contactless payments at supported locations."
    ),
    DataModel(
        title: "Passwords & Accounts",
        icon: UIImage(systemName: "key"),
        summary: "Saved Passwords: 45",
        details: "You have 45 saved passwords stored securely in iCloud Keychain. AutoFill is enabled for seamless login experiences across apps and websites."
    ),
    DataModel(
        title: "Mail",
        icon: UIImage(systemName: "envelope"),
        summary: "Accounts: 2, Unread: 8",
        details: "You have 2 email accounts linked, with 8 unread messages. Adjust sync frequency and notification settings to manage your inbox."
    ),
    DataModel(
        title: "Contacts",
        icon: UIImage(systemName: "person.2"),
        summary: "Synced: iCloud, Favorites: 12",
        details: "Your contacts are synced with iCloud. You have 12 favorite contacts for quick access. Edit contact groups and sync settings as needed."
    ),
    DataModel(
        title: "Calendar",
        icon: UIImage(systemName: "calendar"),
        summary: "Next Event: Meeting at 3 PM",
        details: "Your next scheduled event is a meeting at 3 PM. Manage events, sync with other accounts, and receive reminders for upcoming schedules."
    )
]


import UIKit

struct Movie {
    var title: String
    var icon: UIImage? // 영화 장르 아이콘
    var shortDescription: String // 한 줄 요약
    var detailedDescription: String // 2~3줄 설명
}

let movieData: [Movie] = [
    Movie(
        title: "Inception",
        icon: UIImage(systemName: "brain.head.profile"),
        shortDescription: "A mind-bending sci-fi thriller.",
        detailedDescription: "A skilled thief enters people's dreams to steal secrets. But when given the task to plant an idea instead, things get dangerously complex."
    ),
    Movie(
        title: "Interstellar",
        icon: UIImage(systemName: "globe"),
        shortDescription: "A journey beyond the stars.",
        detailedDescription: "In a future where Earth is dying, a team of astronauts embarks on a journey through a wormhole to find a new home for humanity."
    ),
    Movie(
        title: "The Dark Knight",
        icon: UIImage(systemName: "theatermasks"),
        shortDescription: "The rise of Gotham's hero.",
        detailedDescription: "Batman faces his greatest challenge yet as the Joker wreaks havoc on Gotham, testing the limits of justice and morality."
    ),
    Movie(
        title: "Titanic",
        icon: UIImage(systemName: "figure.sailing"),
        shortDescription: "A legendary love story at sea.",
        detailedDescription: "A young aristocrat falls in love with a poor artist aboard the ill-fated Titanic, as tragedy looms on the horizon."
    ),
    Movie(
        title: "The Matrix",
        icon: UIImage(systemName: "terminal"),
        shortDescription: "What is real?",
        detailedDescription: "A hacker discovers the shocking truth about reality and joins a rebellion to fight against the machines that control humanity."
    ),
    Movie(
        title: "Avengers: Endgame",
        icon: UIImage(systemName: "person.3.fill"),
        shortDescription: "The ultimate battle for the universe.",
        detailedDescription: "The Avengers assemble one last time to undo the destruction caused by Thanos and restore balance to the universe."
    ),
    Movie(
        title: "Parasite",
        icon: UIImage(systemName: "house.fill"),
        shortDescription: "A dark tale of class struggle.",
        detailedDescription: "A poor family infiltrates the lives of a wealthy household, leading to unexpected and shocking consequences."
    ),
    Movie(
        title: "The Lion King",
        icon: UIImage(systemName: "pawprint.fill"),
        shortDescription: "A classic tale of bravery.",
        detailedDescription: "A young lion cub must reclaim his rightful place as king after the tragic loss of his father."
    ),
    Movie(
        title: "Forrest Gump",
        icon: UIImage(systemName: "figure.walk"),
        shortDescription: "An extraordinary life story.",
        detailedDescription: "Follow the journey of Forrest Gump, a kind-hearted man who unwittingly influences key moments in history."
    ),
    Movie(
        title: "Joker",
        icon: UIImage(systemName: "theatermasks"),
        shortDescription: "The making of a villain.",
        detailedDescription: "A failed comedian's descent into madness sparks a citywide revolution, leading him to embrace his chaotic alter ego."
    ),
    Movie(
        title: "Gladiator",
        icon: UIImage(systemName: "shield.fill"),
        shortDescription: "A warrior's revenge.",
        detailedDescription: "A betrayed Roman general fights for his freedom and seeks vengeance against the corrupt emperor who destroyed his family."
    ),
    Movie(
        title: "The Shawshank Redemption",
        icon: UIImage(systemName: "lock.open.fill"),
        shortDescription: "Hope can set you free.",
        detailedDescription: "A banker wrongfully imprisoned for murder befriends a fellow inmate and finds hope in an unlikely place."
    ),
    Movie(
        title: "The Godfather",
        icon: UIImage(systemName: "crown.fill"),
        shortDescription: "The rise of a crime empire.",
        detailedDescription: "A reluctant son of a mafia boss is drawn into the world of organized crime, shaping his destiny in the process."
    ),
    Movie(
        title: "Pulp Fiction",
        icon: UIImage(systemName: "book.fill"),
        shortDescription: "A nonlinear crime masterpiece.",
        detailedDescription: "A series of interconnected stories involving hitmen, a boxer, and a gangster's wife unfold in a unique storytelling style."
    ),
    Movie(
        title: "The Lord of the Rings",
        icon: UIImage(systemName: "leaf.fill"),
        shortDescription: "A grand fantasy adventure.",
        detailedDescription: "A young hobbit embarks on a perilous journey to destroy a powerful ring and save Middle-earth."
    ),
    Movie(
        title: "Saving Private Ryan",
        icon: UIImage(systemName: "chevron.compact.up"),
        shortDescription: "A harrowing WWII mission.",
        detailedDescription: "A group of soldiers embarks on a dangerous mission to find and bring home a missing paratrooper."
    ),
    Movie(
        title: "The Silence of the Lambs",
        icon: UIImage(systemName: "eye.fill"),
        shortDescription: "A psychological thriller.",
        detailedDescription: "A young FBI trainee seeks help from a brilliant but twisted psychiatrist to catch a serial killer."
    ),
    Movie(
        title: "Coco",
        icon: UIImage(systemName: "music.quarternote.3"),
        shortDescription: "A journey into the afterlife.",
        detailedDescription: "A young boy with a passion for music embarks on an adventure in the Land of the Dead to uncover his family's secrets."
    ),
    Movie(
        title: "Spider-Man: Into the Spider-Verse",
        icon: UIImage(systemName: "ant.fill"),
        shortDescription: "A multiversal adventure.",
        detailedDescription: "Teenager Miles Morales discovers his abilities and meets different versions of Spider-Man from across the multiverse."
    ),
    Movie(
        title: "Up",
        icon: UIImage(systemName: "balloon.fill"),
        shortDescription: "An uplifting adventure.",
        detailedDescription: "A grumpy old man and an eager young scout embark on an unforgettable journey to South America using a house lifted by balloons."
    )
]
