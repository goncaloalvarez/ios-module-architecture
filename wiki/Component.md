# A Plain UIViewController

We will get started with a simple iOS project to focus on the individual layers of a `Module`.

Our goal is to create a login flow and we will start with a plain `UIViewController` subclass.

Download the source code in [here](https://github.com/dchohfi/ios-module-architecture/blob/master/tutorials/tutorial1) and let's get started.

The first thing we need to have in mind is that our view controllers are some of the classes most tied to the [iOS ecosystem](https://developer.apple.com/documentation/uikit/uiviewcontroller). They contain methods for handling:

- Screen rotation
- Status bar styling
- View state transitions (appear, disappear)
- State preservation when moving from/to background

Just to name a few. In a complex environment, only those responsibilities are enough to fill our view controllers with a lot of code. Thinking about that, it seems a good idea to move things away from them whenever we can. 

The first thing we could do is detach the pure visual objects that are living inside them. All buttons, labels, table views and input fields that compose a screen could live inside another `UIView` subclass that would bind them all together. Here we present the first box of our `Module`:

# Component

- A Component can be described as a pure visual composition of view objects (UIView, NSView, etc) or it's subclasses, including other components. It defines the arrangement of all children visual objects.

- Components should have their sate changed via `Configuration` objects. These objects should fully define every visual and content property of the component, from background colors to attributed strings for every label.

# Advantages

The component approach makes view controllers lighter, free to have the code they inherited from the iOS ecosystem. 

They also enhance our testing capabilities. Since the component is not tied to the iOS lifecycle, we do not need to worry about wheater or not it has been loaded, and other sources of headaches when testing view controllers directly. We can just instantiate the component, udpate it's state and take a snapshot. Simple as that.

Lastly they make accessible only the properties that need to be public (maybe none, with the `Configuration` approach), enhancing the [cohesion](https://en.wikipedia.org/wiki/Cohesion_(computer_science)) of our implementation.

In summary:

- Lighter view controllers
- Visual state changes via component object
- Better testability
- Higher cohesion