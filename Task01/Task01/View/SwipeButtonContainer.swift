//
//  SwipeButtonContainer.swift
//  Task01
//
//  Created by Fardan Akhter on 10/11/21.
//

import SwiftUI

struct SwipeButtonContainer: ViewModifier  {
    
    let maxLeadingOffset: CGFloat
    let minTrailingOffset: CGFloat
    
    @State private var offset: CGFloat = 0
    @State private var visibleButton: VisibleButton = .none
    @State private var oldOffset: CGFloat = 0
    
    let leadingButtons: [SwipeButtons]
    let trailingButton: [SwipeButtons]
    
    let action: (SwipeButtons) -> Void
    
    enum VisibleButton {
        case none
        case left
        case right
    }
    
    init(leadingButtons: [SwipeButtons], trailingButton: [SwipeButtons], action: @escaping (SwipeButtons) -> Void) {
        self.leadingButtons = leadingButtons
        self.trailingButton = trailingButton
        maxLeadingOffset = CGFloat(leadingButtons.count) * buttonWidth
        minTrailingOffset = CGFloat(trailingButton.count) * buttonWidth * -1
        self.action = action
    }
    
    func reset() {
        visibleButton = .none
        offset = 0
        oldOffset = 0
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .contentShape(Rectangle())
                .offset(x: offset)
                .gesture(DragGesture(minimumDistance: 15, coordinateSpace: .local)
                            .onChanged({ (value) in
                                let totalSlide = value.translation.width + oldOffset
                                if  (0...Int(maxLeadingOffset) ~= Int(totalSlide)) {
                                    withAnimation{
                                        offset = totalSlide
                                    }
                                }
                                else if (Int(minTrailingOffset)...0 ~= Int(totalSlide)) { // -60 ... 0
                                    withAnimation{
                                        offset = totalSlide
                                    }
                                }
                                else{
                                    if totalSlide < -60 { // right to left
                                        print(totalSlide)
                                        offset = totalSlide
                                    }
                                }
                                ///can update this logic to set single button action with filled single button background if scrolled more then buttons width
                            })
                            .onEnded({ value in
                                withAnimation {
                                    if visibleButton == .left && value.translation.width < -20 { ///user dismisses left buttons
                                        reset()
                                    } else if visibleButton == .right && value.translation.width > 20 { ///user dismisses right buttons
                                        reset()
                                    } else if offset > 25 || offset < -25 { ///scroller more then 50% show button
                                        if offset > 0 {
                                            visibleButton = .left
                                            offset = maxLeadingOffset
                                        } else {
                                            visibleButton = .right
                                            offset = offset < -150 ? offset : minTrailingOffset
                                        }
                                        oldOffset = offset
                                        ///Bonus Handling -> set action if user swipe more then x px
                                    } else {
                                        reset()
                                    }
                                }
                            }))
            GeometryReader { proxy in
                HStack(spacing: 0) {
                    //Leading
                    HStack(spacing: 0) {
                        ForEach(leadingButtons) { buttonsData in
                            Button(action: {
                                withAnimation {
                                    reset()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) { ///call once hide animation done
                                    action(buttonsData)
                                }
                            }, label: {
                                SwipableButton.init(data: buttonsData, cellHeight: proxy.size.height)
                            })
                        }
                    }
                    .offset(x: (-1 * (maxLeadingOffset + 20)) + offset)
                    Spacer()
                    
                    
                    //Trailing
                    HStack(spacing: 0) {
                        ForEach(trailingButton) { buttonsData in
                            Button(action: {
                                withAnimation {
                                    reset()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) { ///call once hide animation done
                                    action(buttonsData)
                                }
                            }, label: {
                                SwipableButton.init(data: buttonsData, cellHeight: proxy.size.height)
                            })
                            .frame(width: buttonWidth)
                        }
                        
                        // Red expanded view
                        Color.red
                            .frame(width: proxy.size.width + 100)
                        //
                    }
                    //
                    .offset(x: oldOffset < -150 ? 0 : (-1 * (minTrailingOffset - 20 - (proxy.size.width + minTrailingOffset))) + offset )
                }
            }
        }
    }
}
