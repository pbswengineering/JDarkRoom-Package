.PHONY: clean install uninstall JDarkRoom.jar

BIN_DIR=$(DESTDIR)/usr/bin
SHARE_DIR=$(DESTDIR)/usr/share/jdarkroom
DESKTOP_DIR=$(DESTDIR)/usr/share/applications

JDarkRoom.jar:
	wget 'http://www.codealchemists.com/jdarkroom/download.php?file=JDarkRoom.jar' -O JDarkRoom.jar
	./update_version.py

install: JDarkRoom.jar
	test -d $(BIN_DIR) || mkdir -p $(BIN_DIR)
	test -d $(SHARE_DIR) || mkdir -p $(SHARE_DIR)
	test -d $(DESKTOP_DIR) || mkdir -p $(DESKTOP_DIR)
	cp JDarkRoom.jar $(SHARE_DIR)/
	cp jdarkroom.svg $(SHARE_DIR)/
	cp jdarkroom $(BIN_DIR)/
	cp jdarkroom.desktop $(DESKTOP_DIR)/

uninstall:
	rm -fr $(SHARE_DIR)
	rm -f $(DESTDIR)/usr/bin/jdarkroom

clean:
	rm -f *~ JDarkRoom.jar
