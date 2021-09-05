all:
	dmd src/ilex.d -lib -ofsrc/lex.a
	dmd src/istate.d -lib -ofsrc/state.a
	dmd src/iif.d -lib -ofsrc/if.a
	dmd src/igc.d -lib -ofsrc/gc.a
	dmd src/iword.d -lib -ofsrc/word.a
