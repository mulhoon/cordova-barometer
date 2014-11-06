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