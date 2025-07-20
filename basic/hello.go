package main

import (
	"fmt"
	"runtime"
)

func main() {
	fmt.Printf("Hello from a Go program! The host OS is %s/%s\n", runtime.GOOS, runtime.GOARCH)
}