//
//  WidgetEntryView.swift
//  WidgetEntryView
//
//  Created by David on 25/08/2021.
//

import SwiftUI
import WidgetKit

struct WidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    
    var entry: Provider.Entry
    
    var showPreviousMilestone: Bool {
        return isExtraLargeSize(family: family) || entry.campaign.nextMilestone == nil
    }
    
    var titleFont: Font {
        switch family {
        case .systemSmall:
            return .headline
        case .systemMedium:
            return .title2
        default:
            return .largeTitle
        }
    }
    
    var raisedAmountFont: Font {
        switch family {
        case .systemSmall:
            return .headline
        default:
            return .largeTitle
        }
    }
    
    var shouldShowMilestones: Bool {
        entry.configuration.showMilestones?.boolValue == true
    }
    
    var shouldShouldFullCurrencySymbol: Bool {
        entry.configuration.showFullCurrencySymbol?.boolValue == false
    }
    
    var shouldShowGoalPercentage: Bool {
        entry.configuration.showGoalPercentage?.boolValue == true
    }
    
    var shouldShowMilestonePercentage: Bool {
        entry.configuration.showMilestonePercentage?.boolValue == true
    }

    
    
    
    var body: some View {
        EntryView(campaign: .constant(entry.campaign), showMilestones: shouldShowMilestones, showFullCurrencySymbol: entry.configuration.showFullCurrencySymbol?.boolValue ?? false, showGoalPercentage: shouldShowGoalPercentage, showMilestonePercentage: shouldShowMilestonePercentage)
    }
}
