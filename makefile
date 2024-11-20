all: DataPreparation DataExploration Analysis

DataPreparation:
	make -C src/DataPreparation

DataExploration:
	make -C src/DataExploration

Analysis: DataPreparation
	make -C src/Analysis

clean:
	R -e "unlink('data', recursive = TRUE)"
	R -e "unlink('gen', recursive = TRUE)"