# Cordova barometer plugin

iPhone 6 and iPhone 6 Plus have a built in barometer. Use this plugin to read the atmospheric pressure and relative altitude.

## Installation 

```cordova plugin add https://github.com/mulhoon/cordova-barometer```

## Usage

```javascript
var barometer = navigator.barometer;

barometer.isAvailable(function(value){
	console.log("Barometer is available:" + value);
});

barometer.startUpdates(function(data){
	console.log(data);
	// data.relativeAltitude, data.pressure
	// this polls the barometer every second
});

barometer.stopUpdates();
```
So nest these up to get just one reading...

```javascript
var barometer = navigator.barometer;

barometer.isAvailable(function(value){
	if(value){
		barometer.startUpdates(function(data){
			console.log(data);
			navigator.barometer.stopUpdates();
		});
	}else{
		console.log("No barometer available");
	}
});

```

## License

The MIT License

Copyright (c) 2010-2014 Nic Mulvaney

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


Written by Nic Mulvaney 2014.
Please report any [issues](https://github.com/mulhoon/cordova-barometer/issues) or suggestions.