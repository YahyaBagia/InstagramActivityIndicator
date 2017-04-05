# InstagramActivityIndicator (ObjC)
Activity Indicator similar to Instagram's. It is an Objective-C port of [InstagramActivityIndicator](https://github.com/jmmanos/InstagramActivityIndicator)

### Screenshot
![](https://github.com/YahyaBagia/InstagramActivityIndicator/blob/master/InstagramActivityIndicator/InstagramActivityIndicator.gif)

### Installation
Copy InstagramActivityIndicator.h & InstagramActivityIndicator.m files into XCode Project.

### Usage / Installation
#### 1. Using Interface Builder

- Add a UIView on XIB / Storyboard from Interface Builder and change its class from UIView to InstagramActivityIndicator.

![](https://github.com/YahyaBagia/InstagramActivityIndicator/blob/master/InstagramActivityIndicator/img_IdentityInspector.png)

- Customize its properties through Attribute Inspector.
![](https://github.com/YahyaBagia/InstagramActivityIndicator/blob/master/InstagramActivityIndicator/img_AttributeInspector.png)


#### 2. Via Code
```
InstagramActivityIndicator *indicator = [[InstagramActivityIndicator alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
indicator.lineWidth = 3;
indicator.strokeColor = [UIColor brownColor];
indicator.numSegments = 15;
indicator.rotationDuration = 10;
indicator.animationDuration = 1.0;
indicator.center = self.view.center;
[self.view addSubview:indicator];
[indicator startAnimating];
```

### Requirements
iOS 7.0+

### License
MIT License
