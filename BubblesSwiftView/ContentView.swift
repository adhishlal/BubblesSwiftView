//
//  ContentView.swift
//  Bubbles
//
//  Created by Adhish on 13/12/24.
//
import SwiftUI

struct StaticCircleView: View {
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)

            Canvas { context, size in
                let center = CGPoint(x: size.width / 2, y: size.height / 2)
                let bigCircleRadius: CGFloat = 100
                let minGap: CGFloat = 10
                let maxGap: CGFloat = 30
                let smallCircleRadiusRange = 5...15
                let smallCircleCount = Int.random(in: 70...120)
                let ringCount = 5

                context.fill(
                    Path(ellipseIn: CGRect(
                        x: center.x - bigCircleRadius,
                        y: center.y - bigCircleRadius,
                        width: bigCircleRadius * 2,
                        height: bigCircleRadius * 2
                    )),
                    with: .color(.white)
                )

                var currentCount = 0
                for ring in 1...ringCount {
                    let ringRadius = bigCircleRadius + CGFloat(ring) * (CGFloat(smallCircleRadiusRange.upperBound * 2) + CGFloat.random(in: minGap...maxGap))
                    let circlesInRing = smallCircleCount / ringCount
                    var placedCircles: [CGPoint] = []

                    for _ in 0..<circlesInRing {
                        if currentCount >= smallCircleCount { break }
                        var validPosition = false
                        var x: CGFloat = 0
                        var y: CGFloat = 0
                        var smallCircleRadius: CGFloat = 0

                        while !validPosition {
                            let angleOffset = CGFloat.random(in: 0..<360) * .pi / 180
                            smallCircleRadius = CGFloat(Int.random(in: smallCircleRadiusRange))
                            x = ringRadius * cos(angleOffset) + center.x
                            y = ringRadius * sin(angleOffset) + center.y
                            let newCircle = CGPoint(x: x, y: y)

                            validPosition = placedCircles.allSatisfy {
                                sqrt(pow($0.x - newCircle.x, 2) + pow($0.y - newCircle.y, 2)) >= smallCircleRadius * 2 + minGap
                            }
                        }

                        placedCircles.append(CGPoint(x: x, y: y))

                        context.fill(
                            Path(ellipseIn: CGRect(
                                x: x - smallCircleRadius,
                                y: y - smallCircleRadius,
                                width: smallCircleRadius * 2,
                                height: smallCircleRadius * 2
                            )),
                            with: .color(Bool.random() ? .green : .red)
                        )
                        currentCount += 1
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Centered text
            Text("98")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(Color(UIColor(red: 0.13, green: 0.20, blue: 0.28, alpha: 1.0)))
        }
    }
}

#Preview {
    StaticCircleView()
}
