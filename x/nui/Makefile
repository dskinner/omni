examples/triangle:
	GUILE_EXTENSIONS_PATH=$$LIBRARY_PATH guile -L ../ -L . -e main examples/triangle.scm

test: test/gestures

test/gestures:
	GUILE_EXTENSIONS_PATH=$$LIBRARY_PATH guile -L ../ -L . gestures-test.scm

ffi:
	./glfw/genffi.scm > ./glfw/ffi.scm
