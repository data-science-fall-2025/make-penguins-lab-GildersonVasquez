
rexec = R CMD BATCH --no-save --no-restore

.PHONY: sims
Sims: output/penguin_report.html


output/penguin_report.html: analysis/penguin_report.qmd
    quarto render $<
    mv $(<D)/$(@D) $@


output/penguin_pairs.png: analysis/plot_penguin.R
    $(rexec) $< output/$(basename $(<F)).html

output/penguin_class.csv: analysis/classify_penguins.R
    $(rexec) $< output($basename $(<F)).html