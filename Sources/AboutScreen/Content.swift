//
//  File.swift
//  
//
//  Created by Lewis Smith on 31/03/2020.
//

import Foundation

// MARK: - Content
public struct Content {
    var header: Header
    var sections: [Section]

    public init(header: Header, sections: [Section]) {
        self.header = header
        self.sections = sections
    }
}

// MARK: - Header
public struct Header {
    let imageName, title, version: String
    let subtitle, tagline: String?

    public init(imageName: String, title: String, version: String, subtile subtitleIn: String? = nil, tagline taglineIn: String? = nil) {
        self.imageName = imageName
        self.title = title
        self.version = version
        self.subtitle = subtitleIn
        self.tagline = taglineIn
    }
}

// MARK: - Section
public struct Section {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }
}

// MARK: - Item
public struct Item {
    var imageName, title: String
    var callback: (() -> Void)?

    public init(imageName: String, title: String, callback: (() -> Void)?) {
        self.imageName = imageName
        self.title = title
        self.callback = callback
    }
}

extension Section {
    var rows: Int {
        return items.count
    }
}
