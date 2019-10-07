all: rand-1m.bin rand-2m.bin rand-4m.bin rand-8m.bin zero-4m.bin 320x240-white.png

rand-%.bin:
	head -c $* < /dev/urandom > $@

zero-%.bin:
	head -c $* < /dev/zero > $@

%-white.png:
	convert -size $* canvas:white $@

clean:
	rm -f *.bin *.png
