import Foundation

FileManager.documentDirectoryURL
let remindersDataURL = URL(fileURLWithPath: "Reminders",
                           relativeTo: FileManager.documentDirectoryURL)

let stringURL = FileManager.documentDirectoryURL.appendingPathComponent("String")
    .appendingPathExtension("txt")

let challengeString: String = "challenge"
let challengeURL: URL = URL(fileURLWithPath: challengeString, relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")
challengeURL.lastPathComponent

let favoriteBytes: [UInt8] = [
240,            159,            152,            184,
240,            159,            152,            185,
0b1111_0000,    0b1001_1111,    0b1001_1000,    186,
0xf0,           0x9F,           0x98,           187
]

MemoryLayout<UInt8>.size * favoriteBytes.count

// Saving & Loading Data

let favoriteBytesData = Data(favoriteBytes)
let favoriteBytesURL = URL(fileURLWithPath: "Favorite Bytes", relativeTo: FileManager.documentDirectoryURL)

try favoriteBytesData.write(to: favoriteBytesURL)
let savedFavoriteBytesData = try Data(contentsOf: favoriteBytesURL)
let savedFavoriteBytes = Array(savedFavoriteBytesData)

favoriteBytes == savedFavoriteBytes
favoriteBytesData == savedFavoriteBytesData

// String

try favoriteBytesData.write(to: favoriteBytesURL.appendingPathExtension("txt"))
let string = String(data: savedFavoriteBytesData, encoding: .utf8)

// Challenge: String Data
let catsURL = URL(fileURLWithPath: "Cats.txt", relativeTo: FileManager.documentDirectoryURL)
try string?.write(to: catsURL, atomically: true, encoding: .utf8)
let readStr = try String(contentsOf: catsURL)
