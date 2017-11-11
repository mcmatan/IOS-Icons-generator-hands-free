# iOS icon generator

Generate all the app icons needed with a single command.

## Usage

```
./ios-icon-generator [IMAGE]
```

The source image should ideally be square and larger than 180x180, as the current largest icon size is 180x180 (for the iPhone 6 Plus).

The script will create an `AppIcon.appiconset/` directory with all the necessary files and metadata needed by Xcode.

Filenames and sizes come from [Apple's documentation](https://developer.apple.com/library/ios/qa/qa1686/_index.html).

```
├── AppIcon.appiconset
    ├── Contents.json
    ├── Icon-60@2x.png
    ├── Icon-60@3x.png
    ├── Icon-76.png
    ├── Icon-76@2x.png
    ├── Icon-Small-40.png
    ├── Icon-Small-40@2x.png
    ├── Icon-Small-40@3x.png
    ├── Icon-Small.png
    ├── Icon-Small@2x.png
    └── Icon-Small@3x.png
```


## Optimization

The icons will be losslessly compressed via [ImageOptim](https://github.com/pornel/ImageOptim) ([CLI](https://github.com/JamieMason/ImageOptim-CLI)), if available on your machine. The easiest way to install it is with:

```
npm install -g imageoptim-cli
```