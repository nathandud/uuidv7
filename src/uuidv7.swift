import Foundation

extension UUID {
    static func v7() -> Self {
        // current timestamp in ms
        let timestamp: Int = .init(Date().timeIntervalSince1970 * 1000)
        
        let uuid: uuid_t = (
            UInt8((timestamp >> 40) & 0xFF),
            UInt8((timestamp >> 32) & 0xFF),
            UInt8((timestamp >> 24) & 0xFF),
            UInt8((timestamp >> 16) & 0xFF),
            UInt8((timestamp >> 8) & 0xFF),
            UInt8((timestamp >> 0) & 0xFF),
            UInt8.random(in: 0...255) & 0x0F | 0x70, // version
            UInt8.random(in: 0...255),
            UInt8.random(in: 0...255) & 0x3F | 0x80, // variant
            UInt8.random(in: 0...255),
            UInt8.random(in: 0...255),
            UInt8.random(in: 0...255),
            UInt8.random(in: 0...255),
            UInt8.random(in: 0...255),
            UInt8.random(in: 0...255),
            UInt8.random(in: 0...255)
        )
        
        return UUID(uuid: uuid)
    }
}

let uuidVal: UUID = .v7()
print(uuidVal)
