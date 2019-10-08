all: index.html

dist/index.html: dist/rand-1m.bin dist/rand-2m.bin dist/rand-4m.bin dist/rand-8m.bin dist/zero-4m.bin dist/320x240-white.png
	tree -H '.' -L 1 --noreport --charset utf-8 > $@

dist/rand-%.bin: dist
	head -c $* < /dev/urandom > $@

dist/zero-%.bin: dist
	head -c $* < /dev/zero > $@

dist/%-white.png: dist
	convert -size $* canvas:white $@

dist:
	mkdir dist

clean:
	rm -rf dist
