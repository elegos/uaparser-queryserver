# uaparser-queryserver
A simple query server which runs UA-Parser

## Compilation
You can either simply run `./build.sh` (which uses Docker to compile and create a docker image to run the application directly), or do the following:

```bash
go get -t -v ./... # download the dependencies
ninja -t clean # clean eventual outdated out files
ninja # compile the application
```
This will generate an `out` folder with `uaparser` and `regexes.yaml` inside of it.

## Usage
Either run the Docker built image exposing port 8080, or run `uaparser` directly, which will listen on port 8080.

To call the parser, simply go to `http://yoursite:8080/?q={url-encoded user agent string}`
It will generate a JSON like this:
```json
{
	"UserAgent": {
		"Family": "Firefox",
		"Major": "57",
		"Minor": "0",
		"Patch": ""
	},
	"Os": {
		"Family": "Fedora",
		"Major": "",
		"Minor": "",
		"Patch": "",
		"PatchMinor": ""
	},
	"Device": {
		"Family": "Other",
		"Brand": "",
		"Model": ""
	}
}
```
