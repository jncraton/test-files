all: dist/index.html

dist/index.html: dist/rand dist/zero dist/white
	mkdir -p dist
	cd dist && tree -H '.' -L 2 --noreport --charset utf-8 > index.html

dist/rand: dist/rand/1m.bin dist/rand/2m.bin dist/rand/4m.bin dist/rand/8m.bin

dist/zero: dist/zero/1m.bin dist/zero/2m.bin dist/zero/4m.bin dist/zero/8m.bin

dist/white: dist/white/1x1.png dist/white/320x240.png dist/white/640x480.png dist/white/1280x960.png 

dist/rand/%.bin:
	mkdir -p dist/rand
	head -c $* < /dev/urandom > $@

dist/zero/%.bin:
	mkdir -p dist/zero
	head -c $* < /dev/zero > $@

dist/white/%.png:
	mkdir -p dist/white
	convert -size $* canvas:white $@

clean:
	rm -rf dist
