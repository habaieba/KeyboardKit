//
//  StandardAutocompleteSuggestions.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-09-12.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This struct is a standard result that can be returned by an
 autocomplete suggestion provider.
 */
public struct StandardAutocompleteSuggestion: AutocompleteSuggestion {
    
    public init(
        _ text: String,
        behavior: AutocompleteSuggestionBehavior = .manual,
        isUnknown: Bool = false) {
        self.replacement = text
        self.behavior = behavior
        self.title = text
        self.subtitle = nil
        self.isUnknown = isUnknown
        self.additionalInfo = [:]
    }
    
    public init(
        replacement: String,
        behavior: AutocompleteSuggestionBehavior = .manual,
        title: String? = nil,
        subtitle: String? = nil,
        isUnknown: Bool = false,
        additionalInfo: [String: Any] = [:]) {
        self.replacement = replacement
        self.behavior = behavior
        self.title = title ?? replacement
        self.subtitle = subtitle
        self.isUnknown = isUnknown
        self.additionalInfo = additionalInfo
    }
    
    public let replacement: String
    public let behavior: AutocompleteSuggestionBehavior
    public let isUnknown: Bool
    public let title: String
    public let subtitle: String?
    public let additionalInfo: [String: Any]
}
