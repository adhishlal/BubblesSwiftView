# Bubbles Circle View - SwiftUI

## Overview
This SwiftUI project demonstrates the creation of a dynamic circle-based layout where concentric rings of smaller circles are drawn around a central circle. The smaller circles are randomly positioned and colored in green or red. The center of the view displays a large number ("98") in the middle of the screen.

## Key Features
- **Canvas**: Utilizes the `Canvas` view to create custom drawings.
- **Concentric Rings**: Draws multiple rings of small circles surrounding a large central circle.
- **Randomized Placement and Colors**: Small circles are randomly placed within the rings, ensuring no overlap. Each circle is assigned a random color (green or red).
- **Centered Text**: Displays a large number ("98") in the center of the screen with a custom font style and color.

## Code Walkthrough

### 1. **Main View (StaticCircleView)**
   - The `StaticCircleView` struct is the main view and conforms to the `View` protocol.
   - It consists of a `ZStack` which contains:
     - A white background (`Color.white`) that takes up the entire screen area.
     - A `Canvas` where the concentric rings of circles are drawn.
     - A centered `Text` displaying the number "98".

### 2. **Drawing the Big Circle**
   - The large central circle is drawn with a radius of 100 and filled with the color white, using the `context.fill()` method.
   - This circle serves as the background for the smaller circles to be placed.

### 3. **Generating Rings and Small Circles**
   - The code calculates the radius for each of the 5 concentric rings, each with a varying gap between them.
   - For each ring, a random number of small circles are placed along its circumference, ensuring no overlap with previously placed circles. Each circle is randomly assigned a radius between 5 and 15.
   - The small circles are filled with random colors (either green or red).

### 4. **Text Centered in the View**
   - The `Text` view in the center of the screen displays the number "98" in a bold, large font with a custom color.

## Usage
This view can be used in any SwiftUI-based iOS project to create a visually appealing static circle-based layout. You can customize the number displayed in the center, the size and count of small circles, as well as the colors used.

## Preview

```swift
#Preview {
    StaticCircleView()
}
