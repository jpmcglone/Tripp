extension Dictionary {
    mutating func mergeIn(_ other: Dictionary) {
        other.forEach { key, value in
            self[key] = value
        }
    }
}
