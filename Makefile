GHC=ghc
LEX=alex
YACC=happy

.PHONY: clean

bin/plotc: src/Main.hs src/Lexer.hs src/Parser.hs
	$(GHC) $^ -o bin/plotc
	rm -f src/*.o src/*.hi

src/Lexer.hs: src/Lexer.x
	$(LEX) $<

src/Parser.hs: src/Parser.y
	$(YACC) $<

clean:
	rm -f bin/plotc src/*.o src/*.hi