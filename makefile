CC = g++
CFLAGS= -Wall -std=c++11
SOU = source
TAR = target
TST = tests
ANS = answer

.PHONY: all clean

all: $(patsubst $(SOU)/%.cc, $(TAR)/%.out, $(wildcard $(SOU)/*.cc))

$(TAR)/%.out: $(SOU)/%.cc
	$(CC) -o $@ $^ $(CFLAGS)

%.test: $(TAR)/%.out
	@(cat $(TST)/$@ | $< > test_log)
	@(test -f $(ANS)/$*.ans || (echo "answer file not found." && exit 1));
	@(echo "-----check diff-----")
	@(diff test_log $(ANS)/$*.ans > diff_log && echo "correct." || echo "WA, check the diff_log.")

%.out: $(TAR)/%.out
	@(./$(TAR)/$@)

mv:
	@(test -f *.cc && mv *.cc $(SOU) || (echo "source not found."));
	@(test -f *.test && mv *.test $(TST) || (echo "test file not found."));
	@(test -f *.ans && mv *.ans $(ANS) || (echo "answer file not found."));

astyle:
	@((test -f $(SOU)/*.cc && astyle --style=kr --indent=spaces=4 --indent-switches --suffix=none $(SOU)/*.cc) || \
		(test -f *.cc && astyle --style=kr --indent=spaces=4 --indent-switches --suffix=none *.cc) || \
		echo "You need at least one .cc file.")

clean:
	$(RM) diff_log test_log
