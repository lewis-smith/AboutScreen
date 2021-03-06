//
//  File.swift
//  
//
//  Created by Lewis Smith on 31/03/2020.
//

import Foundation
import UIKit

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
    let tagline, message: String?

    public init(imageName: String, title: String, version: String, tagline taglineIn: String? = nil, message messageIn: String? = nil) {
        self.imageName = imageName
        self.title = title
        self.version = version
        self.tagline = taglineIn
        self.message = messageIn
    }
}

// MARK: - Section
public struct Section {
    var items: [AboutMenuItem]

    public init(items: [AboutMenuItem]) {
        self.items = items
    }
}

// MARK: - Item
public protocol AboutMenuItem {
    var imageName: String { get }
    var title: String { get }
    var callback: (() -> Void)? { get }
}

public struct Item: AboutMenuItem {

    public var imageName, title: String
    public var callback: (() -> Void)?

    public init(imageName: String, title: String, callback: (() -> Void)?) {
        self.imageName = imageName
        self.title = title
        self.callback = callback
    }
}

public struct UrlItem: AboutMenuItem {
    public var imageName, title: String
    public var callback: (() -> Void)?

    public init(imageName: String, title: String, url: URL) {
        self.imageName = imageName
        self.title = title
        self.callback = {
            UIApplication.shared.open(url, options: [UIApplication.OpenExternalURLOptionsKey : Any]())
        }
    }
}

extension Section {
    var rows: Int {
        return items.count
    }
}
